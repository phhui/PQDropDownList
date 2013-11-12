package
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class DropDownItem extends Sprite implements IListItem
	{
		private var w:int;
		private var h:int;
		private var txt:TextField;
		private var bg:Sprite;
		private var overSkin:Sprite;
		private var data:Object;
		public function DropDownItem(_w:int=80,_h:int=30)
		{
			super();
			w=_w;
			h=_h;
			initUI();
		}
		
		private function initUI():void
		{
			bg=new Sprite();
			bg.graphics.beginFill(0xff999999,0.5);
			bg.graphics.drawRect(0,0,w,h);
			bg.buttonMode=true;
			this.addChild(bg);
			
			overSkin=new Sprite();
			overSkin.graphics.beginFill(0xff9999,0.9);
			overSkin.graphics.drawRect(0,0,w,h);
			overSkin.mouseEnabled=false;
			overSkin.mouseChildren=false;
			overSkin.visible=false;
			this.addChild(overSkin);
			
			txt=new TextField();
			txt.width=w;
			txt.height=25;
			txt.y=5;
			txt.mouseEnabled=false;
			this.addChild(txt);
			this.addEventListener(MouseEvent.ROLL_OVER,showOverSkin);
			this.addEventListener(MouseEvent.ROLL_OUT,hideOverSkin);
			this.addEventListener(MouseEvent.CLICK,itemClick);
		}
		
		protected function itemClick(e:MouseEvent):void
		{
			this.dispatchEvent(new DropDownEvent(DropDownEvent.ITEM_CLICK,data));
		}
		
		protected function hideOverSkin(e:MouseEvent):void
		{
			overSkin.visible=false;
		}
		
		protected function showOverSkin(e:MouseEvent):void
		{
			overSkin.visible=true;
		}
		
		public function bindData(_data:Object):void
		{
			if(_data==null)throw new Error("数据不能为空！");
			data=_data;
			if(data.label!=null)txt.htmlText=String(data.label);
		}
		
		public function reset():void
		{
			data=null;
			txt.htmlText="";
		}
	}
}