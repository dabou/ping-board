PingBoard.ScoreController = Ember.ObjectController.extend

  ratio: ->
    ###ratio = 1 / (1 + @get("player1Victories") - @get("player2Victories"))
    if @get("player1Victories") > @get("player2Victories")
      ratio = 1 - ratio
    ratio * 100###
    parties = @get("player1Victories") + @get("player2Victories")
    @get("player1Victories") / parties * 100


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