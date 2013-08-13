PingBoard.ResultsController = Ember.ArrayController.extend
  needs: ["players", "victories"]

  playersBinding: "controllers.players.model"

  refreshModel: (->
    results = Ember.A()

    @get("players").forEach (player) =>
      otherPlayers = @get("players").reject (p) =>
        player == p

      otherPlayers.forEach (op) ->
        result = PingBoard.Result.create
          player1: player
          player2: op
          player1Score: player.victoriesVsPlayer(op).get("length")
          player2Score: op.victoriesVsPlayer(player).get("length")

        results.addObject(result)
    @set("model", results)
  ).observes("controllers.victories.@each")
