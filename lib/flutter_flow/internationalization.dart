import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'i79que5t': {
      'ru': 'Вход',
      'en': '',
    },
    'kspilj4c': {
      'ru': 'Почта',
      'en': '',
    },
    '55jbk8r9': {
      'ru': 'Пароль',
      'en': '',
    },
    'inqcrg58': {
      'ru': 'ВОЙТИ',
      'en': '',
    },
    '7iqehjum': {
      'ru': 'ЗАБЫЛИ ПАРОЛЬ?',
      'en': '',
    },
    'q6jyn82h': {
      'ru': 'Home',
      'en': '',
    },
  },
  // OrdersList
  {
    'cyuzu83j': {
      'ru': 'Мои заявки',
      'en': '',
    },
    'phrrrq9h': {
      'ru': 'В работе',
      'en': '',
    },
    'hhh65ad8': {
      'ru': 'Выполнено',
      'en': '',
    },
    'cjgpum5c': {
      'ru': 'В работе',
      'en': '',
    },
    'quxyza65': {
      'ru': 'Выполнено',
      'en': '',
    },
    'zycqyj8a': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Order
  {
    'yuniddj4': {
      'ru': 'Назад',
      'en': '',
    },
    'h0er11j8': {
      'ru': 'Статус заказа',
      'en': '',
    },
    'esk7szrq': {
      'ru': 'Заказчик',
      'en': '',
    },
    '15fc1geb': {
      'ru': 'Адрес',
      'en': '',
    },
    'u15r5lkb': {
      'ru': 'Номер телефона',
      'en': '',
    },
    'oebl4o6k': {
      'ru': 'Название продукта',
      'en': '',
    },
    '2lz90pp4': {
      'ru': 'Дата встречи',
      'en': '',
    },
    'qvqdqakl': {
      'ru': 'ПОДТВЕРДИТЬ ВСТРЕЧУ',
      'en': '',
    },
    'web3kqdc': {
      'ru': 'ОТМЕНИТЬ ВСТРЕЧУ',
      'en': '',
    },
    'q26u6430': {
      'ru': 'НАЧАТЬ ВСТРЕЧУ',
      'en': '',
    },
    'j897glia': {
      'ru': 'ОТМЕНИТЬ ВСТРЕЧУ',
      'en': '',
    },
    'w6o2dlw6': {
      'ru': 'ФОТОГРАФИИ',
      'en': '',
    },
    'wceoi3es': {
      'ru': 'ЗАВЕРШИТЬ ВСТРЕЧУ',
      'en': '',
    },
    'r33chrif': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Photos
  {
    'st5pbpgi': {
      'ru': 'Назад',
      'en': '',
    },
    '6v1wpxls': {
      'ru': 'Фото документов',
      'en': '',
    },
    '3kii44dt': {
      'ru': 'Список фото',
      'en': '',
    },
    'th26ig05': {
      'ru': 'ОТПРАВИТЬ НА ВЕРИФИКАЦИЮ',
      'en': '',
    },
    'knvvshkk': {
      'ru': 'Home',
      'en': '',
    },
  },
  // statusMoveMeeting
  {
    'm5fby93n': {
      'ru': 'Назад',
      'en': '',
    },
    '55qr61bu': {
      'ru': 'Перенос встречи',
      'en': '',
    },
    'sy1wenxi': {
      'ru': 'Время старта',
      'en': '',
    },
    'mkzngsml': {
      'ru': 'Время окончания',
      'en': '',
    },
    '76vwoawz': {
      'ru': 'ПЕРЕНЕСТИ',
      'en': '',
    },
    'yn5gsn2z': {
      'ru': 'Home',
      'en': '',
    },
  },
  // status
  {
    '5uvaj1jl': {
      'ru': 'Назад',
      'en': '',
    },
    '6gf9ip4h': {
      'ru': 'Верификация пройдена',
      'en': '',
    },
    'tb74gofy': {
      'ru': 'Верификация не пройдена',
      'en': '',
    },
    'vs8tao1v': {
      'ru': 'Отмена встречи',
      'en': '',
    },
    'sg7363yn': {
      'ru': 'Информация о встрече',
      'en': '',
    },
    'mdc4jmwf': {
      'ru': 'ID заказа',
      'en': '',
    },
    '9q8a7xht': {
      'ru': 'ID Заказа',
      'en': '',
    },
    'qxspnkak': {
      'ru': 'Заказчик',
      'en': '',
    },
    'jtwwnld5': {
      'ru': 'Адрес',
      'en': '',
    },
    'uj8s1mrq': {
      'ru': 'Номер телефона',
      'en': '',
    },
    '0ykzqw4c': {
      'ru': 'Выберите причину',
      'en': '',
    },
    'dtw6tczw': {
      'ru': 'Карта выдана',
      'en': '',
    },
    'gv44x5es': {
      'ru': 'Направлен в ДО',
      'en': '',
    },
    'yql88nlh': {
      'ru': 'Отказ клиента',
      'en': '',
    },
    '7lmq5kn7': {
      'ru': 'Отказ банка',
      'en': '',
    },
    'xutarg2b': {
      'ru': 'Тех. сбой',
      'en': '',
    },
    'gg40aex1': {
      'ru': 'Выберите причину',
      'en': '',
    },
    'm6l98zjg': {
      'ru': 'Направлен в ДО',
      'en': '',
    },
    's1uw6m0m': {
      'ru': 'Отказ клиента',
      'en': '',
    },
    'wg0fx3b8': {
      'ru': 'Отказ банка',
      'en': '',
    },
    'wjez8vgr': {
      'ru': 'Тех. сбой',
      'en': '',
    },
    'x0i9j02p': {
      'ru': 'Выберите причину отмены',
      'en': '',
    },
    '4wm5coyw': {
      'ru': 'Перенос встречи',
      'en': '',
    },
    '24q62n7o': {
      'ru': 'Направлен в ДО',
      'en': '',
    },
    'ejxra8db': {
      'ru': 'Ошибка маршрута',
      'en': '',
    },
    'jknywynf': {
      'ru': 'Отказ клиента',
      'en': '',
    },
    'j2mgcgj5': {
      'ru': 'Отказ банка',
      'en': '',
    },
    '6hnd83ex': {
      'ru': 'Недозвон',
      'en': '',
    },
    '72pckrje': {
      'ru': 'Выберите причину отмены',
      'en': '',
    },
    'yfj3jeca': {
      'ru': 'Перенос встречи',
      'en': '',
    },
    '4yqor6pf': {
      'ru': 'Направлен в ДО',
      'en': '',
    },
    'qb4k0srg': {
      'ru': 'Технический сбой',
      'en': '',
    },
    '9pvl4667': {
      'ru': 'Отказ клиента',
      'en': '',
    },
    '57qblje9': {
      'ru': 'Отказ банка',
      'en': '',
    },
    'zk3viugg': {
      'ru': 'Недозвон',
      'en': '',
    },
    '5mp3u0wf': {
      'ru': 'Home',
      'en': '',
    },
  },
  // PhotoDocument
  {
    'teelowck': {
      'ru': 'Подписание клиент',
      'en': '',
    },
    '8ois2b5h': {
      'ru': 'Документ для подписания',
      'en': '',
    },
    'buegkuvk': {
      'ru': 'ДАЛЕЕ',
      'en': '',
    },
    'wvysq93e': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SigningSms
  {
    'utmgii43': {
      'ru': 'Подписание клиент',
      'en': '',
    },
    'i83rldmw': {
      'ru':
          'Сообщение с кодом подтверждения отправлено клиенту. \n\nВведите данный код для подписания документов.',
      'en': '',
    },
    'ac4yf761': {
      'ru': 'Введите код из СМС',
      'en': '',
    },
    'h5otujxy': {
      'ru': 'ОТПРАВИТЬ ЕЩЕ РАЗ',
      'en': '',
    },
    'vi3unsbu': {
      'ru': 'ДАЛЕЕ',
      'en': '',
    },
    'vwj46tim': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SigningClient
  {
    'pe2b8s8p': {
      'ru': 'Подписание клиент',
      'en': '',
    },
    '6tuflfpt': {
      'ru': 'Используйте блок для подписи ниже, чтобы нарисовать свою подпись:',
      'en': '',
    },
    'xhf7ilmd': {
      'ru': 'ОЧИСТИТЬ',
      'en': '',
    },
    'tdyqdf13': {
      'ru': 'ПОДПИСАТЬ',
      'en': '',
    },
    '9e3o1oop': {
      'ru': 'Home',
      'en': '',
    },
  },
  // SigningAgent
  {
    'ok3qqs1l': {
      'ru': 'Подписание агент',
      'en': '',
    },
    'v2db71rk': {
      'ru': 'Используйте блок для подписи ниже, чтобы нарисовать свою подпись:',
      'en': '',
    },
    'yt8blw3v': {
      'ru': 'ОЧИСТИТЬ',
      'en': '',
    },
    'r9u9cy8z': {
      'ru': 'ПОДПИСАТЬ',
      'en': '',
    },
    '37ebu7q8': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Binding
  {
    '94judz67': {
      'ru': 'Привязка карты',
      'en': '',
    },
    '0z0lgk3l': {
      'ru':
          'Введите первые 6 цифр и последние 4 цифры номера карты в форму ниже для привязки карты.',
      'en': '',
    },
    'pxwahi48': {
      'ru': '',
      'en': '',
    },
    'ejdmbmpd': {
      'ru': '** ****',
      'en': '',
    },
    'obc0c33s': {
      'ru': '',
      'en': '',
    },
    'gwa5pxaq': {
      'ru': 'ПРИВЯЗАТЬ',
      'en': '',
    },
    'fsmwnq9o': {
      'ru': 'Home',
      'en': '',
    },
  },
  // DopMain
  {
    'dj83ldka': {
      'ru': 'Готово!',
      'en': '',
    },
    'xrg3s691': {
      'ru': 'Дополнительные продукты',
      'en': '',
    },
    '221s2z2f': {
      'ru': 'Дебетовые карты',
      'en': '',
    },
    'n5slqsem': {
      'ru': 'Дебетовая карта',
      'en': '',
    },
    'pwwz72hl': {
      'ru': 'Кэшбек',
      'en': '',
    },
    'd6o7324u': {
      'ru': 'Дебетовая карта',
      'en': '',
    },
    '7fhznm27': {
      'ru': 'Мили',
      'en': '',
    },
    '08cyap1t': {
      'ru': 'ЗАКОНЧИТЬ ВСТРЕЧУ',
      'en': '',
    },
    'tjmu29f4': {
      'ru': 'Home',
      'en': '',
    },
  },
  // details_bottom
  {
    'myyiqkgy': {
      'ru': 'Назад',
      'en': '',
    },
    'bbdglnyf': {
      'ru': 'Ожидает доставку',
      'en': '',
    },
    '7vs6slo7': {
      'ru': '№232-190222',
      'en': '',
    },
    'dujgjo8c': {
      'ru': '11:00 - 12:00',
      'en': '',
    },
    'kj93ocza': {
      'ru': 'Заказчик',
      'en': '',
    },
    '6itcfmyk': {
      'ru': 'Янчевский Афанасий Ростиславович',
      'en': '',
    },
    '66pkxtdh': {
      'ru': 'Адрес',
      'en': '',
    },
    'k8z214pw': {
      'ru': 'ул. Речная, д.14к1, кв. 171',
      'en': '',
    },
    'k0nd9pl8': {
      'ru': 'Номер телефона',
      'en': '',
    },
    '63mkaoe7': {
      'ru': '+7 (954) 343 12 51',
      'en': '',
    },
  },
  // AddPhoto
  {
    'fzjkx97t': {
      'ru': 'Добавить документ',
      'en': '',
    },
  },
  // CreatePhotoString
  {
    'acc9l6pe': {
      'ru': 'Добавить фото',
      'en': '',
    },
    'nmgbvcqn': {
      'ru': 'Паспорт',
      'en': '',
    },
    'fhdv99cm': {
      'ru': 'Паспорт',
      'en': '',
    },
    'usokrxk8': {
      'ru': 'Селфи',
      'en': '',
    },
    'rzkffo3n': {
      'ru': 'Документ 1',
      'en': '',
    },
    't3y0d7z6': {
      'ru': 'Выберите вариант...',
      'en': '',
    },
    '3whjfvth': {
      'ru': 'ГОТОВ',
      'en': '',
    },
  },
  // PhotoVerification
  {
    '168wh8ne': {
      'ru': 'Отправлено!',
      'en': '',
    },
    'huppndhp': {
      'ru': 'Фотографии отправлены на верификацию в бэк-офис',
      'en': '',
    },
    '8clo499b': {
      'ru': 'ГОТОВО',
      'en': '',
    },
  },
  // PhotoDelete
  {
    'tsqwl6x8': {
      'ru': 'Удалить фото?',
      'en': '',
    },
    'jvm0m7md': {
      'ru': ' В случае удаления вы не сможете восстановить фото',
      'en': '',
    },
    'ixr17zf3': {
      'ru': 'ДА',
      'en': '',
    },
    'dksz9655': {
      'ru': 'НЕТ',
      'en': '',
    },
  },
  // EmptyList
  {
    'j4vufdbe': {
      'ru': 'Здесь нет ни одной заявки...',
      'en': '',
    },
  },
  // meeting
  {
    '8sz6d3l1': {
      'ru': 'Назад',
      'en': '',
    },
    'ms7vvtbi': {
      'ru': 'Отмена встречи',
      'en': '',
    },
    'wnfsnjya': {
      'ru': 'Информация о встрече',
      'en': '',
    },
    'bueawu02': {
      'ru': 'Название продукта',
      'en': '',
    },
    'x1nikfi0': {
      'ru': 'Пакет документов',
      'en': '',
    },
    'kpgndm5r': {
      'ru': 'Заказчик',
      'en': '',
    },
    'decwwxib': {
      'ru': 'Янчевский Афанасий Ростиславович',
      'en': '',
    },
    '80ed7qih': {
      'ru': 'Адрес',
      'en': '',
    },
    'twddxlfc': {
      'ru': 'ул. Речная, д.14к1, кв. 171',
      'en': '',
    },
    'yjuctpgj': {
      'ru': 'Номер телефона',
      'en': '',
    },
    'dcz9x0xp': {
      'ru': '+7 (954) 343 12 51',
      'en': '',
    },
  },
  // ClientCancel
  {
    '3gqmypb2': {
      'ru': 'Выбирите причину:',
      'en': '',
    },
    'j8qxzv1z': {
      'ru': 'Не подходят условия',
      'en': '',
    },
    '22gfgqjl': {
      'ru': 'Не актуально',
      'en': '',
    },
    'hbsnudvd': {
      'ru': 'Получил продукт в другой ФО',
      'en': '',
    },
  },
  // BankCancel
  {
    '17mb4fpu': {
      'ru': 'Выбирите причину:',
      'en': '',
    },
    'n6vktyi4': {
      'ru': 'Ошибка в персональных данных',
      'en': '',
    },
    'se1gnqqv': {
      'ru': 'Негатив. Паспорт',
      'en': '',
    },
    'w1cw8eri': {
      'ru': 'Негатив. Давление 3-х лиц',
      'en': '',
    },
    'vtjgnzow': {
      'ru': 'Негатив. Поведение клиента',
      'en': '',
    },
    'psia686l': {
      'ru': 'Вне географии',
      'en': '',
    },
  },
  // row_back
  {
    'y5kcs0n4': {
      'ru': 'Назад',
      'en': '',
    },
  },
  // PhotoVerificationError
  {
    '7gwdjji8': {
      'ru': 'Ошибка верификации',
      'en': '',
    },
    'hdcv3yyl': {
      'ru': 'Проверьте качество документов \nили свяжитесь с офисом',
      'en': '',
    },
    'lxwoytfq': {
      'ru': 'ОК',
      'en': '',
    },
  },
  // RecognitionDone
  {
    'qxp97kmh': {
      'ru': 'Подписание документов',
      'en': '',
    },
    '3bcuj7ox': {
      'ru': 'Подписание завершено. Осталось зарегистрировать карту',
      'en': '',
    },
    'rvv6mnd5': {
      'ru': 'ГОТОВО',
      'en': '',
    },
  },
  // BindingDone
  {
    'frxcump9': {
      'ru': 'Карта выдана',
      'en': '',
    },
    '911jzxs6': {
      'ru': 'Вы можете выбрать дополнительные продукты.',
      'en': '',
    },
    '8b8dag0v': {
      'ru': 'ГОТОВО',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'vexqel71': {
      'ru': '',
      'en': '',
    },
    'qpsxmhoc': {
      'ru': '',
      'en': '',
    },
    'r0wvmurn': {
      'ru': '',
      'en': '',
    },
    'i8d8kp44': {
      'ru': '',
      'en': '',
    },
    '8yjnoafx': {
      'ru': '',
      'en': '',
    },
    'orvd3u19': {
      'ru': '',
      'en': '',
    },
    '2f13fexa': {
      'ru': '',
      'en': '',
    },
    'oq95ifn4': {
      'ru': '',
      'en': '',
    },
    'hjrw3cof': {
      'ru': '',
      'en': '',
    },
    'xca40mhm': {
      'ru': '',
      'en': '',
    },
    'd5zm95t3': {
      'ru': '',
      'en': '',
    },
    '8max1a4e': {
      'ru': '',
      'en': '',
    },
    'zsvlehhy': {
      'ru': '',
      'en': '',
    },
    '7yledm83': {
      'ru': '',
      'en': '',
    },
    'qvm31rnd': {
      'ru': '',
      'en': '',
    },
    '3n2dldj4': {
      'ru': '',
      'en': '',
    },
    'o11tf4o6': {
      'ru': '',
      'en': '',
    },
    'bzou5s90': {
      'ru': '',
      'en': '',
    },
    'p1obner1': {
      'ru': '',
      'en': '',
    },
    '23bu2vy7': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
