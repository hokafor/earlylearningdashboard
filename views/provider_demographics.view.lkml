view: provider_demographics {
  sql_table_name: `nmlds_demo.ProviderDemographics`
    ;;

  dimension: demographic_type {
    type: string
    sql: ${TABLE}.DemographicType ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.Percentage ;;
  }

  dimension: provider_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: student_demographic {
    type: string
    sql: ${TABLE}.StudentDemographic ;;
  }

  measure: count {
    type: count
    drill_fields: [provider.provider_id]
  }

  measure: student_demographic_distribution {
    type: sum
    drill_fields: [provider.provider_title, demographic_type, student_demographic]
    sql: ${percentage} ;;
    value_format: "0.0\%"
  }
}
