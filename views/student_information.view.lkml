view: student_information {
  sql_table_name: `nmlds-demo.nmlds_demo.StudentInformation`
    ;;

  dimension: address1 {
    type: string
    sql: ${TABLE}.Address1 ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.Address2 ;;
  }

  dimension: contact_address1 {
    type: string
    sql: ${TABLE}.ContactAddress1 ;;
  }

  dimension: contact_address2 {
    type: string
    sql: ${TABLE}.ContactAddress2 ;;
  }

  dimension: contact_cell_phone {
    type: string
    sql: ${TABLE}.ContactCellPhone ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.ContactEmail ;;
  }

  dimension: current_age {
    type: string
    sql: ${TABLE}.CurrentAge ;;
  }

  dimension: date_of_birth {
    type: string
    sql: ${TABLE}.DateOfBirth ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.FullName ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

  dimension: hispanic_latino {
    type: string
    sql: ${TABLE}.HispanicLatino ;;
  }

  dimension: home_language {
    type: string
    sql: ${TABLE}.HomeLanguage ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.Phone ;;
  }

  dimension: placeof_birth {
    type: string
    sql: ${TABLE}.PlaceofBirth ;;
  }

  dimension: primary_contact_name {
    type: string
    sql: ${TABLE}.PrimaryContactName ;;
  }

  dimension: provider_id {
    type: string
    sql: ${TABLE}.ProviderID ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.Race ;;
  }

  dimension: relationto_student {
    type: string
    sql: ${TABLE}.RelationtoStudent ;;
  }

  dimension: student_id {
    type: string
    sql: ${TABLE}.StudentID ;;
  }

  dimension: student_language {
    type: string
    sql: ${TABLE}.StudentLanguage ;;
  }

  measure: count {
    type: count
    drill_fields: [primary_contact_name, full_name]
  }

  dimension: student_details {
    type: string
    sql:  ${full_name} ;;
    html:

          <img style="float=left" src="https://fosteradoption.com/wp-content/uploads/2018/06/5-Things-You-Should-Know-about-Older-Child-Adoption-667x445.jpg" height=300 width=445>
          <div style="margin-left:60px;">
            <h1>{{ full_name }}</h1><hr>
            <h4>{{ address1 }}</h4>
            <h4>{{ address2 }}</h4>
            <h4>{{ phone }}</h4><hr>
        </div>
        ;;
  }

  dimension: student_demographics {
    type: string
    html:
      <table>
        <tr>
          <th colspan="2"> Guardian / Parent Information </th>
        </tr>
        <tr>
          <td>Name:</td>
          <td>{{ primary_contact_name }}</td>
        </tr>
        <tr>
          <td>Relation to Student:</td>
          <td>{{ relationto_student }}</td>
        </tr>
      </table>
        ;;
  }
}
