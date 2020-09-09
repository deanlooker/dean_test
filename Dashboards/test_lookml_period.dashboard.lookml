- dashboard: test_lookml_dash_stuff
  title: test lookml dash stuff
  layout: newspaper
  elements:
  - title: Tile 1
    name: Tile 1
    model: dean_test
    explore: order_items
    type: table
    fields: [dean_orders_2.created_month, dean_orders_2.count]
    fill_fields: [dean_orders_2.created_month]
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Testing avg. field stuff: dean_orders_2.count
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Testing avg. field stuff
    title: Testing avg. field stuff
    type: number_filter
    default_value: ">0"
    allow_multiple_values: true
    required: false
