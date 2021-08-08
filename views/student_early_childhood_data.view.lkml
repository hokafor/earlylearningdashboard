view: student_early_childhood_data {
  sql_table_name: `nmlds-demo.nmlds_demo.StudentEarlyChildhoodData`
    ;;

  dimension: age {
    type: string
    sql: ${TABLE}.Age ;;
  }

  dimension: ecparticipation {
    type: string
    sql: ${TABLE}.ECParticipation ;;
  }

  dimension: entry {
    type: string
    sql: ${TABLE}.Entry ;;
  }

  dimension: exit {
    type: string
    sql: ${TABLE}.Exit ;;
  }

  dimension: is_current {
    type: string
    sql: ${TABLE}.IsCurrent ;;
  }

  dimension: lengthof_disruption {
    type: string
    sql: ${TABLE}.LengthofDisruption ;;
  }

  dimension: lengthof_enrollment {
    type: string
    sql: ${TABLE}.LengthofEnrollment ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.Location ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.Provider ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: star_rating {
    type: string
    sql:CAST(${TABLE}.StarRating AS INT) ;;
        html:
        {% for i in (1..5) %}
        {% if i > value %}
           <font color="gray">★</font>
        {% else %}
          <font color="orange">★</font>
        {% endif %}
        {% endfor %} ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.StudentID ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
