"use strict"
fromplnkr.constant('FIREBASE_URL', 'https://kts32014.firebaseio.com/')
fromplnkr.factory "Uploads", ($firebase, FIREBASE_URL) ->
  ref = new Firebase(FIREBASE_URL + 'uploads')
  $firebase(ref)
