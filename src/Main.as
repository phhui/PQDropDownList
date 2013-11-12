package
{	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			var d:PQDropDownList=new PQDropDownList(150,25,125,200);
			d.bindData([{label:"小菜1号"},{label:"小菜2号"},{label:"小菜3号"},{label:"小菜4号"},{label:"小菜5号"},{label:"小菜6号"},{label:"小菜7号"},{label:"小菜8号"},{label:"小菜9号"},{label:"小菜10号"},{label:"小菜11号"},{label:"小菜12号"}]);
			d.x=200;
			d.y=100;
			addChild(d);
		}
	}
}