view: provider_type {
  sql_table_name: `nmlds_demo.ProviderType`
    ;;

  dimension: population {
    type: number
    sql: ${TABLE}.Population ;;
  }

  dimension: provider_by_type {
    type: string
    sql: ${TABLE}.ProviderByType ;;
  }

  dimension: provider_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: provider_sub_type {
    type: string
    sql: ${TABLE}.ProviderSubType ;;
  }

  measure: count {
    type: count
    drill_fields: [provider.provider_id]
  }

  measure: total_providers {
    type: sum
    drill_fields: [provider.provider_title, provider_by_type]
    sql: ${population} ;;
  }
}
