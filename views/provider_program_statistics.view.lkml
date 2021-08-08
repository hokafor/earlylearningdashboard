view: provider_program_statistics {
  sql_table_name: `nmlds-demo.nmlds_demo.ProviderProgramStatistics`
    ;;

  dimension: attainment_denominator {
    type: number
    sql: ${TABLE}.AttainmentDenominator ;;
  }

  dimension: attainment_numerator {
    type: number
    sql: ${TABLE}.AttainmentNumerator ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}.`Group` ;;
  }

  dimension: operational_dashboard_group {
    type: string
    sql: ${TABLE}.OperationalDashboardGroup ;;
  }

  dimension: program_goal {
    type: number
    sql: ${TABLE}.ProgramGoal ;;
    value_format: "0.0\%"
  }

  dimension: provider_id {
    type: number
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: difference_from_goal {
    type: number
    sql: (${attainment_numerator} * 100 / ${attainment_denominator}) - ${program_goal} ;;
    value_format: "0.0\%"
  }

  dimension: metric_value {
    type: number
    sql: ${attainment_numerator} * 100 / ${attainment_denominator} ;;
    value_format: "0.0\%"
  }

  dimension: teacher_attainment {
    type: string
    sql: concat(${attainment_numerator}," of ",${attainment_denominator}) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
