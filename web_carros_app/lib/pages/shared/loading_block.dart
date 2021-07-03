import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_carros_app/utils/styles.dart';

class LoadingBlock extends StatelessWidget {
  final bool loading;

  LoadingBlock(this.loading);

  @override
  Widget build(BuildContext context) {
    return this.loading
        ? ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(accentColor: Styles.primaryColor),
                  child: new CircularProgressIndicator(),
                ),
              ),
            ),
          )
        : new Container();
  }
}
