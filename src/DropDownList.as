package
{
	import flash.display.Sprite;

	public class DropDownList extends Sprite
	{
		private var w:int;
		private var h:int;
		private var data:Array;
		private var item:Array=[];
		private var space:int=1;
		private var bg:Sprite;
		public function DropDownList(_w:int=80,_h:int=100)
		{
			w=_w;
			h=_h;
			initUI();
		}
		public function bindData(_data:Array):void{
			data=_data;
			createItem();
		}
		private function initUI():void{
			createBg();
		}
		private function createBg():void{
			bg=new Sprite();
			bg.graphics.beginFill(0x999999,0.1);
			bg.graphics.drawRect(0,0,w,h);
			bg.mouseChildren=false;
			bg.mouseEnabled=false;
			this.addChild(bg);
		}
		private function createItem():void{
			reset();
			var n:int=data.length;
			for (var i:int = 0; i < n; i++) {
				if(item[i]==null)item[i]= new DropDownItem(w);
				else item[i].reset();
				item[i].addEventListener(DropDownEvent.ITEM_CLICK,itemClick);
				item[i].y = i>0?item[i-1].y+item[i-1].height + space:0;
				this.addChild(item[i]);
				var iitem:IListItem = item[i];
				if(!iitem)throw new Error("列表子项必需实现IListItem接口");
				iitem.bindData(data[i]);				
			}
		}
		private function itemClick(e:DropDownEvent):void{
			this.dispatchEvent(new DropDownEvent(DropDownEvent.ITEM_CLICK,e.data));
		}
		private function reset():void
		{
			
		}
	}
}