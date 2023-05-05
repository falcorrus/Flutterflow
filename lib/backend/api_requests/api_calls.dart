import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start HappyTest API Group Code

class HappyTestAPIGroup {
  static String baseUrl = 'https://hd.justds.ru/api/v1';
  static Map<String, String> headers = {};
  static AgentsCall agentsCall = AgentsCall();
  static LoginCall loginCall = LoginCall();
  static UserCall userCall = UserCall();
  static OrdersCall ordersCall = OrdersCall();
  static OrderCall orderCall = OrderCall();
  static DeleteCall deleteCall = DeleteCall();
  static MediaCall mediaCall = MediaCall();
  static OrdershistoryCall ordershistoryCall = OrdershistoryCall();
  static MeetingCall meetingCall = MeetingCall();
  static RefusalCall refusalCall = RefusalCall();
  static VerifyCall verifyCall = VerifyCall();
  static NOContactCall nOContactCall = NOContactCall();
  static ConfirmCall confirmCall = ConfirmCall();
  static StatusesCall statusesCall = StatusesCall();
  static StatusCall statusCall = StatusCall();
}

class AgentsCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'agents ',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/agents',
      callType: ApiCallType.GET,
      headers: {
        ...HappyTestAPIGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class UserCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrdersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Orders',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders',
      callType: ApiCallType.GET,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic adres(dynamic response) => getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start''',
        true,
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data[:].finish''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      );
  dynamic upfatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].updated_at''',
        true,
      );
  dynamic slug(dynamic response) => getJsonField(
        response,
        r'''$.data[:].slug''',
        true,
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.name''',
        true,
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.data[:].product.name''',
        true,
      );
  dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].customer.name''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
}

class OrderCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'order',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}',
      callType: ApiCallType.GET,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.data.city.name''',
      );
  dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.data.customer.name''',
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.data.product.name''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  dynamic photoList(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].link''',
        true,
      );
  dynamic listUrl(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].url''',
        true,
      );
}

class DeleteCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete',
      apiUrl:
          '${HappyTestAPIGroup.baseUrl}/order/${slug}/media/delete/${taskNo}',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class MediaCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
    FFUploadedFile? media,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Media',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/media/${taskNo}',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Accept': 'multipart/form-data',
      },
      params: {
        'media': media,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class OrdershistoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ordershistory',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/orders/history',
      callType: ApiCallType.GET,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class MeetingCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
    String? date = '',
    String? start = '',
    String? finish = '',
  }) {
    final body = '''
{
  "date": "${date}",
  "start": "${start}",
  "finish": "${finish}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'meeting',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/meeting',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RefusalCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
    String? status = '',
  }) {
    final body = '''
{
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'refusal',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/refusal',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerifyCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verify',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/verify',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NOContactCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'NOContact',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/no_contact',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ConfirmCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Confirm',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/confirmed',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'slug': slug,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StatusesCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statuses',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/statuses',
      callType: ApiCallType.GET,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'all': "all",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StatusCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? status = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'status',
      apiUrl: '${HappyTestAPIGroup.baseUrl}/order/${slug}/status/${status}',
      callType: ApiCallType.POST,
      headers: {
        ...HappyTestAPIGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End HappyTest API Group Code

/// Start HT API new Group Code

class HTAPINewGroup {
  static String baseUrl = 'http://62.109.3.38:30020/api/v1';
  static Map<String, String> headers = {};
  static AgentsNewCall agentsNewCall = AgentsNewCall();
  static LoginNewCall loginNewCall = LoginNewCall();
  static UserNewCall userNewCall = UserNewCall();
  static OrdersNewCall ordersNewCall = OrdersNewCall();
  static OrderNewCall orderNewCall = OrderNewCall();
  static DeleteNewCall deleteNewCall = DeleteNewCall();
  static MediaNewCall mediaNewCall = MediaNewCall();
  static OrdersHistoryCall ordersHistoryCall = OrdersHistoryCall();
  static MeetingNewCall meetingNewCall = MeetingNewCall();
  static RefusalNewCall refusalNewCall = RefusalNewCall();
  static VerifyNewCall verifyNewCall = VerifyNewCall();
  static NOContactNewCall nOContactNewCall = NOContactNewCall();
  static ConfirmNewCall confirmNewCall = ConfirmNewCall();
  static StatusesNewCall statusesNewCall = StatusesNewCall();
  static StatusNewCall statusNewCall = StatusNewCall();
}

class AgentsNewCall {
  Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'agents new',
      apiUrl: '${HTAPINewGroup.baseUrl}/agents',
      callType: ApiCallType.GET,
      headers: {
        ...HTAPINewGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginNewCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login new',
      apiUrl: '${HTAPINewGroup.baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic token(dynamic response) => getJsonField(
        response,
        r'''$.token''',
      );
}

class UserNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'user new',
      apiUrl: '${HTAPINewGroup.baseUrl}/user',
      callType: ApiCallType.GET,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class OrdersNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Orders new',
      apiUrl: '${HTAPINewGroup.baseUrl}/orders',
      callType: ApiCallType.GET,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  dynamic adres(dynamic response) => getJsonField(
        response,
        r'''$.data[:].address''',
        true,
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data[:].date''',
        true,
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data[:].start''',
        true,
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data[:].finish''',
        true,
      );
  dynamic createdAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].created_at''',
        true,
      );
  dynamic updatedAt(dynamic response) => getJsonField(
        response,
        r'''$.data[:].updated_at''',
        true,
      );
  dynamic slug(dynamic response) => getJsonField(
        response,
        r'''$.data[:].slug''',
        true,
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$.data[:].status.name''',
        true,
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.data[:].product.name''',
        true,
      );
  dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.data[:].customer.name''',
        true,
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
}

class OrderNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'order new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}',
      callType: ApiCallType.GET,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
  dynamic city(dynamic response) => getJsonField(
        response,
        r'''$.data.city.name''',
      );
  dynamic customer(dynamic response) => getJsonField(
        response,
        r'''$.data.customer.name''',
      );
  dynamic product(dynamic response) => getJsonField(
        response,
        r'''$.data.product.name''',
      );
  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data.id''',
      );
  dynamic photoList(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].link''',
        true,
      );
  dynamic listUrl(dynamic response) => getJsonField(
        response,
        r'''$.data.media[:].url''',
        true,
      );
}

class DeleteNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Delete new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/media/delete/${taskNo}',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class MediaNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
    int? taskNo,
    FFUploadedFile? media,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Media new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/media/${taskNo}',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
        'Accept': 'multipart/form-data',
      },
      params: {
        'media': media,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic adress(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  dynamic date(dynamic response) => getJsonField(
        response,
        r'''$.data.date''',
      );
  dynamic start(dynamic response) => getJsonField(
        response,
        r'''$.data.start''',
      );
  dynamic finish(dynamic response) => getJsonField(
        response,
        r'''$.data.finish''',
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.data.status.name''',
      );
  dynamic lastName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.lastname''',
      );
  dynamic firstName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.firstname''',
      );
  dynamic middleName(dynamic response) => getJsonField(
        response,
        r'''$.data.client.middlename''',
      );
  dynamic adresClient(dynamic response) => getJsonField(
        response,
        r'''$.data.client.address''',
      );
  dynamic phone(dynamic response) => getJsonField(
        response,
        r'''$.data.client.phone''',
      );
}

class OrdersHistoryCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ordersHistory',
      apiUrl: '${HTAPINewGroup.baseUrl}/orders/history',
      callType: ApiCallType.GET,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class MeetingNewCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
    String? date = '',
    String? start = '',
    String? finish = '',
  }) {
    final body = '''
{
  "date": "${date}",
  "start": "${start}",
  "finish": "${finish}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'meeting new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/meeting',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RefusalNewCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
    String? status = '',
  }) {
    final body = '''
{
  "status": "${status}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'refusal new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/refusal',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class VerifyNewCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'verify new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/verify',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NOContactNewCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'NOContact new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/no_contact',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ConfirmNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? slug = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Confirm new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/confirmed',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'slug': slug,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StatusesNewCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'statuses new',
      apiUrl: '${HTAPINewGroup.baseUrl}/statuses',
      callType: ApiCallType.GET,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'all': "all",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StatusNewCall {
  Future<ApiCallResponse> call({
    String? slug = '',
    String? status = '',
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'status new',
      apiUrl: '${HTAPINewGroup.baseUrl}/order/${slug}/status/${status}',
      callType: ApiCallType.POST,
      headers: {
        ...HTAPINewGroup.headers,
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End HT API new Group Code

class YandexCall {
  static Future<ApiCallResponse> call({
    String? geokode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Yandex',
      apiUrl: 'https://geocode-maps.yandex.ru/1.x/',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apikey': "e3e49124-38b3-4ced-8569-ce6e91b6c826",
        'geocode': geokode,
        'format': "json",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic latLong(dynamic response) => getJsonField(
        response,
        r'''$.response.GeoObjectCollection.featureMember[:].GeoObject.boundedBy.Envelope.lowerCorner''',
        true,
      );
}

class HttpshdjustdsruorderbabcedbeacmediaCall {
  static Future<ApiCallResponse> call({
    String? token = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: ' httpshdjustdsruorderbabcedbeacmedia',
      apiUrl:
          'https://hd.justds.ru/order/8b686a0b-333c-11ed-b4e7-0242ac140012/media/1',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class HttpsmailhappyphoneruapivloginCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'httpsmailhappyphoneruapivlogin',
      apiUrl: 'https://mail.happy-phone.ru:4843/api/v1/login',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
