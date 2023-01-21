import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:clickablesvg/data_provider.dart';
import 'package:clickablesvg/widgets/mobile_widget.dart';
import 'package:clickablesvg/widgets/web_widget.dart';
import 'package:flutter/material.dart';



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  /// While Hoverring
 final Size windowSize = MediaQueryData.fromWindow(window).size;
late Offset screenOffset =
   Offset(windowSize.width / 2, windowSize.height / 2);
  @override
  void onHover(int x, int y, Color color) async {}

  /// When tap
  void onTap(int x, int y, Color color) async {
    var data = ref.watch(colorMap)[color];

    if (data != null) {
      Future.delayed(Duration(milliseconds: 300)).then((value) {
        print(ref.read(offsetProvider));

        BotToast.showAttachedWidget(
            attachedBuilder: (_) => Container(
              
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(15),topLeft: Radius.circular(15),topRight: Radius.circular(15)), 
               color: color
              ),
              height: MediaQuery.of(context).size.height*.08,
              child: Card(
                elevation: 0,
                borderOnForeground: false,
                   
                    
                    key: UniqueKey(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(data,textAlign: TextAlign.center,).tr(),
                    ),
                  ),
            ),
            duration: Duration(seconds: 4),
            //here you can use offset provider 
            target: screenOffset);
      });
    }
  }

  final AssetImage basementImage = const AssetImage("basement.png");

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: MediaQuery.of(context).size.width > 800
            ? webWidget(onHover, onTap)
            : SafeArea(
                child: MobileWidget(onTap, onHover),
              ));
  }
}
