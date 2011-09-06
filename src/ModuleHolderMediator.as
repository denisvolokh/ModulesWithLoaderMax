package
{
	import com.events.AppEvent;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	import org.robotlegs.utilities.modular.mvcs.ModuleMediator;
	
	public class ModuleHolderMediator extends Mediator
	{
		[Inject]
		public var view : ModuleHolder;
		
		public function ModuleHolderMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(view.buttonLoadModules, MouseEvent.CLICK, handleLoadModules);
			this.eventMap.mapListener(view.buttonShowA, MouseEvent.CLICK, handleLoadModules);
			this.eventMap.mapListener(view.buttonShowB, MouseEvent.CLICK, handleLoadModules);
			this.eventMap.mapListener(view.buttonShowC, MouseEvent.CLICK, handleLoadModules);
		}
		
		private function handleLoadModules(event : MouseEvent):void
		{
			this.dispatch(new AppEvent(AppEvent.EVENT_START_LOADING));
		}
	}
}