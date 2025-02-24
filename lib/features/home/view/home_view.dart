import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_blue/flutter_blue.dart';

import '../../../core/constants/translation.dart';
import '../../../core/di/get_it.dart';
import '../../main/model/qr_model.dart';
import '../repo/home_repo.dart';
import '../view_model/home_cubit.dart';
import 'widgets/custom_stack.dart';
import 'widgets/custom_stack_header.dart';
import 'widgets/qr_type_box.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return CustomStack(
          header: CustomStackHeader(
            data: Translation.createQr.tr(),
          ),
          child: Stack(children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Opacity(
                    opacity: 0.3,
                    child: Image.asset("assets/images/portfolio_qr.jpg")),
              ),
            ),
            Column(children: [
              GridView.builder(
                shrinkWrap: true,
                itemCount: context.read<HomeCubit>().qrTypes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) => QrTypeBox(
                  qrModel: context.read<HomeCubit>().qrTypes[index]['qrModel']
                      as QrModel,
                  onTap: () {
                    GoRouter.of(context).pushNamed(
                      context.read<HomeCubit>().qrTypes[index]['route']
                          as String,
                    );
                  },
                ),
              )
            ]),
          ]),
        );
      }),
    );
  }
}

class Connect {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  void scanForDevices() {
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
        if (r.device.name == 'ESP32_Data_Bridge') {
          connectToDevice(r.device);
        }
      }
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    await device.connect();
    print('Connected to ${device.name}');
  }

  void readData(BluetoothDevice device) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) async {
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        if (c.properties.read) {
          var value = await c.read();
          print('Read value: $value');
        }
      }
    });
  }

  void writeData(BluetoothDevice device, String data) async {
    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) async {
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        if (c.properties.write) {
          await c.write(utf8.encode(data));
          print('Data written: $data');
        }
      }
    });
  }
}
