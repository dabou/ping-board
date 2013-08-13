PingBoard.Player = Ember.Object.extend
  init: ->
    @_super()
    @set("forfeits", Ember.A())