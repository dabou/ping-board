PingBoard.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @render()

    @render "players",
      into: "application"
      outlet: "players"

    @render "results",
      into: "application"
      outlet: "results"

    @render "receiver_forfeits",
      into: "application"
      outlet: "receiverForfeits"

    @render "logs",
      into: "application"
      outlet: "logs"

    @render "players_form",
      into: "application",
      outlet: "playersForm"

  setupController: ->
    # Initialize forfeits from external datas
    forfeits = PingBoard.Data.forfeits.map (forfeit) ->
      PingBoard.Forfeit.create(forfeit)
    forfeitsController = @controllerFor("forfeits")
    forfeitsController.set("default", PingBoard.Forfeit.create(PingBoard.Data.defaultForfeit))
    forfeitsController.set("model", forfeits)