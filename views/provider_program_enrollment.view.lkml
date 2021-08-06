view: provider_program_enrollment {
  sql_table_name: `nmlds_demo.ProviderProgramEnrollment`
    ;;

  dimension: population {
    type: number
    sql: ${TABLE}.Population ;;
  }

  dimension: program_enrollment {
    type: string
    sql: ${TABLE}.ProgramEnrollment ;;
  }

  dimension: provider_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ProviderID ;;
  }

  measure: count {
    type: count
    drill_fields: [provider.provider_id]
  }
}
