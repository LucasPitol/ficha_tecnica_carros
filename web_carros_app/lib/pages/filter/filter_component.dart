import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/pages/shared/loading_block.dart';
import 'package:web_carros_app/services/brand_service.dart';
import 'package:web_carros_app/utils/styles.dart';

import 'select_brand_container.dart';

class FilterComponent extends StatefulWidget {
  final FilterDto previousFilter;

  FilterComponent(this.previousFilter);

  @override
  _FilterComponentState createState() => _FilterComponentState(previousFilter);
}

class _FilterComponentState extends State<FilterComponent> {
  final FilterDto previousFilter;
  BrandService _brandService;
  List<Brand> brandList;
  bool brandsLoading;
  bool isShowingSelectBrandContainer;
  String selectedBrand;

  _FilterComponentState(this.previousFilter) {
    this._brandService = BrandService();
    this.isShowingSelectBrandContainer = false;
    this.brandsLoading = false;
    this.brandList = [];
  }

  @override
  void initState() {
    super.initState();
  }

  showSelectBrandContainer() async {
    if (brandList.isEmpty) {
      await this._getBrands();
    }

    setState(() {
      this.isShowingSelectBrandContainer = true;
    });
  }

  selectBrandHandler(String brand) {
    if (brand != null && brand.isNotEmpty) {
      setState(() {
        this.selectedBrand = brand;
      });

      this.hideSelectBrandContainer();
    }
  }

  _getBrands() async {
    setState(() {
      this.brandsLoading = true;
    });

    var res = await this._brandService.getBrands();

    this.brandList = res.data;

    setState(() {
      this.brandsLoading = false;
    });
  }

  hideSelectBrandContainer() {
    setState(() {
      this.isShowingSelectBrandContainer = false;
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
                  SizedBox(
                    width: double.infinity,
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      showSelectBrandContainer();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Marca',
                            style: Styles.montText,
                          ),
                          (selectedBrand == null || selectedBrand.isEmpty)
                              ? FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.grey.shade400,
                                  size: 18,
                                )
                              : Text(
                                  selectedBrand,
                                  style: Styles.montTextGrey,
                                ),
                        ],
                      ),
                    ),
                  ),
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
                    _applyFilter();
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
            isShowingSelectBrandContainer
                ? SelectBrandContainer(this.brandList, this.selectBrandHandler,
                    hideSelectBrandContainer)
                : Container(),
          ],
        ),
      ),
    );
  }
}
