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
    <p><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20></p>
    {% elsif value == 'N' %}
    <p><img src="https://findicons.com/files/icons/2711/free_icons_for_windows8_metro/128/unchecked_checkbox.png" height=20 width=20> </p>
    {% else %}
    {{ rendered_value }}
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
