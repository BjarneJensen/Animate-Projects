package
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import Moon;
	import flash.events.*;

	import resolumeCom.*;
	import resolumeCom.parameters.*;
	import resolumeCom.events.*;

	public class Sheep extends Sprite
	{
		private var resolume: Resolume = new Resolume();
		private var paramNummoons: FloatParameter = resolume.addFloatParameter("Amount", 0.5);
		private var paramMinDist: FloatParameter = resolume.addFloatParameter("Distance", 0.5);
		private var paramLinesOnly: BooleanParameter = resolume.addBooleanParameter("Lines only", false);
		private var paramRandomize: EventParameter = resolume.addEventParameter("Randomize!");

		private var moons: Array = new Array();
		private var minDist: Number = 100;
		private var springAmount: Number = .001;
		private var vx:int;
		private var vy:int;

		
		


		public function Sheep(): void
		{
			resolume.addParameterListener(parameterChanged);
			addEventListener(Event.ENTER_FRAME, update);
			init();
			// constructor code
		}

		private function init(): void
		{
			for (var i: Number = 0; i < 30; i++)
				addMoon(x,y,vx,vy);
		}

		private function update(event: Event): void
		{
			var i: Number = 0;
			for (i = 0; i < moons.length; i++)
			{
				var moon: Moon = moons[i];
				moon.x += moon.vx;
				moon.y += moon.vy;
				if (moon.x > stage.stageWidth)
				{
					moon.x = 0;
				}
				else if (moon.x < 0)
				{
					moon.x = stage.stageWidth;
				}
				if (moon.y > stage.stageHeight)
				{
					moon.y = 0;
				}
				else if (moon.y < 0)
				{
					moon.y = stage.stageHeight;
				}
				//moon.visible = !this.paramLinesOnly.getValue();
			}

			//clear the canvas, this removes any shapes we drawed in the previous pass
			this.graphics.clear();

			for (i = 0; i < moons.length; i++)
			{
				var moonA: Moon = moons[i];
				for (var j: Number = i + 1; j < moons.length; j++)
				{
					var moonB: Moon = moons[j];
					spring(moonA, moonB);
				}
			}

		}

		public function setNummoons(nummoons: Number): void
		{
			if (moons.length == nummoons)
				return;

			if (moons.length < nummoons)
			{
				while (moons.length < nummoons)
				{
					addMoon(x,y,vx,vy);
				}
			}
			else
			{
				while (moons.length > nummoons)
				{
					removeChildAt(moons.pop().childIndex);
					trace(moons.length);
				}
			}
		}

		private function addMoon(x:int,y:int,vx:int,vy:int): void
		{
			var moon: Moon = new Moon(x,y,vx,vy);
			setupMoon(moon);
			moons.push(moon);
			moon.childIndex = moons.length - 1;
			moon.visible = !this.paramLinesOnly.getValue();
			addChild(moon);
			//we set the childIndex ourselves so we can always find it back
			setChildIndex(moon, moon.childIndex);
		}

		private function setupMoon(moon: Moon): void
		{
			moon.x = Math.random() * stage.stageWidth;
			moon.y = Math.random() * stage.stageHeight;
			moon.vx = Math.random() * 6 - 3;
			moon.vy = Math.random() * 6 - 3;
		}

		private function randomizemoons(): void
		{
			for (var i: Number = 0; i < moons.length; i++)
				setupMoon(moons[i]);
		}

		private function spring(moonA: Moon, moonB: Moon): void
		{
			var dx: Number = moonB.x - moonA.x;
			var dy: Number = moonB.y - moonA.y;
			var dist: Number = Math.sqrt(dx * dx + dy * dy);

			var fromColor: uint = 0xFFFFFF;
			var toColor: uint = 0x00FF55;

			if (dist < minDist)
			{
				var factor: Number = (100 - dist / minDist * 100) / 100;
				//var lineColor: uint = Color.interpolateColor(fromColor, toColor, factor);
				//this.graphics.lineStyle(3, lineColor, factor);
				this.graphics.moveTo(moonA.x, moonA.y);
				this.graphics.lineTo(moonB.x, moonB.y);

				var ax: Number = dx * springAmount;
				var ay: Number = dy * springAmount;

				moonA.vx += ax;
				moonA.vy += ay;
				moonB.vx -= ax;
				moonB.vy -= ay;

			}


		}
		private function parameterChanged(event:ChangeEvent): void
		{
			if ( event.object == this.paramNummoons ) {
				setNummoons( 2 + (this.paramNummoons.getValue() * 58) );
			} else if (event.object == this.paramMinDist) {
				minDist = 50 + (this.paramMinDist.getValue() * 1000);
			} else if (event.object == this.paramRandomize) {
				if (this.paramRandomize.getValue())
					randomizemoons();
			} else if (event.object == this.paramLinesOnly) {
				for (var i:Number=0; i<moons.length; i++)
					moons[i].visible = !this.paramLinesOnly.getValue();
					//spring2(ParticleA,ParticleB)
					

		

				}
				}

	}
}

