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

  dimension: user_type {
    label: "Media Type"
    description: "SMS, MMS, or Video"
    type: string
    sql: case
    -- when ${user_facts.count} > 0 then 'userfact'
          when ${users.age} >18 then 'user'
          else 'MMS' end ;; # ${messages.media_url} is not null
  }

  dimension: is_complete {
    type: yesno
    sql: ${status} = "complete" ;;
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

  dimension_group: created_no_tz {
    label: "Created (No TZ Convert)"
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
    convert_tz: no
  }

  dimension: created_only_month {
    type: date
    sql: concat(year(${created_date}),"-",month(${created_date}),"-01") ;;
    html: {{ rendered_value | date: "%b '%y" }} ;;
    allow_fill: no
    label: "created only month"
  }

  dimension: months_since_user_created {
    type: number
    sql: timestampdiff(month, timestamp({% parameter date_param %}), ${users.created_raw}) ;;
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
      url: "/embed/dashboards-next/4321?Status={{ value | url_encode }}"
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
