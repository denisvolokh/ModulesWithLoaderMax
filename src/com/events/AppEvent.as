package com.events
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		public static const EVENT_START_LOADING : String = "startLoadinEvent";
		
		public function AppEvent(type:String)
		{
			super(type, true, false);
		}
		
		override public function clone():Event
		{
			return new AppEvent(type);
		}
	}
}