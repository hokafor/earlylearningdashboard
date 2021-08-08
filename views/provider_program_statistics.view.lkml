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

  dimension: metric_value {
    type: number
    sql: ${attainment_numerator} * 100 / ${attainment_denominator} ;;
    value_format: "0.0\%"
    html: {% assign var = difference_from_goal %}
    {% if var >= 0.0 %}
    <p style="color: black; background-color: green; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }
  dimension: difference_from_goal {
    type: number
    sql: ${metric_value} - ${program_goal} ;;
    value_format: "0.0\%"
    html: {% if value >= 0.0 %}
    <p style="color: green; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
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
