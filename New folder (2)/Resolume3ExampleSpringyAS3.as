﻿package{	import flash.display.DisplayObject;	import flash.display.MovieClip;	import flash.events.*;	import fl.motion.Color;		import resolumeCom.*;	import resolumeCom.parameters.*;	import resolumeCom.events.*;	public class Resolume3ExampleSpringyAS3 extends MovieClip	{		
		private var dug:Number=0;
		private var resolume:Resolume = new Resolume();		private var paramNumParticles:FloatParameter = resolume.addFloatParameter("Amount", 0.5);		private var paramMinDist:FloatParameter = resolume.addFloatParameter("Distance", 0.5);		private var paramLinesOnly:BooleanParameter = resolume.addBooleanParameter("Lines only", false);
		private var paramDotsOnly:BooleanParameter = resolume.addBooleanParameter("Dots only", false);
		private var paramRandomize:EventParameter = resolume.addEventParameter("Randomize!");				private var particles:Array = new Array();		private var minDist:Number = 100;		private var springAmount:Number = .001;				public function Resolume3ExampleSpringyAS3():void		{			//set callback, this will notify us when a parameter has changed			resolume.addParameterListener(parameterChanged);			addEventListener(Event.ENTER_FRAME, update);			init();		}				private function init():void		{			for (var i:Number=0; i<30; i++)				addParticle();		}				private function update(event:Event): void		{			var i:Number = 0;			for (i=0; i<particles.length; i++) {				var particle:Particle = particles[i];				particle.x += particle.vx;				particle.y += particle.vy;				if (particle.x > stage.stageWidth)				{					particle.x = 0;				} else if (particle.x < 0 ) {					particle.x = stage.stageWidth;				}				if (particle.y > stage.stageHeight)				{					particle.y = 0;				} else if (particle.y < 0 ) {					particle.y = stage.stageHeight;				}				//particle.visible = !this.paramLinesOnly.getValue();			}						//clear the canvas, this removes any shapes we drawed in the previous pass			this.graphics.clear();			for (i=0; i<particles.length; i++) {				var particleA:Particle = particles[i];				for (var j:Number=i+1; j<particles.length; j++) {					var particleB:Particle = particles[j];	
					if (dug==0){spring2(particleA, particleB);}
					else {spring(particleA, particleB);}				}			}					}				public function setNumParticles(numParticles:Number): void		{			if (particles.length == numParticles)				return;							if (particles.length < numParticles) {				while (particles.length < numParticles) {					addParticle();				}			} else {				while (particles.length > numParticles) {					removeChildAt(particles.pop().childIndex);					trace(particles.length);				}			}		}				private function addParticle(): void		{			var particle:Particle = new Particle();			setupParticle(particle);			particles.push(particle);			particle.childIndex = particles.length-1;			particle.visible = !this.paramLinesOnly.getValue();			addChild(particle);				//we set the childIndex ourselves so we can always find it back			setChildIndex(particle, particle.childIndex);		}				private function setupParticle(particle:Particle): void		{			particle.x = Math.random() * stage.stageWidth;			particle.y = Math.random() * stage.stageHeight;			particle.vx = Math.random() * 6 - 3;			particle.vy = Math.random() * 6 - 3;		}				private function randomizeParticles(): void		{			for (var i:Number=0; i<particles.length; i++)				setupParticle(particles[i]);		}		private function spring(particleA:Particle, particleB:Particle): void		{			var dx:Number = particleB.x - particleA.x;			var dy:Number = particleB.y - particleA.y;			var dist:Number = Math.sqrt(dx*dx + dy*dy);			var fromColor:uint=0xFFFFFF;			var toColor:uint=0x00FF55;						if (dist < minDist)			{				var factor:Number = (100 - dist / minDist * 100) / 100;				var lineColor:uint = Color.interpolateColor(fromColor, toColor, factor);				this.graphics.lineStyle(3, lineColor, factor);				this.graphics.moveTo(particleA.x, particleA.y);				this.graphics.lineTo(particleB.x, particleB.y);								var ax:Number = dx * springAmount;				var ay:Number = dy * springAmount;								particleA.vx += ax;				particleA.vy += ay;				particleB.vx -= ax;				particleB.vy -= ay;							}					}
		private function spring2(particleA, particleB): void
		{
			var dx:Number = particleB.x - particleA.x;
			var dy:Number = particleB.y - particleA.y;
			var dist:Number = Math.sqrt(dx*dx + dy*dy);

			var fromColor:uint=0xFFFFFF;
			var toColor:uint=0x00FF55;
			
			if (dist < minDist)
			{
				var factor:Number = (100 - dist / minDist * 100) / 100;
				var lineColor:uint = Color.interpolateColor(fromColor, toColor, factor);
				this.graphics.lineStyle(3, lineColor, factor);
				this.graphics.moveTo(particleB.x, particleA.y);
				this.graphics.lineTo(particleA.x, particleB.y);
				
				var ax:Number = dx * springAmount;
				var ay:Number = dy * springAmount;
				
				particleA.vx += ax;
				particleA.vy += ay;
				particleB.vx -= ax;
				particleB.vy -= ay;
				
			}

			
		}				private function parameterChanged(event:ChangeEvent): void		{			if ( event.object == this.paramNumParticles ) {				setNumParticles( 2 + (this.paramNumParticles.getValue() * 58) );			} else if (event.object == this.paramMinDist) {				minDist = 50 + (this.paramMinDist.getValue() * 1000);			} else if (event.object == this.paramRandomize) {				if (this.paramRandomize.getValue())					randomizeParticles();			} else if (event.object == this.paramLinesOnly) {				for (var i:Number=0; i<particles.length; i++)					particles[i].visible = !this.paramLinesOnly.getValue();			} else if (event.object == this.paramDotsOnly) {
				if (this.paramDotsOnly.getValue()==true){
					dug=1
					//spring2(ParticleA,ParticleB)
					}
				if (this.paramDotsOnly.getValue()==false){
					dug=0
					//spring(ParticleA,ParticleB);
					}		}			}}
}