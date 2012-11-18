enchant()
class Sample_Doga2 extends Game
  constructor:->
    super()
    @preload "model/fighter.l3p.js", "model/enemy1.l3p.js"
    @onload = ->
      @scene = new Scene3D()
      cam = @scene.getCamera()
      cam.x = 0
      cam.y = 20
      cam.z = -20

      #@bullets = new Bullets()
      @enemies = new Enemies()
          
      @player = new Player()
      @player.z = -5
      @scene.addChild(@player)

      @onenterframe = =>
        if (Math.random() < 0.2)
          e = @enemies.get()
          if e
            e.x = 0
            e.y = 0
            e.z = 8
            @scene.addChild(e)
      #  if @frame % 100 is 0
      #    e = @enemies.get()
      #    if e
      #      e.x = Math.random() * 80 - 40
      #      e.y = 0.5
      #      e.z = Math.random() * 80 - 40
      #      @scene.addChild(e)

      #  for b in @bullets.ary
      #    if b.active
      #      for e in @enemies.ary
      #        if e.active
      #          if b.intersect(e)
      #            if b.parentNode
      #              b.parentNode.removeChild(b)
      #            e.damage()
      #            exp = new Explosion(e, 1.1)
      #            @scene.addChild(exp)

      #cam.centerX = @player.x + @player.rotation[8] * 2
      #cam.centerY = 0.5
      #cam.centerZ = @player.z + @player.rotation[10] * 2
      #cam.chase(@player, -15, 10)
      #cam.y = 2

      return
    @start()

window.onload = ->
  new Sample_Doga2

