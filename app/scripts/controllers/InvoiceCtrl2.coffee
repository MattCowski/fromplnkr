"use strict"
fromplnkr.controller "InvoiceCtrl2", ($scope) ->
    @qty = 1
    @cost = 2
    @inCurr = "EUR"
    @currencies = currencyConverter.currencies
    @total = total = (outCurr) ->
      currencyConverter.convert @qty * @cost, @inCurr, outCurr

    @pay = pay = ->
      window.alert "Thanks!"
      return
