view: orders {
  sql_table_name: shopify_stitch.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer__id ;;
  }

  dimension: refunded_flag {
    type: yesno
    sql: ${order_refunds.order_id} is not null ;;
  }


#   dimension: billing_address__address1 {
#     type: string
#     sql: ${TABLE}.billing_address__address1 ;;
#   }
#
#   dimension: billing_address__address2 {
#     type: string
#     sql: ${TABLE}.billing_address__address2 ;;
#   }
#
#   dimension: billing_address__city {
#     type: string
#     sql: ${TABLE}.billing_address__city ;;
#   }
#
#   dimension: billing_address__company {
#     type: string
#     sql: ${TABLE}.billing_address__company ;;
#   }
#
#   dimension: billing_address__country {
#     type: string
#     sql: ${TABLE}.billing_address__country ;;
#   }
#
#   dimension: billing_address__country_code {
#     type: string
#     sql: ${TABLE}.billing_address__country_code ;;
#   }
#
#   dimension: billing_address__first_name {
#     type: string
#     sql: ${TABLE}.billing_address__first_name ;;
#   }
#
#   dimension: billing_address__last_name {
#     type: string
#     sql: ${TABLE}.billing_address__last_name ;;
#   }
#
#   dimension: billing_address__latitude {
#     type: number
#     sql: ${TABLE}.billing_address__latitude ;;
#   }
#
#   dimension: billing_address__longitude {
#     type: number
#     sql: ${TABLE}.billing_address__longitude ;;
#   }
#
#   dimension: billing_address__name {
#     type: string
#     sql: ${TABLE}.billing_address__name ;;
#   }
#
#   dimension: billing_address__phone {
#     type: string
#     sql: ${TABLE}.billing_address__phone ;;
#   }
#
#   dimension: billing_address__province {
#     type: string
#     sql: ${TABLE}.billing_address__province ;;
#   }
#
#   dimension: billing_address__province_code {
#     type: string
#     sql: ${TABLE}.billing_address__province_code ;;
#   }
#
#   dimension: billing_address__zip {
#     type: string
#     sql: ${TABLE}.billing_address__zip ;;
#   }
#
#   dimension: browser_ip {
#     type: string
#     sql: ${TABLE}.browser_ip ;;
#   }

#   dimension: buyer_accepts_marketing {
#     type: yesno
#     sql: ${TABLE}.buyer_accepts_marketing ;;
#   }
#
#   dimension: cancel_reason {
#     type: string
#     sql: ${TABLE}.cancel_reason ;;
#   }

  dimension_group: cancelled {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.cancelled_at ;;
  }
  dimension: cancelled_flag {
    type: yesno
    sql: ${cancelled_date} is null ;;
  }

#   dimension: cart_token {
#     type: string
#     sql: ${TABLE}.cart_token ;;
#   }
#
#   dimension: checkout_id {
#     type: number
#     # hidden: yes
#     sql: ${TABLE}.checkout_id ;;
#   }
#
#   dimension: checkout_token {
#     type: string
#     sql: ${TABLE}.checkout_token ;;
#   }
#
#   dimension: client_details__accept_language {
#     type: string
#     sql: ${TABLE}.client_details__accept_language ;;
#   }
#
#   dimension: client_details__browser_height {
#     type: number
#     sql: ${TABLE}.client_details__browser_height ;;
#   }
#
#   dimension: client_details__browser_ip {
#     type: string
#     sql: ${TABLE}.client_details__browser_ip ;;
#   }
#
#   dimension: client_details__browser_width {
#     type: number
#     sql: ${TABLE}.client_details__browser_width ;;
#   }
#
#   dimension: client_details__session_hash {
#     type: string
#     sql: ${TABLE}.client_details__session_hash ;;
#   }
#
#   dimension: client_details__user_agent {
#     type: string
#     sql: ${TABLE}.client_details__user_agent ;;
#   }
#
#   dimension_group: closed {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.closed_at ;;
#   }

  dimension: confirmed {
    type: yesno
    sql: ${TABLE}.confirmed ;;
  }

  dimension: contact_email {
    type: string
    sql: ${TABLE}.contact_email ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      date,
      week,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }
  dimension: is_before_mtd {
    type: yesno
#   hidden: yes
    sql:
    (EXTRACT(DAY FROM ${created_date}) < EXTRACT(DAY FROM GETDATE())
      OR
      (
        EXTRACT(DAY FROM ${created_date}) = EXTRACT(DAY FROM GETDATE()) AND
        EXTRACT(HOUR FROM ${created_date}) < EXTRACT(HOUR FROM GETDATE())
      )
      OR
      (
        EXTRACT(DAY FROM ${created_date}) = EXTRACT(DAY FROM GETDATE()) AND
        EXTRACT(HOUR FROM ${created_date}) <= EXTRACT(HOUR FROM GETDATE()) AND
        EXTRACT(MINUTE FROM ${created_date}) < EXTRACT(MINUTE FROM GETDATE())
      )
    );;

    }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer__accepts_marketing {
    type: yesno
    sql: ${TABLE}.customer__accepts_marketing ;;
  }

  dimension_group: customer__created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.customer__created_at ;;
  }

#   dimension: customer__default_address__address1 {
#     type: string
#     sql: ${TABLE}.customer__default_address__address1 ;;
#   }
#
#   dimension: customer__default_address__address2 {
#     type: string
#     sql: ${TABLE}.customer__default_address__address2 ;;
#   }
#
#   dimension: customer__default_address__city {
#     type: string
#     sql: ${TABLE}.customer__default_address__city ;;
#   }
#
#   dimension: customer__default_address__company {
#     type: string
#     sql: ${TABLE}.customer__default_address__company ;;
#   }
#
#   dimension: customer__default_address__country {
#     type: string
#     sql: ${TABLE}.customer__default_address__country ;;
#   }
#
#   dimension: customer__default_address__country_code {
#     type: string
#     sql: ${TABLE}.customer__default_address__country_code ;;
#   }
#
#   dimension: customer__default_address__country_name {
#     type: string
#     sql: ${TABLE}.customer__default_address__country_name ;;
#   }
#
#   dimension: customer__default_address__default {
#     type: yesno
#     sql: ${TABLE}.customer__default_address__default ;;
#   }
#
#   dimension: customer__default_address__first_name {
#     type: string
#     sql: ${TABLE}.customer__default_address__first_name ;;
#   }
#
#   dimension: customer__default_address__id {
#     type: number
#     sql: ${TABLE}.customer__default_address__id ;;
#   }
#
#   dimension: customer__default_address__last_name {
#     type: string
#     sql: ${TABLE}.customer__default_address__last_name ;;
#   }
#
#   dimension: customer__default_address__name {
#     type: string
#     sql: ${TABLE}.customer__default_address__name ;;
#   }
#
#   dimension: customer__default_address__phone {
#     type: string
#     sql: ${TABLE}.customer__default_address__phone ;;
#   }
#
#   dimension: customer__default_address__province {
#     type: string
#     sql: ${TABLE}.customer__default_address__province ;;
#   }
#
#   dimension: customer__default_address__province_code {
#     type: string
#     sql: ${TABLE}.customer__default_address__province_code ;;
#   }
#
#   dimension: customer__default_address__zip {
#     type: string
#     sql: ${TABLE}.customer__default_address__zip ;;
#   }
#
#   dimension: customer__email {
#     type: string
#     sql: ${TABLE}.customer__email ;;
#   }
#
#   dimension: customer__first_name {
#     type: string
#     sql: ${TABLE}.customer__first_name ;;
#   }
#
#   dimension: customer__id {
#     type: number
#     sql: ${TABLE}.customer__id ;;
#   }
#
#   dimension: customer__last_name {
#     type: string
#     sql: ${TABLE}.customer__last_name ;;
#   }
#
#   dimension: customer__last_order_id {
#     type: number
#     sql: ${TABLE}.customer__last_order_id ;;
#   }
#
#   dimension: customer__last_order_name {
#     type: string
#     sql: ${TABLE}.customer__last_order_name ;;
#   }
#
#   dimension: customer__multipass_identifier {
#     type: string
#     sql: ${TABLE}.customer__multipass_identifier ;;
#   }
#
#   dimension: customer__note {
#     type: string
#     sql: ${TABLE}.customer__note ;;
#   }
#
#   dimension: customer__orders_count {
#     type: number
#     sql: ${TABLE}.customer__orders_count ;;
#   }
#
#   dimension: customer__state {
#     type: string
#     sql: ${TABLE}.customer__state ;;
#   }
#
#   dimension: customer__tags {
#     type: string
#     sql: ${TABLE}.customer__tags ;;
#   }
#
#   dimension: customer__tax_exempt {
#     type: yesno
#     sql: ${TABLE}.customer__tax_exempt ;;
#   }
#
#   dimension: customer__total_spent {
#     type: number
#     sql: ${TABLE}.customer__total_spent ;;
#   }

#   dimension_group: customer__updated {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.customer__updated_at ;;
#   }
#
#   dimension: customer__verified_email {
#     type: yesno
#     sql: ${TABLE}.customer__verified_email ;;
#   }
#
#   dimension: device_id {
#     type: number
#     sql: ${TABLE}.device_id ;;
#   }
#
#   dimension: email {
#     type: string
#     sql: ${TABLE}.email ;;
#   }
#
#   dimension: financial_status {
#     type: string
#     sql: ${TABLE}.financial_status ;;
#   }
#
#   dimension: fulfillment_status {
#     type: string
#     sql: ${TABLE}.fulfillment_status ;;
#   }
#
#   dimension: gateway {
#     type: string
#     sql: ${TABLE}.gateway ;;
#   }

  dimension: landing_site {
    type: string
    sql: ${TABLE}.landing_site ;;
  }

  dimension: landing_site_ref {
    type: string
    sql: ${TABLE}.landing_site_ref ;;
  }

#   dimension: location_id {
#     type: number
#     sql: ${TABLE}.location_id ;;
#   }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: number {
    type: number
    sql: ${TABLE}.number ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
    value_format_name: id
  }

  dimension: order_status_url {
    type: string
    sql: ${TABLE}.order_status_url ;;
  }

#   dimension: payment_details__avs_result_code {
#     type: string
#     sql: ${TABLE}.payment_details__avs_result_code ;;
#   }
#
#   dimension: payment_details__credit_card_bin {
#     type: string
#     sql: ${TABLE}.payment_details__credit_card_bin ;;
#   }
#
#   dimension: payment_details__credit_card_company {
#     type: string
#     sql: ${TABLE}.payment_details__credit_card_company ;;
#   }
#
#   dimension: payment_details__credit_card_number {
#     type: string
#     sql: ${TABLE}.payment_details__credit_card_number ;;
#   }
#
#   dimension: payment_details__cvv_result_code {
#     type: string
#     sql: ${TABLE}.payment_details__cvv_result_code ;;
#   }
#
#   dimension_group: processed {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.processed_at ;;
#   }
#
#   dimension: processing_method {
#     type: string
#     sql: ${TABLE}.processing_method ;;
#   }

#   dimension: reference {
#     type: string
#     sql: ${TABLE}.reference ;;
#   }
#
#   dimension: referring_site {
#     type: string
#     sql: ${TABLE}.referring_site ;;
#   }

  dimension: shipping_address1 {
    type: string
    sql: ${TABLE}.shipping_address__address1 ;;
  }

  dimension: shipping_address2 {
    type: string
    sql: ${TABLE}.shipping_address__address2 ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_address__city ;;
  }

  dimension: shipping_company {
    type: string
    sql: ${TABLE}.shipping_address__company ;;
  }

  dimension: shipping_country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.shipping_address__country ;;
  }

  dimension: shipping_country_code {
    type: string
    sql: ${TABLE}.shipping_address__country_code ;;
  }

  dimension: shipping_first_name {
    type: string
    sql: ${TABLE}.shipping_address__first_name ;;
  }

  dimension: shipping_last_name {
    type: string
    sql: ${TABLE}.shipping_address__last_name ;;
  }

  dimension: shipping_address__latitude {
    type: number
    sql: ${TABLE}.shipping_address__latitude ;;
  }

  dimension: shipping_address__longitude {
    type: number
    sql: ${TABLE}.shipping_address__longitude ;;
  }
  dimension:  shipping_location {
    type: location
    sql_latitude: round(${shipping_address__latitude},0) ;;
    sql_longitude: round(${shipping_address__longitude},0) ;;
  }

  dimension: shipping_address__name {
    type: string
    sql: ${TABLE}.shipping_address__name ;;
  }

#   dimension: shipping_address__phone {
#     type: string
#     sql: ${TABLE}.shipping_address__phone ;;
#   }
#
#   dimension: shipping_address__province {
#     type: string
#     sql: ${TABLE}.shipping_address__province ;;
#   }
#
#   dimension: shipping_address__province_code {
#     type: string
#     sql: ${TABLE}.shipping_address__province_code ;;
#   }
#
#   dimension: shipping_address__zip {
#     type: string
#     sql: ${TABLE}.shipping_address__zip ;;
#   }
#
#   dimension: source_identifier {
#     type: string
#     sql: ${TABLE}.source_identifier ;;
#   }

  dimension: source_name {
    type: string
    sql: ${TABLE}.source_name ;;
  }

  dimension: subtotal_price {
    type: number
    sql: ${TABLE}.subtotal_price ;;
  }

#   dimension: tags {
#     type: string
#     sql: ${TABLE}.tags ;;
#   }

  dimension: taxes_included {
    type: yesno
    sql: ${TABLE}.taxes_included ;;
  }

#   dimension: test {
#     type: yesno
#     sql: ${TABLE}.test ;;
#   }
#
#   dimension: token {
#     type: string
#     sql: ${TABLE}.token ;;
#   }

  dimension: total_discounts {
    type: number
    sql: ${TABLE}.total_discounts ;;
  }

  dimension: total_line_items_price {
    type: number
    sql: ${TABLE}.total_line_items_price ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_price_usd {
    type: number
    sql: ${TABLE}.total_price_usd ;;
  }

  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: total_weight {
    type: number
    sql: ${TABLE}.total_weight ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: total_order {
    type: sum
    sql: ${total_price_usd} ;;
    value_format_name:largeamount
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      checkouts.billing_address__first_name,
      checkouts.billing_address__last_name,
      checkouts.billing_address__name,
      checkouts.customer__default_address__country_name,
      checkouts.customer__default_address__first_name,
      checkouts.customer__default_address__last_name,
      checkouts.customer__default_address__name,
      checkouts.customer__first_name,
      checkouts.customer__last_name,
      checkouts.customer__last_order_name,
      checkouts.id,
      checkouts.name,
      checkouts.shipping_address__first_name,
      checkouts.shipping_address__last_name,
      checkouts.shipping_address__name,
      checkouts.source_name,
      order_refunds.count,
      order_refunds__order_adjustments.count,
      order_refunds__transactions.count,
      orders__fulfillments.count,
      orders__refunds.count,
      orders__refunds__order_adjustments.count,
      orders__refunds__transactions.count,
      transactions.count
    ]
  }
}