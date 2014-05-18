"use strict"
fromplnkr.filter "reverse", ->
  (input, uppercase) ->
    out = ""
    i = 0

    while i < input.length
      out = input.charAt(i) + out
      i++
    out = out.toUpperCase()  if uppercase
    out
