PingBoard.PlayersFormController = Ember.ArrayController.extend
  needs: "players"

  name: ""

  add: ->
    @get("controllers.players").addObject(PingBoard.Player.create(name: @get("name")))
    @set("name", "")

  randomizeOrder: ->
    orders = []
    players = @get("controllers.players")
    for i in [0...players.get("length")]
      orders.push i

    orders.sort ->
      Math.random() - 0.5

    players.forEach (player, i) ->
      players.set("order", orders[i])

    players.initializePlayers()
