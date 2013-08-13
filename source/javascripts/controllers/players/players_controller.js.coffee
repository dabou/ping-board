PingBoard.PlayersController = Ember.ArrayController.extend
  needs: ["forfeits", "logs", "victories"]
  itemController: "player"
  sortProperties: "order"

  selectedPlayer: null
  server: null
  receiver: null

  initializePlayers: ->
    @set("server", @objectAt(0).get("model"))
    @set("receiver", @objectAt(1).get("model"))

  selectPlayer: (player) ->
    @set("selectedPlayer", player)

  # Append default forfeit to player who win 3 - 0
  playerWin30: ->
    winner = @get("selectedPlayer")
    if winner?
      @addPlayerForfeit(winner, @get("controllers.forfeits.default"))
      @playerWin()

  # Do changes when player win
  playerWin: ->
    winner = @get("selectedPlayer")

    if winner?
      looser = if winner is @get("server")
        @get("receiver")
      else
        @get("server")

      @addPlayerVictory(winner, looser)
      @addPlayerForfeit(winner, @get("controllers.forfeits").randomForfeit())
      @emptyPlayerForfeits(looser)

      @set("server", looser)
      @set("receiver", @nextPlayer(winner))

      @set("selectedPlayer", null)

  # Clean forfeits
  emptyPlayerForfeits: (player) ->
    player.get("forfeits").clear()

  # Find the next player
  nextPlayer: (player) ->
    players = @get("model")
    index = players.indexOf(player)
    index = if index < @get("length") then index else 0
    players.objectAt(index)

  addPlayerForfeit: (player, forfeit) ->
    logsController = @get("controllers.logs")

    forfeits = player.getWithDefault("forfeits")
    forfeits.pushObject(forfeit)
    player.set("forfeits", forfeits)
    logsController.addObject(PingBoard.Log.create(player: player, forfeit: forfeit))

  addPlayerVictory: (player, looser) ->
    victory = PingBoard.Victory.create(looser: looser)
    player.get("victories").pushObject(victory)
    @get("controllers.victories").addObject(victory)
