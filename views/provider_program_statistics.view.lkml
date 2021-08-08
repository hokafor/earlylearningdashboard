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
    html:
    {% if difference_from_goal._value >= 0.0 %}
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

  measure: percent_complete {
    type: sum
    sql:  ${attainment_numerator} * 100 / ${attainment_denominator} ;;
    value_format: "0.0\%"
    html:
    {% if difference_from_goal._value >= 0.0 %}
    <div style="float:left;width:{{ value }}%; background-color: rgba(0,180,0,{{ value }}); text-align:left; color: #FFFFFF;
              border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ rendered_value }}</p></div>
    <div style="float: left; width:{{ 100| minus:value }}%; background-color: rgba(0,180,0,0.1); text-align:right;
              border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{rendered_value}}</p></div>
    {% else %}
    <div style="float:left;width:{{ value }}%; background-color: rgba(180,0,0,{{ value }}); text-align:left; color: #FFFFFF;
              border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ rendered_value }}</p></div>
    <div style="float: left; width:{{ 100| minus:value }}%; background-color: rgba(180,0,0,0.1); text-align:right;
              border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{rendered_value}}</p></div>
    {% endif %} ;;

    }
}
