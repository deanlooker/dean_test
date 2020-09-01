view: dean_orders_2 {
  sql_table_name: demo_db.orders;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  parameter: limit_num {
    type: number
  }

  parameter: date_param {
    type: date
  }

  parameter: filter_param {
    type: unquoted
  }

  dimension: last_order_id {
    type: number
    sql: (SELECT id
      FROM ${dean_orders_2.SQL_TABLE_NAME}
      ORDER BY created_at DESC
      LIMIT 1)
      ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    drill_fields: [users.country]
  }

  dimension_group: created_nofill {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    drill_fields: [users.country]
    allow_fill: no
  }

  measure: most_recent {
    type:  date
    sql: max(${created_date}) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    link: {
      label: "Device Detail Overview"
      url: "/dashboards/4321?Status={{ value | url_encode }}"
      icon_url: "/favicon.ico"
    }
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_id};;
  }

  measure: distinct_items {
    type: count_distinct
    sql: ${order_items.inventory_item_id};;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;

  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }

}
