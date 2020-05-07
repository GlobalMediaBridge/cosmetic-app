import 'package:cosmetic_app/store/palette.dart';
import 'package:cosmetic_app/store/server.dart';
import 'package:cosmetic_app/utils/values/radii.dart';
import 'package:cosmetic_app/widgets/tab_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColorFilterTab extends StatefulWidget {
  Function setUrl;
  ColorFilterTab({@required this.setUrl});
  @override
  _ColorFilterTabState createState() => _ColorFilterTabState();
}

class _ColorFilterTabState extends State<ColorFilterTab> {
  bool colorFilter = false;


  Widget _buildColorList(BuildContext context, Palette palette) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      Color color = palette.getColor(i);
      list.add(GestureDetector(
        onTap: () {
          String id = Provider.of<Palette>(context, listen: false).getId();
          Server.makeup(id, color).then((value) {
            widget.setUrl("${Server.url}/image/$id/${color.value}");
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.width / 5.toInt(),
          width: MediaQuery.of(context).size.width / 6.toInt(),
          decoration: BoxDecoration(
            color: color == null ? Color.fromARGB(255, 174, 174, 174) : color,
            borderRadius: Radii.k5pxRadius,
          ),
          child: Container(),
        ),
      ));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 25, top: 25, right: 25, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    child: TabMenu(
                        text: '컬러',
                        isActive: !colorFilter,
                        tabToggle: () {
                          setState(() {
                            colorFilter = false;
                          });
                        })),
                Expanded(
                    child: TabMenu(
                        text: '필터',
                        isActive: colorFilter,
                        tabToggle: () {
                          setState(() {
                            colorFilter = true;
                          });
                        }))
              ],
            ),
          ),
          Spacer(),
          Container(
              child: Consumer<Palette>(
                  builder: (context, value, child) =>
                      _buildColorList(context, value))),
        ],
      ),
    );
  }
}
