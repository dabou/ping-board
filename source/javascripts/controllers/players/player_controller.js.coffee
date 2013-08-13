PingBoard.PlayerController = Ember.ObjectController.extend

  isSelected: ( ->
    @get("model") is @get("parentController.selectedPlayer")
  ).property("parentController.selectedPlayer")