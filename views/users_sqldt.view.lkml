view: users_sqldt {
  derived_table: {
    sql: SELECT
        * from demo_db.users
      where
      {% condition state_filter %} users.state {% endcondition %}
      ;;
  }
  drill_fields: [id]

  filter: state_filter {
    type: string
  }

  dimension: state {
    type: string
    sql:  ${TABLE}.state ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    tags: ["user_id"]
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    tags: ["email"]
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

#   commented out while testing https://looker.atlassian.net/browse/DD-1160
#   https://master.dev.looker.com/looks/10726
#
#   dimension: gender {
#     type: string
#     sql: ${TABLE}.gender ;;
#   }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }



  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name ]
#       events.count,
#       orders_test.count,
#       user_data.count
#     ]
    }

    dimension: deantest {
      type:  string
      sql: ${TABLE}.deantest ;;
    }
  }
