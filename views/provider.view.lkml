view: provider {
  sql_table_name: `nmlds_demo.Provider`
    ;;
  drill_fields: [provider_id]

  dimension: provider_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: program_director {
    type: string
    sql: ${TABLE}.ProgramDirector ;;
  }

  dimension: provider_address1 {
    type: string
    sql: ${TABLE}.ProviderAddress1 ;;
  }

  dimension: provider_address2 {
    type: string
    sql: ${TABLE}.ProviderAddress2 ;;
  }

  dimension: provider_phone {
    type: string
    sql: ${TABLE}.ProviderPhone ;;
  }

  dimension: provider_title {
    type: string
    sql: ${TABLE}.ProviderTitle ;;
    link: {
      label: "{{ value }} Overview Dashboard"
      icon_url: "https://looker.com/assets/img/images/logos/looker_grey.svg"
    }
    action: {

      url: "https://hooks.zapier.com/hooks/catch/5505451/oih24lt"
      label: "Schedule Follow Up With District Superintendent"
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

  dimension: star_rating {
    type: number
    sql: ${TABLE}.StarRating ;;
  }

  dimension: state_id {
    type: string
    sql: ${TABLE}.StateID ;;
  }

  dimension: provider_details {
    type: string
    sql:  ${provider_title} ;;
    drill_fields: [provider_title]
    html:
      <a href="#drillmenu" target="_self">
      <img style="align=left;margin: 0 0 20 10;" src="https://garfield.cr.k12.ia.us/assets/6/18/Boys_and_Girls_Club_Logo.jpeg" width=200>
      <div style="margin-left:20px;color:rgb(89,56,55);">
        <h1><b>{{rendered_value}}</b></h1><hr>
        <h4>{{ provider_address1 }}</h4>
        <h4>{{ provider_address2 }}</h4>
        <h4>{{ provider_phone }}</h4><hr>
        <h4><b>Program Director: </b>{{ program_director }}</h4>
        <h4><b>Star Rating: </b>{{ star_rating }}</h4>
        <h4><b>Date Rating Received: </b>August 12, 2020</h4>
    </div>
        ;;
  }

  measure: count {
    type: count
    drill_fields: [provider_id, provider_program_enrollment.count, provider_demographics.count, provider_by_star_rating.count, provider_type.count]
  }

  measure: provider_sum {
    type: sum
    drill_fields: [provider_id, provider_program_enrollment.count, provider_demographics.count, provider_by_star_rating.count, provider_type.count]
  }
}
