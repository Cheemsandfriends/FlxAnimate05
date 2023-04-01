package;

import badFlxAnimate.FlxAnimate05;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;

class PlayState extends FlxState
{
	var atlas:FlxSprite;

	override public function create()
	{
		super.create();
		atlas = new FlxSprite();
		atlas.frames = FlxAnimate05.fromAtlas("assets/images/week-7-cutscene-assets-sm");
		atlas.screenCenter();
		atlas.x -= 100;
		atlas.animation.addByPrefix("anim", "GF STARTS TO TURN PART 20", 24);
		atlas.animation.play("anim");
		add(atlas);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (members.indexOf(atlas) != -1)
		{
			var key = cast(FlxG.keys.firstJustPressed(), FlxKey);
			switch (key)
			{
				case D, RIGHT, A, LEFT:
					atlas.x = addAxis(atlas.x, [A, LEFT].indexOf(key) != -1);
				case W, UP, S, DOWN:
					atlas.y = addAxis(atlas.y, [W, UP].indexOf(key) != -1);

				case SPACE:
					(atlas.animation.paused) ? atlas.animation.play("anim") : atlas.animation.pause();
				default:
			}
		}
	}

	function addAxis(axis:Float, minus:Bool)
	{
		var add = 10;
		if (FlxG.keys.pressed.SHIFT)
			add *= 2;
		axis += (minus) ? -add : add;
		return axis;
	}
}
