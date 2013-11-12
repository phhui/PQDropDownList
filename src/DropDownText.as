package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	public class DropDownText extends Sprite
	{
		private var txt:TextField;
		private var w:int;
		private var h:int;
		public function DropDownText(_w:int=80,_h:int=25)
		{
			w=_w;
			h=_h;
			super();
			initUI();
		}		
		private function initUI():void
		{
			txt=new TextField();
			txt.width=w;
			txt.height=h;
			txt.border=true;
			var tf:TextFormat=new TextFormat("微软雅黑",14);
			txt.defaultTextFormat=tf;
			txt.type=TextFieldType.INPUT;
			txt.htmlText="<font color='#999999'>选择列表</font>";
			this.addChild(txt);
		}
		public function set Text(s:String):void{
			txt.htmlText=s;
		}
	}
}