import 'package:animations/animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_carros_app/models/auto.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/pages/overview/overview_component.dart';
import 'package:web_carros_app/pages/shared/loading_widget.dart';
import 'package:web_carros_app/services/auto_service.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:flutter/material.dart';

class ListAutosComponent extends StatefulWidget {
  final FilterDto filterDto;
  final Function clearFilterHandler;

  ListAutosComponent(this.filterDto, this.clearFilterHandler);

  @override
  _ListAutosComponentState createState() =>
      _ListAutosComponentState(filterDto, clearFilterHandler);
}

class _ListAutosComponentState extends State<ListAutosComponent> {
  final FilterDto filterDto;
  final Function clearFilterHandler;
  AutoService _autoService;
  bool listLoading;
  List<Auto> autos;

  _ListAutosComponentState(this.filterDto, this.clearFilterHandler) {
    this._autoService = AutoService();
    this.listLoading = false;
    this.autos = [];
  }

  @override
  void initState() {
    super.initState();
    this._getFilteredAutos();
  }

  _goToSettings() {
    print('settings');
  }

  _getFilteredAutos() {
    setState(() {
      this.listLoading = true;
    });

    this.autos = [];

    this._autoService.getFilteredAutos(filterDto).then((value) {
      if (value == null) {
        // tratar server erro
      } else {
        if (value.success) {
          this.autos = value.data;
        } else {
          // tratar erro
        }
      }

      setState(() {
        this.listLoading = false;
      });
    });
  }

  _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Styles.appTitle,
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: Styles.circularBorderRadius,
            onTap: () {
              this._goToSettings();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: FaIcon(
                FontAwesomeIcons.bars,
                size: 22,
                color: Styles.mainTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _clearFilters() {
    this.clearFilterHandler();
  }

  Widget _createCard(Auto item) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 5, left: 20, right: 20),
      width: double.infinity,
      child: OpenContainer(
        openColor: Styles.cardColor,
        closedColor: Styles.cardColor,
        closedElevation: 2,
        closedShape: RoundedRectangleBorder(
            borderRadius: Styles.defaultCardBorderRadius),
        onClosed: (val) {
          // if (refresh) {
          //   this.updatePageContent();
          //   this.refresh = false;
          // }
          // updateAppBar();
        },
        openBuilder: (context, action) {
          return OverviewComponent(item);
        },
        closedBuilder: (context, action) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.brand,
                        style: Styles.tileTitleTextStyle,
                      ),
                      Text(
                        item.model,
                        style: Styles.montText,
                      ),
                      Text(
                        item.version,
                        style: Styles.montTextGrey,
                      ),
                    ],
                  ),
                ),
                Text(
                  item.year.toString(),
                  style: Styles.montText,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              _getAppBar(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.topRight,
                child: TextButton(
                  style: Styles.textButtonStyle,
                  onPressed: () {
                    _clearFilters();
                  },
                  child: Text('Limpar filtros'),
                ),
              ),
              this.listLoading
                  ? Container()
                  : Flexible(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: this.autos.isEmpty
                            ? Container(
                                margin: EdgeInsets.only(top: 40),
                                child: Text(
                                  'Nenhum veículo encontrado',
                                  style: Styles.montTextGrey,
                                ),
                              )
                            : Column(
                                children: autos
                                    .map((item) => _createCard(item))
                                    .toList(),
                              ),
                      ),
                    ),
            ],
          ),
          this.listLoading ? LoadingWidget() : Container(),
        ],
      ),
    );
  }
}
