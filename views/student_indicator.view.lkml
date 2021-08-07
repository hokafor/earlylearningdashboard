view: student_indicator {
  sql_table_name: `nmlds-demo.nmlds_demo.StudentIndicator`
    ;;

  dimension: provider_id {
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.StudentID ;;
  }

  dimension: student_indicator {
    type: string
    sql: ${TABLE}.StudentIndicator ;;
  }

  dimension: student_indicator_group {
    type: string
    sql: ${TABLE}.StudentIndicatorGroup ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.Value ;;
    html: {% if value == 'Y' %}
    <p><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20> {{ rendered_value }}</p>
    {% elsif value == 'N' %}
    <p><img src="http://findicons.com/files/icons/719/crystal_clear_actions/64/cancel.png" height=20 width=20> {{ rendered_value }}</p>
    {% else %}
    <p><img src="http://findicons.com/files/icons/1681/siena/128/clock_blue.png" height=20 width=20> {{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: value_type {
    type: string
    sql: ${TABLE}.ValueType ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
