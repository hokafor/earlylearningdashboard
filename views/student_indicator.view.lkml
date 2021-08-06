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
