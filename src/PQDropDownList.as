package
{	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;

	public class PQDropDownList extends Sprite
	{
		private var txt:DropDownText;
		private var btn:DropDownBtn;
		private var list:DropDownList;
		private var scr:scroll;
		private var bg:Sprite;
		private var listPanel:Sprite;
		private var inited:Boolean=false;
		private var w:int=80;
		private var h:int=30;
		private var listw:int=50;
		private var listh:int=100;
		public var selectedValue:Object;
		public function PQDropDownList(_w:int=80,_h:int=30,_listW:int=50,_listH:int=100)
		{
			w=_w;
			h=_h;
			listw=_listW;
			listh=_listH;
			this.addEventListener(Event.REMOVED_FROM_STAGE,remove);
			initUI();
		}
		public function bindData(data:Array):void{
			list.bindData(data);
			scr.updateBind();
		}
		public function show(stage:Stage):void{
			stage.addChild(this);
		}
		protected function initUI():void{
			listPanel=new Sprite();
			listPanel.y=h;
			listPanel.visible=false;
			this.addChild(listPanel);
			createTxt();
			createBtn();
			createList();
			createScroll();
		}
		protected function createBg():void{
			bg=new Sprite();
			bg.graphics.beginFill(0xffffff,1);
			bg.graphics.drawRect(0,0,w,h);
			this.addChild(bg);
		}
		protected function createTxt():void{
			txt=new DropDownText(w-h,h-1);
			this.addChild(txt);
		}
		protected function createBtn():void{
			btn=new DropDownBtn();
			btn.x=w-btn.width;
			this.addChild(btn);
			btn.addEventListener(MouseEvent.CLICK,showList);
		}		
		protected function createList():void{
			list=new DropDownList(listw,listh);
			list.y=h;
			listPanel.addChild(list);
			list.addEventListener(DropDownEvent.ITEM_CLICK,itemChange);
		}
		
		protected function itemChange(e:DropDownEvent):void
		{
			selectedValue=e.data;
			this.dispatchEvent(new DropDownEvent(DropDownEvent.ITEM_CLICK,e.data));
			txt.Text=e.data.label;
			hideList();
		}
		
		private function hideList():void
		{
			listPanel.visible=false;
		}
		protected function createScroll():void{
			scr=new scroll();
			scr.x=w-h;
			var up:Sprite=new Sprite();
			var down:Sprite=new Sprite();
			var bar:Sprite=new Sprite();
			var bg:Sprite=new Sprite();
			up.graphics.beginFill(0x999999,1);
			up.graphics.drawRect(0,0,10,10);
			down.graphics.beginFill(0x999999,1);
			down.graphics.drawRect(0,0,10,10);
			bar.graphics.beginFill(0x000000,1);
			bar.graphics.drawRect(0,0,10,50);
			bg.graphics.beginFill(0x999999,0.5);
			bg.graphics.drawRect(0,0,10,20);
			scr.setSkin(up,down,bar,bg);
			scr.bindObj(list,new Rectangle(0,0,listw,listh),listh);
			listPanel.addChild(scr);
		}		
		protected function showList(event:MouseEvent):void{
			listPanel.visible=!listPanel.visible;
		}
		protected function remove(e:Event):void
		{
			
		}
	}
}