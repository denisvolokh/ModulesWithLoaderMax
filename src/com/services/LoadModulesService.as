package com.services
{
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	
	import org.robotlegs.mvcs.Actor;

	public class LoadModulesService extends Actor implements ILoadModules
	{
		public function LoadModulesService()
		{
			
		}
		
		private var mainQueue : LoaderMax;
		
		public function startLoadModules():void
		{
			this.mainQueue = new LoaderMax({name:"mainQueue", onProgress:progressHandler, onComplete:completeHandler, onError:errorHandler});
			this.mainQueue.append(new SWFLoader("com/modules/a/ModuleA.swf"));
			this.mainQueue.append(new SWFLoader("com/modules/b/ModuleB.swf"));
			this.mainQueue.append(new SWFLoader("com/modules/c/ModuleC.swf"));
			
			this.mainQueue.load();
		}
		
		private function progressHandler(event:LoaderEvent):void 
		{
			trace("progress: " + event.target.progress);
		}
		
		private function completeHandler(event:LoaderEvent):void 
		{
			/*var image:ContentDisplay = LoaderMax.getContent("photo1");
			TweenLite.to(image, 1, {alpha:1, y:100});*/
			trace(event.target + " is complete!");
		}
		
		private function errorHandler(event:LoaderEvent):void 
		{
			trace("error occured with " + event.target + ": " + event.text);
		}
	}
}