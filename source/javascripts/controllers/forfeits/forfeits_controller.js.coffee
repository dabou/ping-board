PingBoard.ForfeitsController = Ember.ArrayController.extend
  randomForfeit: ->
    @objectAt(Math.floor(Math.random() * @get("length")))