package tweenxcore.tools;
import tweenxcore.structure.Direction;

class FloatTools
{
    public static inline var START:Float = 0.0;
    public static inline var END:Float = 1.0;

	public static inline function revert(rate:Float):Float
	{
		return 1 - rate;
	}

	public static inline function clamp(value:Float, min:Float = 0.0, max:Float = 1.0):Float
	{
		return if (value <= min) min else if (max <= value) max else value;
	}

	public static inline function lerp(rate:Float, from:Float, to:Float):Float
	{
		return from * (1 - rate) + to * rate;
	}

	public static inline function inverseLerp(value:Float, from:Float, to:Float):Float
	{
		return (value - from) / (to - from);
	}

    /*
	public static inline function repeat(value:Float, from:Float = 0.0, to:Float = 1.0):Float
	{
		var p = inverseLerp(value, from, to);
		return p - Math.floor(p);
	}

    public static inline function repeatCount(value:Float, from:Float = 0.0, to:Float = 1.0):Int
	{
		return Math.floor(inverseLerp(value, from, to));
	}
    */

	public static inline function yoyo(rate:Float, easing:Float->Float):Float
	{
		return easing((if (rate < 0.5) rate else (1 - rate)) * 2);
	}

	public static inline function zigzag(rate:Float, easing:Float->Float):Float
	{
		return if (rate < 0.5) easing(rate * 2) else 1 - easing((rate - 0.5) * 2);
	}

	public static inline function shake(rate:Float, center:Float = 0.0)
	{
		return center + rate * (1 - 2 * Math.random());
	}

	public static inline function sinWithRate(rate:Float) {
		return Math.sin(rate * 2 * Math.PI);
	}

	public static inline function cosWithRate(rate:Float) {
		return Math.cos(rate * 2 * Math.PI);
	}

    public static inline function isBetween(rate:Float, from:Float, to:Float):Bool {
        return from <= rate || rate <= to;
    }

	public static inline function binarySearch(sortedValues:Array<Float>, value:Float):Int
	{
		var min = 0;
		var max = sortedValues.length;

		while (true) {
			var next = Std.int((max - min) / 2) + min;
			var dv = sortedValues[next];
			if (dv <= value) {
				min = next + 1;
			} else {
				max = next;
			}
			if (min == max) {
				break;
			}
		}

		return min;
	}



    // =================================================
    // Bezier Curve
    // =================================================

	public static inline function bezier2(rate:Float, from:Float, control:Float, to:Float):Float
	{
		return lerp(rate, lerp(rate, from, control), lerp(rate, control, to));
	}

	public static inline function bezier3(rate:Float, from:Float, control1:Float, control2:Float, to:Float):Float
	{
		return bezier2(rate, lerp(rate, from, control1), lerp(rate, control1, control2), lerp(rate, control2, to));
	}

	public static inline function bezier(rate:Float, points:Array<Float>):Float
	{
		if (points.length < 2) {
			throw "points length must be more than 2";
		} else if (points.length == 2) {
			return lerp(rate, points[0], points[1]);
		} else if (points.length == 3) {
			return bezier2(rate, points[0], points[1], points[2]);
		}

		return _bezier(rate, points);
	}

	static function _bezier(rate:Float, points:Array<Float>)
	{
		if (points.length == 4) {
			return bezier3(rate, points[0], points[1], points[2], points[3]);
		}

		return _bezier(rate, [for (i in 0...points.length - 1) lerp(rate, points[i], points[i + 1])]);
	}

    // =================================================
    // Converter
    // =================================================

    public static inline function frameToSecond(frame:Float, fps:Float):Float {
        return frame / fps;
    }
    public static inline function secondToFrame(second:Float, fps:Float):Float {
        return second * fps;
    }
    public static inline function degreeToRate(degree:Float) {
        return degree / 360;
    }
    public static inline function rateToDegree(rate:Float) {
        return rate * 360;
    }
    public static inline function radianToRate(radian:Float) {
        return radian / (2 * Math.PI);
    }
    public static inline function rateToRadian(rate:Float) {
        return rate * 2 * Math.PI;
    }
}