view: students_by_service {
  sql_table_name: `nmlds-demo.nmlds_demo.StudentsByService`
    ;;

  dimension: population {
    type: number
    sql: ${TABLE}.Population ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: students_by_service {
    type: string
    sql: ${TABLE}.StudentsByService ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_population {
    type: sum
    drill_fields: [provider.provider_title, students_by_service]
    sql: ${population} ;;
    value_format: "0.0\%"
  }
}
