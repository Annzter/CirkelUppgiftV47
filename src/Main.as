package 
{
	import flash.automation.KeyboardAutomationAction;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.ui.Mouse;
	import flash.display.SpreadMethod;
	
	/**
	 * ...
	 * @author Anna Rosén
	 */
	public class Main extends Sprite 
	{
		
		
		private var scoreText:TextField = new TextField();
		private var score:int = 0;
		
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, resetStage);
			addChild(scoreText); 
			scoreText.text = "Score: 0";
			
			for (var i:int = 0; i <= 19; i++) 
			{
				var Cirkel:Sprite = new Sprite ();
				Cirkel.graphics.beginFill (Math.random() * 0xFF8000);
				Cirkel.graphics.drawEllipse (0, 0, 50, 50);
				Cirkel.graphics.endFill;
				stage.addChild(Cirkel);
				Cirkel.x = stage.stageWidth * Math.random();
				Cirkel.y = stage.stageHeight * Math.random();
				Cirkel.addEventListener(MouseEvent.CLICK, removeCirkel);	
			}
				
			{
				
			}
		}
		private function resetStage (e:KeyboardEvent): void
		{
			if (e.keyCode == 32)
			{
				score = 0;
				scoreText.text = "Score: 0";
			}
			
		}
		private function removeCirkel(e:MouseEvent):void 
		
		{
			Sprite(e.target).x = -1000;
			
			score++;
			scoreText.text = "Score: " + score.toString();
		}
		
	}
	
}