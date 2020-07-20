- dashboard: testing_dashboard_copy
  title: Testing Dashboard (copy)
  layout: newspaper
  elements:
  - title: Testing API
    name: Testing API
    model: the_look
    explore: orders
    type: table
    fields: [orders.created_date, orders.count]
    fill_fields: [orders.created_date]
    filters:
      orders.created_week: 2016/09/01 to 2016/09/30
    limit: 500
    query_timezone: UTC
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
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      date: orders.created_date
    row: 0
    col: 0
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: dean_test
    explore: dean_orders_2
    type: table
    fields: [dean_orders_2.created_nofill_date, dean_orders_2.count]
    fill_fields: [dean_orders_2.created_nofill_date]
    sorts: [dean_orders_2.created_nofill_date desc]
    limit: 500
    query_timezone: America/Toronto
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
    hidden_fields: []
    y_axes: []
    listen:
      date: dean_orders_2.created_date
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: date
    title: date
    type: date_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
