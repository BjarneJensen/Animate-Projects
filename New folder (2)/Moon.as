package
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import flash.events.*;

	public class Moon extends Sprite
	{
		private var moon: Shape;
		public var vx:int;
		public var vy:int;
		public var childIndex:int;
		//private var yy = 30;

		public function Moon(x:int,y:int,vx:int,vy:int)
		{
			makeMoon(x,y);
			// constructor code
		}
		public function makeMoon(x: int, y: int)
		{
			trace('hello!');
			moon = new Shape();
			moon.graphics.lineStyle(1, 0);
			moon.graphics.beginFill(0xFFFFFF);
			moon.graphics.moveTo(x, y);
			moon.graphics.curveTo(x - 70, y + 50, x, 100 + y);
			moon.graphics.curveTo(x - 50, y + 50, x, y);
			graphics.endFill();
			addChild(moon);
			trace('moon x ='+x);
			trace('moon y ='+y);

		}

	}
}