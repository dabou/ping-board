PingBoard.PlayersFormController = Ember.ArrayController.extend
  needs: "players"

  name: ""
  autofocus: "autofocus"

  add: ->
    @get("controllers.players").pushObject(PingBoard.Player.create(name: @get("name")))
    @set("name", "")

  validate: ->
    players = @get("controllers.players")

    if players.get("length") > 1
      players.get("model").sort ->
        Math.random() - 0.5

      players.initializePlayers()
      $(".modal").modal("hide")
    else
      $(".modal .alert").fadeIn()