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
    action: {

      url: "https://hooks.zapier.com/hooks/catch/5505451/oih24lt"
      label: "Schedule Follow Up With Provider"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/a/a5/Google_Calendar_icon_%282020%29.svg"
      form_param: {
        name: "Event Start Time"
        default: "{{ 'now' | date: '%s' | plus: 86400 | date: '%Y-%m-%d %H:00' }}"
        required: yes
      }
      form_param: {
        name: "Event End Time"
        default: "{{ 'now' | date: '%s' | plus: 86400 | date: '%Y-%m-%d %H:30' }}"
        required: yes
      }
      form_param: {
        name: "Organizer Email"
        required: yes
        default: "{{ _user_attributes['email'] }}"
      }

      form_param: {
        name: "Calendar Event Name"
        default: "{{ value }} Assessment KPIs"
        required: yes
      }
      form_param: {
        name: "Calendar Event Description"
        default: "Hi  - I'm setting up some time for us to review the assessment analytics KPIs we are monitoring and figure out how to improve participation and utilization across the district"
        required: no
        type: textarea
      }

    }
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
    drill_fields: [group]
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
