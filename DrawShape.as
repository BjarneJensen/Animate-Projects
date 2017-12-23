package
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import Moon;
	import flash.events.*;
	
	import resolumeCom.*;
	import resolumeCom.parameters.*;
	import resolumeCom.events.*;
	
	



	public class DrawShape extends Sprite
	{

		private var moon0: Moon;
		private var moon1: Moon;
		private var drawing: Array = new Array();
		private var xx = 0;
		private var yy = 0;
		private var x1 = 30
		private var y1 = x1
		private var resolume: Resolume = new Resolume();
		private var paramNumMoon: FloatParameter = resolume.addFloatParameter("Amount", 0.5);
		private var i: int;

		//constructor gets executed during instantiation of the class
		public function DrawShape()
		{

			resolume.addParameterListener(parameterChanged);
			addEventListener(Event.ENTER_FRAME, clone(moon1, 20, 5, 7, 97, 3));
			//clone(moon1, 20, 5, 7, 97, 3);
			//clone(moon0, 50, 15, 7, 67, 93);

			//addChild(drawing[i]);
		}

		public function clone(shape: Moon, clone: Number, xSpace: Number, ySpace: Number, xMoon: Number, yMoon: Number) //(clone: Number)
		{
			var x = xMoon;
			var y = yMoon;
			var i: Number;

			for (var i = 0; i < clone; i++)
			{
				///x = x + x1;
				//y = ;
				//var g = String(shape);
				//var g:String = shape.toString();
				var moon: Moon = new Moon(x, y);
				drawing.push(moon);
				//var g= String(x);
				//trace(g);
				x = x + xSpace;
				y = y + ySpace;
				//moon.x = x + x1;
				//moon.y = y + y1;
				addChild(drawing[i]);
				trace('draw x =' + x);
				trace('asdfasdf=' + moon.x);
				trace('w=' + moon.width);

			}
		}
		private function parameterChanged(event: ChangeEvent): void
		{
			if (event.object == this.paramNumMoon)
			{
				clone(moon1, 20 + this.paramNumMoon.getValue() * 58, 5+ this.paramNumMoon.getValue() * 58, 7+ this.paramNumMoon.getValue() * 58, 97, 3);



			}
		}
	
	}
}
/*		public function setNumMoon(numNumMoon: Number): void
			{
				if (drawing.length == NumMoon)
					return;

				if (drawing.length < NumMoon)
				{
					while (drawing.length < NumMoon)
					{
						addMoon();
					}
				}
				else
				{
					while (drawing.length > NumMoon)
					{
						removeChildAt(drawing.pop().childIndex);
						trace(drawing.length);
					}
				}
			}
*/


//	for ( var j:Number =0; j<i; i++) {
//make clone 0
//shift position scaleFactor
//cluster distance
//number of a shape to copy