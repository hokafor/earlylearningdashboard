view: provider_by_star_rating {
  sql_table_name: `nmlds_demo.ProviderByStarRating`
    ;;

  dimension: population {
    type: number
    sql: ${TABLE}.Population ;;
  }

  dimension: provider_by_star_ratings {
    type: string
    sql: ${TABLE}.ProviderByStarRatings ;;
  }

  dimension: provider_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ProviderID ;;
  }

  measure: count {
    type: count
    drill_fields: [provider.provider_id]
  }

  measure: sum {
    type: sum
    drill_fields: [provider.provider_id, provider_by_star_ratings]
  }
}
