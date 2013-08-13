PingBoard.Player = Ember.Object.extend
  init: ->
    @_super()
    @set("forfeits", Ember.A())
    @set("victories", Ember.A())

  victoriesVsPlayer: (player) ->
    @get("victories").filter (victory) ->
      victory.get("looser", player)