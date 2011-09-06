package
{
	import com.commands.AppCommand;
	import com.events.AppEvent;
	import com.services.ILoadModules;
	import com.services.LoadModulesService;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class AppContext extends Context
	{
		public function AppContext(contextView:DisplayObjectContainer=null)
		{
			super(contextView, true);
		}
		
		override public function startup():void
		{
			super.startup();
			
			this.viewMap.mapType(ILoadModules);
			
			this.injector.mapSingleton(LoadModulesService);
			
			this.mediatorMap.mapView(ModuleHolder, ModuleHolderMediator);
			
			this.commandMap.mapEvent(AppEvent.EVENT_START_LOADING, AppCommand, AppEvent);
		}
	}
}