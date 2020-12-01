import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:propiedades/src/providers/providers.dart';
import 'package:propiedades/src/themes/styles.dart';

class PropiedadesMapList extends HookWidget {
  final PageController _pageController;
  final int index;

  PropiedadesMapList(this.index, this._pageController);

  @override
  Widget build(BuildContext context) {
    final propiedades = useProvider(propiedadesProvider);
    final width = MediaQuery.of(context).size.width;

    return propiedades.when(
      error: (e, s) => Text('Error $e'),
      loading: () => Center(child: CircularProgressIndicator()),
      data: (propiedad) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (BuildContext context, Widget widget) {
            double value = 1;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page - index;
              value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
            }
            return Center(
              child: SizedBox(
                height: Curves.easeInOut.transform(value) * 125.0,
                width: Curves.easeInOut.transform(value) * 350.0,
                child: widget,
              ),
            );
          },
          child: InkWell(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 20.0,
                    ),
                    width: width * 0.70,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/house.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(flex: 1, child: SizedBox()),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  propiedad[index].alias,
                                  style: smallText,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  propiedad[index].calle,
                                  style: smallText,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  width: width * 0.40,
                                  child: Text(
                                    propiedad[index].colonia,
                                    style: smallText,
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: SizedBox()),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
