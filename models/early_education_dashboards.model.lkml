connection: "nmlds_demo_bigquery"

# include all the views
include: "/views/**/*.view"

datagroup: early_education_dashboards_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: early_education_dashboards_default_datagroup

explore: provider {}

explore: provider_by_star_rating {
  join: provider {
    type: left_outer
    sql_on: ${provider_by_star_rating.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: provider_demographics {
  join: provider {
    type: left_outer
    sql_on: ${provider_demographics.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: provider_program_enrollment {
  join: provider {
    type: left_outer
    sql_on: ${provider_program_enrollment.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: provider_type {
  join: provider {
    type: left_outer
    sql_on: ${provider_type.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}
