import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/services/brand_service.dart';
import 'package:web_carros_app/utils/styles.dart';

class FilterComponent extends StatefulWidget {
  final FilterDto previousFilter;
  final List<Brand> brandList;

  FilterComponent(this.previousFilter, this.brandList);

  @override
  _FilterComponentState createState() =>
      _FilterComponentState(previousFilter, brandList);
}

class _FilterComponentState extends State<FilterComponent> {
  final _formKey = GlobalKey<FormState>();
  final FilterDto previousFilter;
  List<Brand> brandList;
  BrandService _brandService;

  _FilterComponentState(this.previousFilter, this.brandList) {
    this._brandService = BrandService();
  }

  @override
  void initState() {
    super.initState();
    this._getBrands();
  }

  _getBrands() {
    if (brandList == null || brandList.isEmpty) {
      this._brandService.getBrands().then((value) {
        if (value.success) {
          setState(() {
            this.brandList = value.data;
          });
        }
      });
    }
  }

  _goBack() {
    Navigator.pop(context, null);
  }

  _applyFilter() {
    Navigator.pop(context, FilterDto());
  }

  _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Filtros',
            style: Styles.montTextTitle,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: Styles.circularBorderRadius,
            onTap: () {
              this._goBack();
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
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _getAppBar(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _applyFilter();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Styles.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: Styles.defaultCardBorderRadius,
                    ),
                  ),
                  child: Text(
                    'Buscar',
                    style: TextStyle(
                      color: Styles.mainBackgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
