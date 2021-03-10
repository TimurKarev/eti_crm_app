class OrderConfigPattern {
  static final orderConfig = {
    'headers': {
      'title': 'Конфигурация нового заказа',
    },
    'sections': [
      {
        'label': 'Общие настройки',
        'points': [
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
            {'label': 'БКТП', 'value': 'bktp'}
          ]
        },
      }
    ],
  };
}
