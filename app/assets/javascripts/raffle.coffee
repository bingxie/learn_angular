# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

raffler = angular.module('Raffler', ["ngResource"])

raffler.config ($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken

raffler.factory "Entry", ["$resource", ($resource) ->
  $resource("/entries/:id", {id: "@id"}, {update: {method: "PUT"}})
]


raffler.controller "RaffleCtrl", ["$scope", "Entry", ($scope, Entry) ->

  $scope.entries = Entry.query()

  $scope.addEntry = ->
    entry = Entry.save($scope.newEntry)
    console.log entry
    $scope.entries.push(entry)
    $scope.newEntry = {}

  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner

    if pool.length > 0
      entry = pool[Math.floor(Math.random() * pool.length)]
      entry.winner = true
      entry.$update()
      $scope.lastWinner = entry

]
