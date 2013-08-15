PingBoard.ScoreController = Ember.ObjectController.extend

  ratio: ->
    parties = @get("player1Victories") + @get("player2Victories")
    @get("player1Victories") / parties * 100 if parties > 0


  barStyle: (->
    "width: " + @ratio() + "%"
  ).property("player1Victories", "player2Victories")

  barClass: (->
    if @ratio() < 50
      "bar-danger"
    else if @ratio() > 50
      "bar-success"
    else
      "bar-warning"
  ).property("player1Victories", "player2Victories")