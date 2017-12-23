package
{
	import flash.display.Sprite;
	import flash.display.Shape

	import flash.text.TextField;

	import resolumeCom.*;
	//import com.resolumeCom.parameters.*;
	//import com.resolumeCom.events.*;

	//properties 

	public class DrawShape extends Sprite
	{
		private var moon: Shape=new Shape();
		private var x1 = 10
		private var y1 = x1
		private var resolume: Resolume = new Resolume();
		private var paramNumMoon: FloatParameter = resolume.addFloatParameter("Amount", 0.5);


		//constructor gets executed during instantiation of the class
		public function DrawShape()
		{
			x=10
			y=20
			//makeMoon(200, 300);
			clone(moon, 5);


		}


		//make shape
		public function makeMoon(x: int, y: int)
		{
			moon = new Shape();
			moon.graphics.lineStyle(1, 0);
			moon.graphics.beginFill(0xFFFFFF);
			moon.graphics.moveTo(x, y);
			moon.graphics.curveTo(x - 70, y + 50, x, 100 + y);
			moon.graphics.curveTo(x - 50, y + 50, x, y);
			graphics.endFill();
			addChild(moon);

			//makeNewMoon(x,y);
		}
		/*	public function makeNewMoon(x:int,y:int)
		{
			x=x+x1;
			y=y+y1;
			moon = new Shape();		
			moon.graphics.lineStyle(1, 0);
			moon.graphics.beginFill(0xFFFFFF);
			moon.graphics.moveTo(x,y);
			moon.graphics.curveTo(x-70, y+50, x, 100+y);
			moon.graphics.curveTo(x-50, y+50, x, y);
			graphics.endFill();
			addChild(moon);

		}
	*/
		public function clone(shape:Shape, clone:Number)//(clone: Number)
		{
			var i: Number;
			//var shapeArray:Array = new Array;
			trace(String(shape));
			trace(String(clone));
			for (var i = 0; i < clone; i++)
			{
				x = x + x1;
				y = y + y1;
				//var g = String(shape);
				//var g:String = shape.toString();
				
				//var g= String(x);
				//trace(g);
				makeMoon(x, y);
				//make +shape
				//push
			}


		}


		//cluster distance
		//number of a shape to copy 
		public function numShapes(n: Number)
		{

		}

		//


	}

}