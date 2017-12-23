package
{

	import flash.display.MovieClip;
	import com.oaxoa.fx.Branch;


	public class test extends MovieClip
	{
		const w: uint = stage.stageWidth;
		const h: uint = stage.stageHeight;






		public function test()
		{
			var ct: ColorTransform = new ColorTransform(1, 1, 1, 1, 1, 1, 1);
			var renderView: BitmapData = new BitmapData(w, h, true);
			var bmp: Bitmap = new Bitmap(renderView);
			addChild(bmp);

			var tf: TextFormat = new TextFormat("_sans", 16, 0, true);
			var label: TextField = new TextField();
			label.width = 400;
			label.defaultTextFormat = tf;
			addChild(label);
			var timer: Timer = new Timer(10);
			timer.addEventListener(TimerEvent.TIMER, ontimer);
			timer.start(); // constructor code
		}
		function ontimer(event: TimerEvent): void
		{
			addNew();
		}
		function addNew(): void
		{
			label.text = "Smoothness: " + String(mouseX - w / 2);
			var tt: Branch = new Branch(mouseX - w / 2);
			tt.x = stage.stageWidth / 2;
			tt.y = stage.stageHeight / 2;
			tt.addEventListener(Event.COMPLETE, oncomplete);
			addChild(tt);
			renderView.colorTransform(renderView.rect, ct);
		}
		function oncomplete(event: Event): void
		{
			var t: Branch = event.currentTarget as Branch;
			var matrix: Matrix = new Matrix();
			matrix.translate(t.x, t.y);
			renderView.draw(t, matrix);
			removeChild(t);
			t.removeEventListener(Event.COMPLETE, oncomplete);
			t = null;
		}
	}
