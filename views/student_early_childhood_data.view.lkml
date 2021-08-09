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
    type: date
    sql: DATE(${TABLE}.Entry);;
  }

  dimension: exit {
    type: date
    sql: DATE(${TABLE}.Exit);;
  }

  dimension: is_current {
    type: string
    sql: ${TABLE}.IsCurrent ;;
    html: {% if value == 'Y' %}
    <p><img src="http://findicons.com/files/icons/573/must_have/48/check.png" height=20 width=20></p>
    {% else %}
    <p><img src="https://findicons.com/files/icons/2711/free_icons_for_windows8_metro/128/unchecked_checkbox.png" height=20 width=20> {{ rendered_value }}</p>
    {% endif %} ;;
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
           <font color="white" size="+2">★</font>
        {% else %}
          <font color="orange" size="+2">★</font>
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
