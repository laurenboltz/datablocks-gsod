view: bq_zipcode_station {
  sql_table_name: `looker-datablocks.gsod.zipcode_station` ;;

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: concat(${zipcode}, ${year})  ;;
  }

  dimension: zipcode {
    group_label: "Zipcode"
    label: "ZIP (ZCTA)"
    type: zipcode
    sql: RPAD(cast(${TABLE}.zip_code as string), 5, '0') ;;
  }

  dimension: nearest_station_id {
    group_label: "Zipcode"
    type: string
    sql: ${TABLE}.nearest_station_id ;;
  }

  dimension: year {
    hidden: yes
    type: string
    sql: cast(${TABLE}.year as string) ;;
  }

  dimension: distance_from_nearest_station {
    group_label: "Zipcode"
    type: number
    sql: ${TABLE}.distance_from_nearest_station ;;
  }

  set: detail {
    fields: [zipcode, nearest_station_id, distance_from_nearest_station]
  }
}
