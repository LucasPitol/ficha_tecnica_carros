import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/pages/shared/loading_block.dart';
import 'package:web_carros_app/services/brand_service.dart';
import 'package:web_carros_app/utils/styles.dart';

class FilterComponent extends StatefulWidget {
  final FilterDto previousFilter;

  FilterComponent(this.previousFilter);

  @override
  _FilterComponentState createState() => _FilterComponentState(previousFilter);
}

class _FilterComponentState extends State<FilterComponent> {
  final _formKey = GlobalKey<FormState>();
  final FilterDto previousFilter;
  BrandService _brandService;
  List<Brand> brandList;
  bool brandsLoading;

  _FilterComponentState(this.previousFilter) {
    this._brandService = BrandService();
  }

  @override
  void initState() {
    super.initState();
    this._getBrands();
  }

  _getBrands() {
    setState(() {
      this.brandsLoading = true;
    });

    this._brandService.getBrands().then((value) {
      if (value.success) {
        this.brandList = value.data;
        
        setState(() {
          this.brandsLoading = false;
        });
      }
    });
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
            LoadingBlock(this.brandsLoading),
          ],
        ),
      ),
    );
  }
}
