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

  measure: count {
    type: count
    drill_fields: [provider_id, provider_program_enrollment.count, provider_demographics.count, provider_by_star_rating.count, provider_type.count]
  }
}
