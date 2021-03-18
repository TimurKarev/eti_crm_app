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
            'variants_index': 'substation_type_variants',
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
}