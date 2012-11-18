class Player extends Sprite3D
  constructor:()->
    @game = enchant.Game.instance
    super()
    @model = @game.assets["model/fighter.l3p.js"]
    @addChild @model
    @roll = 0

    @onenterframe = =>
      if @game.input.right
        @x -= 0.2
        @roll += 0.2
      else
        if @game.input.left
          @x += 0.2
          @roll -= 0.2
        else
          @roll *= 0.8
          if -0.001 < @roll < 0.001
            @roll = 0
      @x = Math.max(-4, Math.min(@x, 4))
      @roll = Math.max(-1.5, Math.min(@roll, 1.5))
      @rotationSet(new Quat(0, 0, 1, @roll))
