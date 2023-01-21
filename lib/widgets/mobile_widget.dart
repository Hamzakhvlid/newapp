import 'package:clickablesvg/data_provider.dart';
import 'package:clickablesvg/widgets/item_list.dart';
import 'package:clickablesvg/widgets/web_searchbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixel_color_image/pixel_color_image.dart';
import 'package:zoom_widget/zoom_widget.dart';

class MobileWidget extends ConsumerWidget {
  var onTap;
  var onHover;
  MobileWidget(this.onTap, this.onHover);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Column(
            children: [
              WebSearchBar(),
            ],
          ),
          Container(
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * .08
                : MediaQuery.of(context).size.height * .15,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ItemList(),
            ),
          ),
          Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * .83
                  : MediaQuery.of(context).size.height * .67,
              child: Zoom(
                  colorScrollBars: Colors.white,
                  canvasColor: Colors.white,
                  backgroundColor: Colors.white,
                  maxZoomWidth: MediaQuery.of(context).size.width,
                  maxZoomHeight: MediaQuery.of(context).size.height * .87,
                  onTap: () {},
                  onPositionUpdate: (Offset position) {},
                  onScaleUpdate: (double scale, double zoom) {},
                  child: Center(
                    child: GestureDetector(
                      onTap: () => print("tap called"),
                      onTapUp: (details) {
                          print("tap up called");

                        ref.read(offsetProvider.notifier).update((state) =>
                            Offset(details.localPosition.dx,
                                details.localPosition.dy+300));
                        print(ref.read(offsetProvider));
                      },
                      onTapDown: (details) {
                        print("tap called");

                        ref.read(offsetProvider.notifier).update((state) =>
                        MediaQuery.of(context).orientation==Orientation.landscape?
                            Offset(details.localPosition.dx+200,
                                details.localPosition.dy+150):Offset(details.localPosition.dx,
                                details.localPosition.dy+300));
                        print(ref.read(offsetProvider));
                      },
                      child: Container(
                          child: PixelColor.assetImage(
                        path: ref.watch(imageProvider),
                        onHover: onHover,
                        onTap: onTap,
                    
                      )),
                    ),
                  )))
        ]));
  }
}
