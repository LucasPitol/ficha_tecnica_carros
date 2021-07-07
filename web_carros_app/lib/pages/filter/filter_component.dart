import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/pages/shared/loading_block.dart';
import 'package:web_carros_app/services/brand_service.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/models/brand.dart';
import 'package:web_carros_app/models/tuple.dart';
import 'package:web_carros_app/models/model.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:flutter/material.dart';

import 'select_brand_container.dart';
import 'year_bottom_sheet_component.dart';

class FilterComponent extends StatefulWidget {
  final FilterDto previousFilter;

  FilterComponent(this.previousFilter);

  @override
  _FilterComponentState createState() => _FilterComponentState(previousFilter);
}

class _FilterComponentState extends State<FilterComponent> {
  final FilterDto previousFilter;
  FilterDto newFilter;
  BrandService _brandService;
  List<Brand> brandList;
  List<Model> modelList;
  bool brandsLoading;
  bool modelsLoading;
  bool isShowingSelectBrandContainer;
  bool isShowingSelectModelContainer;
  Brand selectedBrand;
  Model selectedModel;
  int initYear;
  int endYear;

  _FilterComponentState(this.previousFilter) {
    this._brandService = BrandService();
    this.newFilter = previousFilter;
    this.selectedBrand = previousFilter.brand;
    this.isShowingSelectBrandContainer = false;
    this.isShowingSelectModelContainer = false;
    this.brandsLoading = false;
    this.brandList = [];
    this.modelList = [];
    this.initYear = previousFilter.initYear;
    this.endYear = previousFilter.endYear;
    this.newFilter.initYear = initYear;
    this.newFilter.endYear = endYear;
  }

  @override
  void initState() {
    super.initState();
  }

  showSelectModelContainer() async {
    if (modelList.isEmpty) {
      await this._getModels();
    }

    setState(() {
      this.isShowingSelectModelContainer = true;
    });
  }

  selectModelHandler(Model model) {
    if (model != null && model.id != null) {
      setState(() {
        this.selectedModel = model;
      });

      this.hideSelectModelContainer();
    }
  }

  showSelectBrandContainer() async {
    if (brandList.isEmpty) {
      await this._getBrands();
    }

    setState(() {
      this.isShowingSelectBrandContainer = true;
    });
  }

  selectBrandHandler(Brand brand) {
    if (brand != null && brand.id != null) {
      setState(() {
        this.selectedBrand = brand;
      });

      this.newFilter.brand = this.selectedBrand;

      this.hideSelectBrandContainer();
    }
  }

  _getModels() async {
    setState(() {
      this.modelsLoading = true;
    });

    String brandId = this.selectedBrand.id;

    var res = await this._brandService.getModelsByBrandId(brandId);
    print(brandId);
    this.modelList = res.data;

    setState(() {
      this.modelsLoading = false;
    });
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

  hideSelectModelContainer() {
    setState(() {
      this.isShowingSelectModelContainer = false;
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

  showSelectYearBottomSheet() async {
    Future<Tuple<int, int>> selectedValue = showModalBottomSheet(
        context: context,
        builder: (builder) {
          return YearBottomSheetComponent(this.initYear, this.endYear);
        });
    selectedValue.then((value) {
      if (value != null) {
        setState(() {
          this.initYear = value.a;
          this.endYear = value.b;
        });

        this.newFilter.initYear = initYear;
        this.newFilter.endYear = endYear;
      }
    });
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
                    height: 20,
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
                          (selectedBrand == null || selectedBrand.id == null)
                              ? FaIcon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.grey.shade400,
                                  size: 18,
                                )
                              : Text(
                                  selectedBrand.name,
                                  style: Styles.montTextGrey,
                                ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  //   child: Divider(
                  //     color: Colors.grey.shade900,
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     showSelectModelContainer();
                  //   },
                  //   child: Container(
                  //     padding:
                  //         EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Modelo',
                  //           style: Styles.montText,
                  //         ),
                  //         (selectedModel == null || selectedModel.id == null)
                  //             ? FaIcon(
                  //                 FontAwesomeIcons.plus,
                  //                 color: Colors.grey.shade400,
                  //                 size: 18,
                  //               )
                  //             : Text(
                  //                 selectedModel.name,
                  //                 style: Styles.montTextGrey,
                  //               ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Divider(
                      color: Colors.grey.shade900,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showSelectYearBottomSheet();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ano',
                            style: Styles.montText,
                          ),
                          Text(
                            'De ' +
                                this.initYear.toString() +
                                ' até ' +
                                this.endYear.toString(),
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
