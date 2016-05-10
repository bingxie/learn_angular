# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

raffler = angular.module('Raffler', [])


raffler.controller "RaffleCtrl", ($scope) ->

  $scope.entries = [
    {name: "Curly"}
    {name: "Larry"}
    {name: "Moe"}
  ]
