PingBoard.ReceiverForfeitsController = Ember.ArrayController.extend
  needs: "players"

  filterProperty: "persistent"

  modelBinding: "controllers.players.receiver.forfeits"
