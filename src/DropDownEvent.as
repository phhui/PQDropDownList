package
{
	import flash.events.Event;

	public class DropDownEvent extends Event
	{
		static public const ITEM_CLICK:String="itemClick";
		public var data:Object;
		public function DropDownEvent(type:String,param:Object=null)
		{
			super(type);
			data=param;
		}
	}
}