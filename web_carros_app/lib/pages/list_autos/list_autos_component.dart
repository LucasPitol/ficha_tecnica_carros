import 'package:animations/animations.dart';
import 'package:web_carros_app/models/auto.dart';
import 'package:web_carros_app/models/dtos/filterDto.dart';
import 'package:web_carros_app/pages/overview/overview_component.dart';
import 'package:web_carros_app/pages/shared/app_bar_widget.dart';
import 'package:web_carros_app/pages/shared/loading_widget.dart';
import 'package:web_carros_app/services/auto_service.dart';
import 'package:web_carros_app/utils/styles.dart';
import 'package:flutter/material.dart';

class ListAutosComponent extends StatefulWidget {
  final FilterDto filterDto;
  final Function clearFilterHandler;

  // ListAutosComponent(this.filterDto, this.clearFilterHandler);
  ListAutosComponent({Key key, this.filterDto, this.clearFilterHandler})
      : super(key: key);

  @override
  ListAutosComponentState createState() =>
      ListAutosComponentState(filterDto, clearFilterHandler);
}

class ListAutosComponentState extends State<ListAutosComponent> {
  final FilterDto filterDto;
  final Function clearFilterHandler;
  AutoService _autoService;
  bool listLoading;
  List<Auto> autos;

  ListAutosComponentState(this.filterDto, this.clearFilterHandler) {
    this._autoService = AutoService();
    this.listLoading = false;
    this.autos = [];
  }

  @override
  void initState() {
    super.initState();
    this.getFilteredAutos();
  }

  getFilteredAutos() {
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

  _clearFilters() {
    this.clearFilterHandler();
  }

  Widget _createCard(Auto item) {
    String endYear = (item.endYear == null || item.endYear <= 0)
        ? 'Presente'
        : item.endYear.toString();
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
            child: ListTile(
              title: Text(
                item.brand + ' ' + item.model,
                style: Styles.tileTitleTextStyle,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.version,
                    style: Styles.montTextGrey,
                  ),
                  Text(
                    item.initYear.toString() + ' - ' + endYear,
                    style: Styles.montTextGrey,
                  ),
                ],
              ),
              isThreeLine: true,
              trailing: Container(
                child: Image.network(
                  item.autoImagePathList[0],
                  fit: BoxFit.cover,
                  width: 150,
                ),
              ),
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
              AppBarWidget(),
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
