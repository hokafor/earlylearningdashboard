view: other_student_information {
  sql_table_name: `nmlds-demo.nmlds_demo.OtherStudentInformation`
    ;;

  dimension: other_student_information {
    type: string
    sql: ${TABLE}.OtherStudentInformation ;;
  }

  dimension: population {
    type: number
    sql: ${TABLE}.Population ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_population {
    type: sum
    drill_fields: [provider.provider_title, other_student_information]
    sql: ${population} ;;
    value_format: "0.0\%"
  }
}
