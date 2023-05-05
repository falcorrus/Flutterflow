import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapbox_search/mapbox_search.dart';
import 'package:provider/provider.dart';
import 'order_model.dart';
export 'order_model.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({
    Key? key,
    this.slug,
  }) : super(key: key);

  final String? slug;

  @override
  _OrderWidgetState createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  late OrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: HappyTestAPIGroup.orderCall.call(
        token: FFAppState().Token,
        slug: widget.slug,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final orderOrderResponse = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: FutureBuilder<ApiCallResponse>(
                      future: YandexCall.call(
                        geokode: valueOrDefault<String>(
                          '${HappyTestAPIGroup.orderCall.city(
                                orderOrderResponse.jsonBody,
                              ).toString()}+${HappyTestAPIGroup.orderCall.adress(
                                orderOrderResponse.jsonBody,
                              ).toString()}',
                          'Москва красная площадь',
                        ),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          );
                        }
                        final staticMapYandexResponse = snapshot.data!;
                        return FlutterFlowStaticMap(
                          location: functions.latLong((YandexCall.latLong(
                            staticMapYandexResponse.jsonBody,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()!
                              .map((e) => e.toString())
                              .toList()),
                          apiKey:
                              'pk.eyJ1IjoibGFwdHlzIiwiYSI6ImNsNnhndml5bzBjdXMzanJ4cnpxajA4N2cifQ.lmFnbGdUcyz_CQo1SA1YPA',
                          style: MapBoxStyle.Outdoors,
                          width: double.infinity,
                          height: 400.0,
                          fit: BoxFit.cover,
                          borderRadius: BorderRadius.circular(0.0),
                          markerColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          cached: true,
                          zoom: 12,
                          tilt: 0,
                          rotation: 0,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight: 812.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 27.0,
                            color: Color(0x4A000000),
                            offset: Offset(0.0, 4.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(26.0),
                          topRight: Radius.circular(26.0),
                        ),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('OrdersList');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 30.0,
                                          icon: Icon(
                                            Icons.chevron_left,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 14.0,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'yuniddj4' /* Назад */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 6.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'h0er11j8' /* Статус заказа */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 8.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 14.0, 0.0),
                                        child: Icon(
                                          Icons.circle,
                                          color: Color(0xFFFFD600),
                                          size: 12.0,
                                        ),
                                      ),
                                      Text(
                                        valueOrDefault<String>(
                                          HappyTestAPIGroup.orderCall
                                              .status(
                                                orderOrderResponse.jsonBody,
                                              )
                                              .toString(),
                                          'error',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 10.0,
                                              letterSpacing: 0.1,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 1.21,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        HappyTestAPIGroup.orderCall
                                            .id(
                                              orderOrderResponse.jsonBody,
                                            )
                                            .toString(),
                                        '0',
                                      ),
                                      textAlign: TextAlign.end,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFFC6C6C6),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 15.0, 0.0, 10.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${HappyTestAPIGroup.orderCall.start(
                                          orderOrderResponse.jsonBody,
                                        ).toString()} - ${HappyTestAPIGroup.orderCall.finish(
                                          orderOrderResponse.jsonBody,
                                        ).toString()}',
                                    'error',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF4460F0),
                                        fontSize: 28.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.bold,
                                        lineHeight: 1.22,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'esk7szrq' /* Заказчик */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF868686),
                                        fontSize: 10.0,
                                        letterSpacing: 0.1,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    '${HappyTestAPIGroup.orderCall.lastName(
                                          orderOrderResponse.jsonBody,
                                        ).toString()} ${HappyTestAPIGroup.orderCall.firstName(
                                          orderOrderResponse.jsonBody,
                                        ).toString()} ${HappyTestAPIGroup.orderCall.middleName(
                                          orderOrderResponse.jsonBody,
                                        ).toString()}',
                                    'error',
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.21,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 15.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '15fc1geb' /* Адрес */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF868686),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.1,
                                                    lineHeight: 1.2,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                orderOrderResponse.jsonBody,
                                                r'''$.client.address''',
                                              ).toString(),
                                              'нет адреса',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.1,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.21,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FutureBuilder<ApiCallResponse>(
                                      future: YandexCall.call(
                                        geokode: valueOrDefault<String>(
                                          '${valueOrDefault<String>(
                                            HappyTestAPIGroup.orderCall
                                                .city(
                                                  orderOrderResponse.jsonBody,
                                                )
                                                .toString(),
                                            'Москва',
                                          )}+${valueOrDefault<String>(
                                            HappyTestAPIGroup.orderCall
                                                .adress(
                                                  orderOrderResponse.jsonBody,
                                                )
                                                .toString(),
                                            '0',
                                          )}',
                                          '0',
                                        ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          );
                                        }
                                        final iconButtonYandexResponse =
                                            snapshot.data!;
                                        return FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 18.0,
                                          borderWidth: 1.0,
                                          buttonSize: 48.0,
                                          icon: Icon(
                                            Icons.map_outlined,
                                            color: Color(0xFF4460F0),
                                            size: 18.0,
                                          ),
                                          onPressed: () async {
                                            await launchURL(
                                                valueOrDefault<String>(
                                              'https://yandex.ru/maps/?pt=${functions.textLat(functions.latLong((YandexCall.latLong(
                                                iconButtonYandexResponse
                                                    .jsonBody,
                                              ) as List).map<String>((s) => s.toString()).toList()!.map((e) => e.toString()).toList()))}',
                                              '0',
                                            ));
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  25.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'u15r5lkb' /* Номер телефона */,
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF868686),
                                                    fontSize: 10.0,
                                                    letterSpacing: 0.1,
                                                    lineHeight: 1.2,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            valueOrDefault<String>(
                                              HappyTestAPIGroup.orderCall
                                                  .phone(
                                                    orderOrderResponse.jsonBody,
                                                  )
                                                  .toString(),
                                              'error',
                                            ),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.1,
                                                  fontWeight: FontWeight.w500,
                                                  lineHeight: 1.21,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 18.0,
                                      borderWidth: 1.0,
                                      buttonSize: 32.0,
                                      icon: Icon(
                                        Icons.phone,
                                        color: Color(0xFF4460F0),
                                        size: 18.0,
                                      ),
                                      onPressed: () async {
                                        await launchURL(
                                            'tel:${valueOrDefault<String>(
                                          HappyTestAPIGroup.orderCall
                                              .phone(
                                                orderOrderResponse.jsonBody,
                                              )
                                              .toString(),
                                          '0',
                                        )}');
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'oebl4o6k' /* Название продукта */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF868686),
                                        fontSize: 10.0,
                                        letterSpacing: 0.1,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    HappyTestAPIGroup.orderCall
                                        .product(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString(),
                                    'error',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.21,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '2lz90pp4' /* Дата встречи */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Color(0xFF868686),
                                        fontSize: 10.0,
                                        letterSpacing: 0.1,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    HappyTestAPIGroup.orderCall
                                        .date(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString(),
                                    'error',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 12.0,
                                        letterSpacing: 0.1,
                                        fontWeight: FontWeight.w500,
                                        lineHeight: 1.21,
                                      ),
                                ),
                              ),
                            ),
                            if (HappyTestAPIGroup.orderCall
                                    .status(
                                      orderOrderResponse.jsonBody,
                                    )
                                    .toString() ==
                                'Ожидает доставку')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await HappyTestAPIGroup.statusCall
                                              .call(
                                            slug: widget.slug,
                                            status: 'meeting_confirmed',
                                            token: FFAppState().Token,
                                          );

                                          context.goNamed(
                                            'Order',
                                            queryParams: {
                                              'slug': serializeParam(
                                                widget.slug,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 300),
                                              ),
                                            },
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'qvqdqakl' /* ПОДТВЕРДИТЬ ВСТРЕЧУ */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF4460F0),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'status',
                                            queryParams: {
                                              'slug': serializeParam(
                                                widget.slug,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'web3kqdc' /* ОТМЕНИТЬ ВСТРЕЧУ */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFEAEAEA),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF5F5F5F),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (HappyTestAPIGroup.orderCall
                                    .status(
                                      orderOrderResponse.jsonBody,
                                    )
                                    .toString() ==
                                'Подтверждение встречи')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 32.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          await HappyTestAPIGroup.statusCall
                                              .call(
                                            slug: widget.slug,
                                            status: 'nacat-vstrecu',
                                            token: FFAppState().Token,
                                          );

                                          context.pushNamed(
                                            'Photos',
                                            queryParams: {
                                              'slug': serializeParam(
                                                widget.slug,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'q26u6430' /* НАЧАТЬ ВСТРЕЧУ */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFF4460F0),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 15.0, 24.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          context.pushNamed(
                                            'status',
                                            queryParams: {
                                              'slug': serializeParam(
                                                widget.slug,
                                                ParamType.String,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'j897glia' /* ОТМЕНИТЬ ВСТРЕЧУ */,
                                        ),
                                        options: FFButtonOptions(
                                          width: 327.0,
                                          height: 48.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: Color(0xFFEAEAEA),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF5F5F5F),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.6,
                                                    fontWeight: FontWeight.bold,
                                                    lineHeight: 1.5,
                                                  ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        showLoadingIndicator: false,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if ((HappyTestAPIGroup.orderCall
                                        .status(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'Ожидает верификации') ||
                                (HappyTestAPIGroup.orderCall
                                        .status(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'Начать встречу'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 15.0, 24.0, 32.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await HappyTestAPIGroup.confirmCall.call(
                                      token: FFAppState().Token,
                                      slug: widget.slug,
                                    );

                                    context.pushNamed(
                                      'Photos',
                                      queryParams: {
                                        'slug': serializeParam(
                                          widget.slug,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'w6o2dlw6' /* ФОТОГРАФИИ */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 327.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF4460F0),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          letterSpacing: 0.6,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                            if ((HappyTestAPIGroup.orderCall
                                        .status(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'Верификация пройдена') ||
                                (HappyTestAPIGroup.orderCall
                                        .status(
                                          orderOrderResponse.jsonBody,
                                        )
                                        .toString() ==
                                    'Верификация не пройдена'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 15.0, 24.0, 32.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                      'status',
                                      queryParams: {
                                        'slug': serializeParam(
                                          widget.slug,
                                          ParamType.String,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'wceoi3es' /* ЗАВЕРШИТЬ ВСТРЕЧУ */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 327.0,
                                    height: 48.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: Color(0xFF4460F0),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          letterSpacing: 0.6,
                                          fontWeight: FontWeight.bold,
                                          lineHeight: 1.5,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  showLoadingIndicator: false,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
