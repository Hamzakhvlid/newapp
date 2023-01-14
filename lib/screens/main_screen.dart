import 'package:bot_toast/bot_toast.dart';
import 'package:clickablesvg/screens/data_provider.dart';
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

  @override
  void onHover(int x, int y, Color color) async {}

  /// When tap
  void onTap(int x, int y, Color color) async {
    var data = ref.watch(colorMap)[color];

    if (data != null) {
      Future.delayed(Duration(milliseconds: 300)).then((value) {
        print(ref.read(offsetProvider));

        BotToast.showAttachedWidget(
            attachedBuilder: (_) => Card(
                  color: color,
                  key: UniqueKey(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data).tr(),
                  ),
                ),
            duration: Duration(seconds: 4),
            target: ref.read(offsetProvider));
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
