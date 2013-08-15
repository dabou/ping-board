PingBoard.ScoresController = Ember.ArrayController.extend
  needs: ["players", "matches"]

  itemController: "score"

  playersBinding: "controllers.players.model"
  matchesBinding: "controllers.matches.model"

  updateModel: (->
    scores = Ember.A()

    @get("players").forEach (player) =>
      otherPlayers = @get("players").reject (p) =>
        player == p

      otherPlayers.forEach (op) =>
        score = @scoreBetweenPlayers(player, op)

        scores.addObject(score)
    @set("model", scores)
  ).observes("matches.@each")

  scoreBetweenPlayers: (player1, player2) ->
    victoriousMatches = @get("matches").filter (match) ->
      match.get("winner") is player1 and match.get("looser") is player2

    defeatedMatches = @get("matches").filter (match) ->
      match.get("looser") is player1 and match.get("winner") is player2

    PingBoard.Score.create
      player1: player1
      player2: player2
      player1Victories: victoriousMatches.get("length")
      player2Victories: defeatedMatches.get("length")
