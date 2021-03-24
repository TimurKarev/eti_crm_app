class OrderConfigPattern {
  static const orderConfig = {
    'headers': {
      'title': 'Конфигурация нового заказа',
    },
    'sections': [
      {
        'label': 'Общие настройки',
        'points': [
          {
            'label': 'Номер Заказа',
            'index': 'order_number',
            'type': 'integer',
            'value': '0',
          },
          {
            'label': 'Тип подстанции',
            'index': 'substation_type',
            'type': 'choice',
            'variant_index': 'substation_type_variants',
            'value': 'bktp',
          },
        ]
      },
      {
        'label': 'Строительная часть',
        'points': [
          {
            'label': 'Количество нижних модулей',
            'index': 'building_bottom_module_num',
            'type': 'integer',
            'value': '2',
          },
          {
            'label': 'Количество верхних модулей',
            'index': 'building_top_module_num',
            'type': 'integer',
            'value': '2',
          },
        ],
      },
      {
        'label': 'Электрическая часть',
        'points': [
          {
            'label': 'Количество силовых трансформаторов',
            'index': 'power_transformer_num',
            'type': 'integer',
            'value': '2',
          },
          {
            'label': 'Количество RM6',
            'index': 'rm6_num',
            'type': 'integer',
            'value': '4',
          },
          {
            'label': 'Количество УВР',
            'index': 'uvr_num',
            'type': 'integer',
            'value': '2',
          },
          {
            'label': 'Количество объединенных ШСН',
            'index': 'unite_hsn_num',
            'type': 'integer',
            'value': '2',
          },
          {
            'label': 'Количество ШУ',
            'index': 'hy_num',
            'type': 'integer',
            'value': '2',
          },
          {
            'label': 'Количество ШТМ',
            'index': 'htm_num',
            'type': 'integer',
            'value': '1',
          },
          {
            'label': 'Количество ТН (бктп)',
            'index': 'tn_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ППКУОП',
            'index': 'ppkyop_num',
            'type': 'integer',
            'value': '1',
          },
          {
            'label': 'Количество ШВ',
            'index': 'hv_num',
            'type': 'integer',
            'value': '1',
          },

          {
            'label': 'Количество КСО',
            'index': 'kso_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШСН',
            'index': 'hsn_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШЗС',
            'index': 'hzs_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШПД',
            'index': 'hpd_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШОС',
            'index': 'hos_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШОЗС',
            'index': 'hozs_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШТЗ',
            'index': 'htz_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШБП',
            'index': 'hbp_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШБПЗОС',
            'index': 'hbpzos_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество ШУАВР',
            'index': 'hyavr_num',
            'type': 'integer',
            'value': '',
          },
          {
            'label': 'Количество Шкафов дуговой защиты',
            'index': 'hdz_num',
            'type': 'integer',
            'value': '',
          },
        ],
      },
    ],
    'config': [
      {
        'choice_variants': {
          'substation_type_variants': [
            {'label': 'БКТП', 'value': 'bktp'},
            {'label': 'БКРТП', 'value': 'bkrtp'}
          ]
        },
      }
    ],
  };
  static const bmChecklistConfig = {
    'headers': {
      'title': 'Шаблон для строительного чеклиста',
    },
    'sections': [
      {
        "label": "Общие проверки",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Соответствие компановке",
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            "label": "АСЧ",
            'value': 'unchecked',
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тех задание"
          },
        ]
      },
      {
        "label": "Металлоизделия",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка металлоизделий"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Цветовая гамма металлоконструкций"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка закладных"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка комплектующих"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие замков"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие рымов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие дверей"
          },
        ]
      },
      {
        "label": "Металлоизделия нижний модуль",
        'order_config_index': 'building_bottom_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Закладные элементы на основания модуля"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Закладные элементы на стены модуля"
          },
        ]
      },
      {
        "label": "Производство нижнего модуля",
        'order_config_index': 'building_bottom_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка опалубки"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество бетонной смеси"
          },
        ]
      },
      {
        "label": "Общие проверки нижнего модуля",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наплавление изопласта"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Отделка"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие освещения"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Контур заземления"
          },
        ]
      },
      {
        "label": "Размеры нижнего модуля",
        'order_config_index': 'building_bottom_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Линейные размеры"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Диагональные размеры"
          },
        ]
      },
      {
        "label": "Проходные отверстия нижнего модуля",
        'order_config_index': 'building_bottom_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Для контура заземлений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Для вводов кабелей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Для прокладки межблочный соединений"
          },
        ]
      },
      {
        "label": "Металлоизделия верхнего модуля",
        'order_config_index': 'building_top_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Закладные элементы на основания модуля"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Закладные элементы на стены модуля"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Закладные элементы на крышу модуля"
          },
        ]
      },
      {
        "label": "Производство верхнего модуля",
        'order_config_index': 'building_top_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка опалубки"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество бетонной смеси"
          },
        ]
      },
      {
        "label": "Размеры верхнего модуля",
        'order_config_index': 'building_top_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Линейные размеры"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Диагональные размеры"
          },
        ]
      },
      {
        "label": "Проходные отверстия верхнего модуля",
        'order_config_index': 'building_top_module_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Для контура заземлений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Для вводов кабелей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Для прокладки межблочный соединений"
          },
        ]
      },
      {
        "label": "Отделочные работы",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Вторичные отделочные работы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Малярные работы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Штукатурные работы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Цветовая гамма фасада"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Шумоизоляция"
          },
        ]
      },
      {
        "label": "Навесное оборудование",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Соответствие с АСЧ и чертежами"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка надписей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Паспорные таблички на дверях"
          },
        ]
      },
      {
        "label": "Контур заземления",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие контура"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка сварочных швов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Покраска контура заземления"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие переносного заземления"
          },
        ]
      },
      {
        "label": "СИЗ и ЗИП",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектация ЗИП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Ведомость ЗИП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектация СИЗ"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Ведомость СИЗ"
          },
        ]
      },
    ],
    'config': [
      {
        'choice_variants': {
          'four_choice_variants': [
            {'label': 'Не проверенно', 'value': 'unchecked'},
            {'label': 'Не используется', 'value': 'not_used'},
            {'label': 'Замечания', 'value': 'comment'},
            {'label': 'Принято', 'value': 'approved'},
          ],
        },
      }
    ],
  };
  static const elChecklistConfig = {
    'headers': {
      'title': 'Шаблон для электротехнического чеклиста',
    },
    'sections': [
      {
        "label": "Проверки схем",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сверка технических характеристик",
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            "label": "Контроль заказанного оборудования",
            'value': 'unchecked',
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка правильности размещения оборудования"
          },
        ]
      },
      {
        "label": "Входной контроль оборудования",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие паспортов и сертификатов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность пломб"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Поверка приборов учета"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка срабатывания автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сверка серийных номером"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка комплектности"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка кабельной продукции"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка кабельной продукции"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка кабельной продукции"
          },
        ]
      },
      {
        "label": "Силовой трансформатор",
        'order_config_index': 'power_transformer_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие документации"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектность"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заводских пломб"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Герметичность"
          },
        ]
      },
      {
        "label": "RM6",
        'order_config_index': 'rm6_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Соответствие опросным листам"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сверка со схемами"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектность"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Отсутствие механических повреждений"
          },
        ]
      },
      {
        "label": "Проверка УВР",
        'order_config_index': 'uvr_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Првильность сборки"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка вводных авт. выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверки заземления"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность маркировки"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность кабеля"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Подключение кабеля"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность фазировки"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка кабелей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сечение шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Расстояние между фазами"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Заземление составных частей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Закрытие токоведущих частей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность установки комплектующих"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие пломбировочных крышек"
          },
        ]
      },
      {
        "label": "Совмещенный ШСН",
        'order_config_index': 'unite_hsn_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШУ",
        'order_config_index': 'hy_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "ШМТМ",
        'order_config_index': 'htm_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "ШКТМ",
        'order_config_index': 'htm_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "ТН бктп",
        'order_config_index': 'tn_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сверка схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки камер со схемой"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка трансформаторов тока"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Работоспособность комутационных аппаратов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сечение шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Расстояние фаза-корпус"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Фазировка шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Установка ограничителей перенапряжения"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "установка магистральных изоляторов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность магистральных изоляторов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество термоусадки на тягах приводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Регулировка проводов"
          },
        ]
      },
      {
        "label": "ППКУОП",
        'order_config_index': 'ppkyop_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "ШВ",
        'order_config_index': 'hv_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },

      {
        "label": "КРУ общие",
        'order_config_index': 'is_kso',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Соответствие размещенной схеме"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Соответствие оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Соответствие комплектующих"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Контактные присоединения"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие пломб"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Поверки"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Заземляющие проводники"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },

        ]
      },
      {
        "label": "КСО",
        'order_config_index': 'kso_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сверка схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки камер со схемой"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка трансформаторов тока"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Работоспособность комутационных аппаратов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сечение шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Расстояние фаза-корпус"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Фазировка шин"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Установка ограничителей перенапряжения"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "установка магистральных изоляторов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность магистральных изоляторов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество термоусадки на тягах приводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Регулировка проводов"
          },
        ]
      },

      {
        "label": "Проверка ШУАВР",
        'order_config_index': 'hyavr_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШСН",
        'order_config_index': 'hsn_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШЗС",
        'order_config_index': 'hzs_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШПД",
        'order_config_index': 'hpd_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШОС",
        'order_config_index': 'hos_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШОЗС",
        'order_config_index': 'hozs_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШТЗ",
        'order_config_index': 'htz_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШБП",
        'order_config_index': 'hbp_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Проверка ШБПЗОС",
        'order_config_index': 'hbpzos_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },
      {
        "label": "Шкаф Дуговой Защиты",
        'order_config_index': 'hdz_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Визуальный контроль корпуса"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Проверка геометрии"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Качество окраски"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Тольщина ЛКП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность сборки шкафного оборудования"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка болтовых соединений"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие электрической схемы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Протяжка заземляющих проводников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Номиналы автоматических выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Укладка проводов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наименование установленного оборудования"
          },
        ]
      },

      {
        "label": "Проверки монтажа",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность установки кабель канала"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Целостность кабель канала"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Надежность усановки кабель канала"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность установки светильников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность подключения светильников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Класс напряжения светильников"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие бирок на переходах кабеля в кабель каналах"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность установки выключателей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность установки электромагнитных датчиков"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Табло 'Аварийный выход'"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Концевики ворот и дверей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Электроконвекторы"
          },
        ]
      },
      {
        "label": "Проверка шинного моста",
        'order_config_index': 'power_transformer_num',
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность монтажа"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Маркировка"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Болтовые соединения"
          },
        ]
      },
      {
        "label": "Маркировка",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие и правильность заводских шильд"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Наличие надписей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Шрифт надписей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Правильность надписей"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Знаки класса пожарной опасности"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Знаки класса взрывопожарной опасности"
          },
        ]
      },
      {
        "label": "СИЗ и ЗИП",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектация ЗИП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Ведомость ЗИП"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектация СИЗ"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Ведомость СИЗ"
          },
        ]
      },
    ],
    'config': [
      {
        'choice_variants': {
          'four_choice_variants': [
            {'label': 'Не проверенно', 'value': 'unchecked'},
            {'label': 'Не используется', 'value': 'not_used'},
            {'label': 'Замечания', 'value': 'comment'},
            {'label': 'Принято', 'value': 'approved'},
          ],
        },
      }
    ],
  };
  static const docChecklistConfig = {
    'headers': {
      'title': 'Шаблон для постпродакшн чеклиста',
    },
    'sections': [
      {
        "label": "Изготовление паспорта",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сбор технической документации",
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            "label": "Изготовление паспорта",
            'value': 'unchecked',
          },
        ]
      },
      {
        "label": "Исполнительная документация",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Сборка исполнительной документации"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Реестр готовой продукции"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Копирование на электронные носители"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Передача ИД заказчику"
          },
        ]
      },
      {
        "label": "Пусконаладочные работы",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Согласование работ"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Составление рекламаций"
          },
        ]
      },
      {
        "label": "Упаковка и консервация",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Комплектность"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Упаковка"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Консервация"
          },
        ]
      },
      {
        "label": "Сдача заказчику",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Согласование сроков"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Составление актов"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Передача продукции"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Подписание актов у заказчика"
          },
        ]
      },
      {
        "label": "Шеф монтаж",
        "points": [
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Шефмонтажные работы"
          },
          {
            'variant_index': 'four_choice_variants',
            'comment': '',
            "type": "choice",
            'value': 'unchecked',
            "label": "Передача работ заказчику"
          },
        ]
      },
    ],
    'config': [
      {
        'choice_variants': {
          'four_choice_variants': [
            {'label': 'Не проверенно', 'value': 'unchecked'},
            {'label': 'Не используется', 'value': 'not_used'},
            {'label': 'Замечания', 'value': 'comment'},
            {'label': 'Принято', 'value': 'approved'},
          ],
        },
      }
    ],
  };
}