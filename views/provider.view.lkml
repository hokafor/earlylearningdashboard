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
    html:

          <img style="align=left;margin: 0 0 20 20;" src="https://garfield.cr.k12.ia.us/assets/6/18/Boys_and_Girls_Club_Logo.jpeg" height=100 width=80>
          <div style="margin-left:20px;color:blue;">
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
