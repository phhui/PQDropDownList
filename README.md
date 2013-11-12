PQDropDownList
==============

PQDropDownList
下拉列表组件
DEMO:
var data:Array=[{label:"小菜1号"},{label:"小菜2号"},{label:"小菜3号"},{label:"小菜4号"},{label:"小菜5号"},{label:"小菜6号"},{label:"小菜7号"},{label:"小菜8号"},{label:"小菜9号"},{label:"小菜10号"},{label:"小菜11号"},{label:"小菜12号"}];
var d:PQDropDownList=new PQDropDownList(150,25,125,200);//组件默认宽，高，下拉列表宽，高
//绑定数据
d.bindData(data);
d.x=200;
d.y=100;
addChild(d);
//取值1
d.addEventListener(DropDownEvent.ITEM_CLICK,itemChange);
private function itemChange(e:DropDownEvent):void{
	trace("选择了"+e.data.label);
}
//取值2
if(d.selectedValue!=null){
	trace("选择了项："+d.selectedValue.label);
}

by 56lea
