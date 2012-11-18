// Generated by CoffeeScript 1.3.3
(function() {
  var Player, Sample_Doga2,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  enchant();

  Sample_Doga2 = (function(_super) {

    __extends(Sample_Doga2, _super);

    function Sample_Doga2() {
      Sample_Doga2.__super__.constructor.call(this);
      this.preload("model/fighter.l3p.js");
      this.onload = function() {
        var cam;
        this.scene = new Scene3D();
        cam = this.scene.getCamera();
        cam.x = 0;
        cam.y = 20;
        cam.z = -20;
        this.player = new Player();
        this.player.z = -5;
        this.scene.addChild(this.player);
      };
      this.start();
    }

    return Sample_Doga2;

  })(Game);

  window.onload = function() {
    return new Sample_Doga2;
  };

  Player = (function(_super) {

    __extends(Player, _super);

    function Player() {
      var _this = this;
      this.game = enchant.Game.instance;
      Player.__super__.constructor.call(this);
      this.model = this.game.assets["model/fighter.l3p.js"];
      this.addChild(this.model);
      this.roll = 0;
      this.onenterframe = function() {
        var _ref;
        if (_this.game.input.right) {
          _this.x -= 0.2;
          _this.roll += 0.2;
        } else {
          if (_this.game.input.left) {
            _this.x += 0.2;
            _this.roll -= 0.2;
          } else {
            _this.roll *= 0.8;
            if ((-0.001 < (_ref = _this.roll) && _ref < 0.001)) {
              _this.roll = 0;
            }
          }
        }
        _this.x = Math.max(-4, Math.min(_this.x, 4));
        _this.roll = Math.max(-1.5, Math.min(_this.roll, 1.5));
        return _this.rotationSet(new Quat(0, 0, 1, _this.roll));
      };
    }

    return Player;

  })(Sprite3D);

}).call(this);