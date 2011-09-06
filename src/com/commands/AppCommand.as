package com.commands
{
	import com.events.AppEvent;
	import com.services.ILoadModules;
	import com.services.LoadModulesService;
	
	import org.robotlegs.mvcs.Command;
	
	public class AppCommand extends Command
	{
		public function AppCommand()
		{
			super();
		}
		
		[Inject]
		public var event : AppEvent;
		
		[Inject]
		public var service : LoadModulesService;
		
		override public function execute():void
		{
			this.service.startLoadModules();
		}
	}
}