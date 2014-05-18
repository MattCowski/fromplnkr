"use strict"
fromplnkr.controller "InvoiceCtrl", ($scope) ->
  @qty = 1
  @cost = 2
  @inCurr = "EUR"
  @currencies = [
    "USD"
    "EUR"
    "CNY"
  ]
  @usdToForeignRates =
    USD: 1
    EUR: 0.74
    CNY: 6.09

  @total = total = (outCurr) ->
    @convertCurrency @qty * @cost, @inCurr, outCurr

  @convertCurrency = convertCurrency = (amount, inCurr, outCurr) ->
    amount * @usdToForeignRates[outCurr] * 1 / @usdToForeignRates[inCurr]

  @pay = pay = ->
    window.alert "Thanks!"
    return

  return
