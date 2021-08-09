view: student_provider_mobility {
  sql_table_name: `nmlds-demo.nmlds_demo.StudentProviderMobility`
    ;;

  dimension: day {
    type: number
    sql: ${TABLE}.Day ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.Provider ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.StudentID ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  dimension: date_value  {
    type: string
    sql: date(${year}, ${month}, ${day}) ;;
  }

  measure: provider_number  {
    type: sum
    sql: ${TABLE}.ProviderNumber ;;
  }

  measure: provider_list {
    type: list
    list_field: provider
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
