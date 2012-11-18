class Enemy extends Sprite3D
  constructor:()->
    @game = enchant.Game.instance
    super()
    @model = @game.assets["model/enemy1.l3p.js"]
    @addChild @model
    @active = false
    @onenterframe = =>
      @z -= 0.1
      if @z < -5
        @parentNode.removeChild(@)
    #  if @age % 60 < 30
    #    @timer.tl.clear()
    #    @forward(0.2)
    #  else
    #    if @age % 60 is 40
    #      tt = Math.atan2(@game.player.x - @x, @game.player.z - @z)
    #      tf = Math.atan2(@rotation[8], @rotation[10])
    #      #self = @
    #      @timer.tl.then(=>
    #        #self.rotationApply(new Quat(0, 1, 0, (tt - tf) / 20))
    #        @rotationApply(new Quat(0, 1, 0, (tt - tf) / 20))
    #      ).delay(2).loop()
    @on("removed", =>
      @active = false
    )

class Enemies
  constructor:->
    @game = enchant.Game.instance
    @ary = []
    for i in [0...10]
      b = new Enemy()
      @ary.push b
  get: =>
    for i in @ary
      if i.active isnt true
        i.active = true
        i.age = 0
        return i
