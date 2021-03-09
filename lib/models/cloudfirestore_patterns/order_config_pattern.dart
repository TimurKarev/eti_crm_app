class OrderConfigPattern {
  static final orderConfig = {
    'title': 'Конфигурация нового заказа',
    'points': [
      {
        'label': 'Тип подстанции',
        'index': 'substation_type',
        'type': 'choice',
        'variants_index': 'substation_type_variants',
        'value': '0',
      },
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
    'substation_type_variants': [
      {
        'label': 'БКТП',
        'index': 'bktp',
      }
    ]
  };
}
