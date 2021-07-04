import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/utils/styles.dart';

class SelectBrandContainer extends StatefulWidget {
  final List<Brand> brandList;
  final Function selectBrandHandler;
  final Function hideSelectBrandContainerHandler;

  SelectBrandContainer(this.brandList, this.selectBrandHandler,
      this.hideSelectBrandContainerHandler);

  @override
  _SelectBrandContainerState createState() => _SelectBrandContainerState(
      brandList, selectBrandHandler, hideSelectBrandContainerHandler);
}

class _SelectBrandContainerState extends State<SelectBrandContainer> {
  final List<Brand> brandList;
  final Function selectBrandHandler;
  final Function hideSelectBrandContainerHandler;
  List<Brand> brandListFiltered;

  _SelectBrandContainerState(this.brandList, this.selectBrandHandler,
      this.hideSelectBrandContainerHandler) {
    this.brandListFiltered = brandList;
  }

  Widget _createTile(Brand item) {
    return InkWell(
      onTap: () {
        this.selectBrandHandler(item.name);
      },
      child: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item.name,
              style: Styles.montText,
            ),
            Container(
              child: Image.network(
                item.brandImgPath,
                fit: BoxFit.cover,
                width: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Marcas',
            style: Styles.montTextTitle,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: Styles.circularBorderRadius,
            onTap: () {
              this.hideSelectBrandContainerHandler();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: FaIcon(
                FontAwesomeIcons.times,
                size: 22,
                color: Styles.mainTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      color: Styles.cardColor,
      child: Column(
        children: [
          _getAppBar(),
          Container(
            child: Text(
              'Form',
              style: Styles.montText,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children:
                    brandListFiltered.map((item) => _createTile(item)).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
