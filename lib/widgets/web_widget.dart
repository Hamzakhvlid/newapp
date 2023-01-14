import 'package:bot_toast/bot_toast.dart';
import 'package:clickablesvg/screens/data_provider.dart';
import 'package:clickablesvg/widgets/item_list.dart';
import 'package:clickablesvg/widgets/web_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixel_color_image/pixel_color_image.dart';
import 'package:zoom_widget/zoom_widget.dart';

class webWidget extends ConsumerWidget {
  var onHover;
  var onTap;

  webWidget(this.onHover, this.onTap);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: 10,),
                WebSearchBar(),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .83,
                    width: MediaQuery.of(context).size.width * .15,
                    child: ItemList())
              ],
            )),
        Container(
          child: Zoom(
            initScale: 1.0,
            backgroundColor: Colors.white,
            canvasColor: Colors.white,
            colorScrollBars: Colors.white,
            maxZoomWidth: MediaQuery.of(context).size.width * .80,
            maxZoomHeight: MediaQuery.of(context).size.height,
            onTap: () {},
            onPositionUpdate: (Offset position) {},
            onScaleUpdate: (double scale, double zoom) {},
            child: Center(
              child: GestureDetector(
                onTapDown: (details) {
                  print(details.localPosition);
                  print("---------------Orignal offset");
                  ref.read(offsetProvider.notifier).update((state) => Offset(
                      details.localPosition.dx + 170,
                      details.localPosition.dy));
                },
                child: Container(
                    alignment: Alignment.center,
                    child: PixelColor.assetImage(
                      path: ref.watch(imageProvider),
                      onHover: onHover,
                      onTap: onTap,
                    )),
              ),
            ),
          ),
          width: MediaQuery.of(context).size.width * .82,
          height: MediaQuery.of(context).size.height,
        )
      ],
    );
  }
}
