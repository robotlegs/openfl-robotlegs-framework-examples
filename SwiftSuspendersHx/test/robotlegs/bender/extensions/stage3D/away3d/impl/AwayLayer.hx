package robotlegs.bender.extensions.stage3D.away3d.impl; 

import away3d.containers.View3D;
import away3d.core.managers.Stage3DManager;
import away3d.core.managers.Stage3DProxy;
import away3d.events.Stage3DEvent;
import flash.events.Event;
import flash.geom.Rectangle;
import robotlegs.bender.extensions.stage3D.base.api.ILayer;
import robotlegs.bender.extensions.stage3D.base.api.IRenderer;

/**
 * ...
 * @author P.J.Shand
 */
class AwayLayer extends View3D implements ILayer
{
	private var _iRenderer:IRenderer;
	
	public var iRenderer(null, set):IRenderer;
	public var rect(null, set):Rectangle;
	
	private var stage3DManager:Stage3DManager;
	private var profile:String;
	
	public function new(profile:String) 
	{
		super(null, null, null, false, profile);
		this.profile = profile;
		
		this.backgroundColor = 0x555555;
		//this.shareContext = true;
		//addEventListener(Event.ADDED_TO_STAGE, OnAdd);
	}
	
	/*private function OnAdd(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, OnAdd);
		
		stage3DManager = Stage3DManager.getInstance(this.stage);
		_stage3DProxy = stage3DManager.getStage3DProxy(0, false, profile);
		_stage3DProxy.enableDepthAndStencil = true;
		_stage3DProxy.addEventListener(Stage3DEvent.CONTEXT3D_CREATED, onContextCreated);
		
		trace("_stage3DProxy = " + _stage3DProxy.stage3D);
		trace(_stage3DProxy.stage3D == _iRenderer.stage3D);
		
		this.backgroundColor = 0xFF00FF;
		//_stage3DProxy.antiAlias = antiAlias;
	}*/
	
	//private function onContextCreated(e:Event):Void 
	//{
		//iRenderer.stage3D.context3D.
		//trace("onContextCreated");
		//trace(_iRenderer.stage3D.context3D);
		//trace(_stage3DProxy.context3D);
		//trace(_iRenderer.stage3D.context3D == _stage3DProxy.context3D);
		
	//}
	
	public function process():Void
	{
		this.render();
	}
	
	public function set_rect(rect:Rectangle):Rectangle
	{
		this.x = rect.x;
		this.y = rect.y;
		this.width = rect.width;
		this.height = rect.height;
		
		this.stage3DProxy.viewPort.setTo(rect.x, rect.y, rect.width, rect.height);
		
		//this.stage3DProxy.width = cast(rect.width);
		
		return rect;
	}
	
	public function set_iRenderer(value:IRenderer):IRenderer 
	{
		_iRenderer = value;
		return value;
	}
}