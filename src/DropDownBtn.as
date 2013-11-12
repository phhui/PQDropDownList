package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	
	public class DropDownBtn extends Sprite
	{
		private var btn:Sprite;
		private var w:int;
		private var h:int;
		private var arrow:Sprite;
		public function DropDownBtn(_w:int=25)
		{
			w=_w;
			h=_w;
			super();
			initUI();
		}
		
		private function initUI():void
		{
			btn=new Sprite();
			btn.buttonMode=true;
			btn.mouseChildren=false;
			this.addChild(btn);
			btn.graphics.beginFill(0x999999,0.8);
			btn.graphics.drawRect(0,0,w,h);
			arrow=new Sprite();
			arrow.graphics.lineStyle(1);
			arrow.graphics.moveTo(3,3);
			arrow.graphics.lineTo(w-3,3);
			arrow.graphics.lineTo(w/2,h-3);
			arrow.graphics.lineTo(3,3);
			btn.addChild(arrow);
		}
	}
}