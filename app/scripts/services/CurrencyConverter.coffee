"use strict"
fromplnkr.factory "currencyConverter", ->
  convert = (amount, inCurr, outCurr) ->
    amount * usdToForeignRates[outCurr] * 1 / usdToForeignRates[inCurr]
  currencies = [
    "USD"
    "EUR"
    "CNY"
  ]
  usdToForeignRates =
    USD: 1
    EUR: 0.74
    CNY: 6.09

  return (
    currencies: currencies
    convert: convert
  )
  return
