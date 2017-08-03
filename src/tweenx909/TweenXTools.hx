package tweenx909;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

class TweenXTools 
{
	
	macro public static function tweenTo(target:Expr, to:Expr, time:ExprOf<Float>, ?ease:ExprOf<Float->Float>, 
									 ?delay:ExprOf<Float>, ?repeat:ExprOf<Int>, ?yoyo:ExprOf<Bool>, 
									 ?zigzag:ExprOf<Bool>, ?interval:ExprOf<Float>, ?autoPlay:ExprOf<Bool>)
	{
		processWildCards(target, to);
		return macro (tweenx909.TweenX.to($target, $to, $time, $ease, $delay, $repeat, $yoyo, $zigzag, $interval, $autoPlay):tweenx909.TweenX);
	}
	
	macro public static function tweenFromTo(target:Expr, from:Expr, to:Expr,  time:ExprOf<Float>, ?ease:ExprOf<Float->Float>, 
									   ?delay:ExprOf<Float>, ?repeat:ExprOf<Int>, ?yoyo:ExprOf<Bool>, 
									   ?zigzag:ExprOf<Bool>, ?interval:ExprOf<Float>, ?autoPlay:ExprOf<Bool>)
    {
		processWildCards(target, to);
		processWildCards(target, from);
	   
		var fromExprs:Array<Expr> = [];
		switch (from.expr)
		{
			case EObjectDecl(fields):
				for (f in fields)
				{
					var name = f.field;
					fromExprs.push(macro untyped $target.$name = ${f.expr});
				}
			case _:
				throw "Block expression expected as properties parameter";
		}
	   
		return macro {					
			$b{fromExprs};
			(tweenx909.TweenX.to($target, $to, $time, $ease, $delay, $repeat, $yoyo, $zigzag, $interval, $autoPlay):tweenx909.TweenX);
		};
    }
	
	macro public static function tweenFrom(target:Expr, from:Expr, time:ExprOf<Float>, ?ease:ExprOf<Float->Float>, 
									   ?delay:ExprOf<Float>, ?repeat:ExprOf<Int>, ?yoyo:ExprOf<Bool>, 
									   ?zigzag:ExprOf<Bool>, ?interval:ExprOf<Float>, ?autoPlay:ExprOf<Bool>)
	{
		
		processWildCards(target, from);
		
		var fromExpr:Array<Expr> = [];
		var toFields:Array<{field:String, expr:Expr}> = [];
		
		switch (from.expr)
		{			
			case EObjectDecl(fields):
				for (f in fields)						
				{					
					var name = f.field;					
					fromExpr.push(macro $target.$name = ${f.expr});
					toFields.push({ field: f.field, expr: macro $target.$name });
				}
				
			case _:
				throw "Block expression expected as a properties parameter";
		}
		var toExpr:Expr = { expr: EObjectDecl(toFields), pos: Context.currentPos() };
		return macro {	
			var t = (tweenx909.TweenX.to($target, $toExpr, $time, $ease, $delay, $repeat, $yoyo, $zigzag, $interval, $autoPlay):tweenx909.TweenX);
			$b{fromExpr};
			t;
		}
	}
	
	#if macro
	static function processWildCards(target:Expr, props:Expr)
	{
		switch (props.expr)
		{			
			case EObjectDecl(fields):
				for (f in fields)						
				{					
					var name = f.field;
					ExprTools.iter(f.expr, function (e)
					{
						
						switch (e.expr)
						{
							case EConst(CIdent(_ => "_")):
								e.expr = (macro $target.$name).expr;
							case _: //ignore
						}
					});					
				}
				
			case _:
				throw "Block expression expected as properties parameter";
		}
	}
	#end
	
	
}