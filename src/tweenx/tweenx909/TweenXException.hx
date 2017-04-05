package tweenx909;

@:enum abstract TweenXExceptionPhase(String)
{
	var INIT = "init";
	var UPDATE = "update";
}

class TweenXException
{
	public var tween:TweenX;
	public var exception:Dynamic;
	public var phase:TweenXExceptionPhase;
	
	public function new(phase:TweenXExceptionPhase, tween:TweenX, exception:Dynamic) 
	{
		this.phase = phase;
		this.tween = tween;
		this.exception = exception;
	}
	
	public function toString()
	{
		var p = tween.definedPosInfos;
		var posInfo = p != null ? 'id: ${tween.id}, generated @ ${p.className}.${p.methodName} (${p.fileName}:${p.lineNumber})' : 'unknown';
		return 'TweenXException($phase) at tween($posInfo): ' + Std.string(exception);
	}
}