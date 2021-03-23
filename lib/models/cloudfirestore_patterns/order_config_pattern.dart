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
        "label": "Проверка ШАВР",
        'order_config_index': 'havr_num',
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
        "label": "Совмещенный ШСН",
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
        "label": "ШТМ",
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
        "label": "Проверка ШБПЗОИС",
        'order_config_index': 'hbpzois_num',
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