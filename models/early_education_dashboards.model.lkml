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

explore: other_student_information {
  join: provider {
    type: left_outer
    sql_on: ${other_student_information.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: students_by_service {
  join: provider {
    type: left_outer
    sql_on: ${students_by_service.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: student_provider_mobility {
  join: provider {
    type: left_outer
    sql_on: ${student_provider_mobility.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: student_indicator {
  join: provider {
    type: left_outer
    sql_on: ${student_indicator.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}

explore: student_information {
  join: provider {
    type: left_outer
    sql_on: ${student_information.provider_id} = ${provider.provider_id} ;;
    relationship: many_to_one
  }
}
