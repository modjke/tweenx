package tweenxcore.easing;

class Easing {
	static inline var PI = 3.1415926535897932384626433832795;
	static inline var PI_H = PI / 2;

	/*
	 * LINEAR
	 */
	public static inline function linear(t:Float):Float{
		return t;
	}

	/*
	 * SINE
	 */
	public static inline function sineIn(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			1 - Math.cos(t * PI_H);
		}
	}
	public static inline function sineOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			Math.sin(t * PI_H);
		}
	}
	public static inline function sineInOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			-0.5 * (Math.cos(PI * t) - 1);
		}
	}
	public static inline function sineOutIn(t:Float):Float {
		return  if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else if (t < 0.5) {
			0.5 * Math.sin((t * 2) * PI_H);
		} else {
			-0.5 * Math.cos((t * 2 - 1) * PI_H) + 1;
		}
	}


	/*
	 * QUAD EASING
	 */
	public static inline inline function quadIn(t:Float):Float {
		return t * t;
	}
	public static inline inline function quadOut(t:Float):Float {
		return -t * (t - 2);
	}
	public static inline inline function quadInOut(t:Float):Float {
		return (t < 0.5) ? 2 * t * t : -2 * ((t -= 1) * t) + 1;
	}
	public static inline function quadOutIn(t:Float):Float {
		return (t < 0.5) ? -0.5 * (t = (t * 2)) * (t - 2) : 0.5 * (t = (t * 2 - 1)) * t + 0.5;
	}


	/*
	 * CUBIC EASING
	 */
	public static inline function cubicIn(t:Float):Float {
		return t * t * t;
	}
	public static inline function cubicOut(t:Float):Float {
		return (t = t - 1) * t * t + 1;
	}
	public static inline function cubicInOut(t:Float):Float {
		return ((t *= 2) < 1) ?
			0.5 * t * t * t :
			0.5 * ((t -= 2) * t * t + 2);
	}
	public static inline function cubicOutIn(t:Float):Float {
		return 0.5 * ((t = t * 2 - 1) * t * t + 1);
	}


	/*
	 * QUART EASING
	 */
	public static inline function quartIn(t:Float):Float {
		return t * t * t * t;
	}
	public static inline function quartOut(t:Float):Float {
		return 1 - (t = (t = t - 1) * t) * t;
	}
	public static inline function quartInOut(t:Float):Float {
		return ((t *= 2) < 1) ? 0.5 * t * t * t * t : -0.5 * ((t -= 2) * t * t * t - 2);
	}
	public static inline function quartOutIn(t:Float):Float {
		return (t < 0.5) ? -0.5 * (t = t * 2 - 1) * t * t * t + 0.5 : 0.5 * (t = t * 2 - 1) * t * t * t + 0.5;
	}


	/*
	 * QUINT EASING
	 */
	public static inline function quintIn(t:Float):Float {
		return t * t * t * t * t;
	}
	public static inline function quintOut(t:Float):Float {
		return (t = t - 1) * t * t * t * t + 1;
	}
	public static inline function quintInOut(t:Float):Float {
		return ((t *= 2) < 1) ? 0.5 * t * t * t * t * t : 0.5 * (t -= 2) * t * t * t * t + 1;
	}
	public static inline function quintOutIn(t:Float):Float {
		return 0.5 * ((t = t * 2 - 1) * t * t * t * t + 1);
	}


	/*
	 * EXPO EASING
	 */
	public static inline function expoIn(t:Float):Float {
		return t == 0 ? 0 : Math.pow(2, 10 * (t - 1));
	}
	public static inline function expoOut(t:Float):Float {
		return t == 1 ? 1 : (1 - Math.pow(2, -10 * t));
	}
	public static inline function expoInOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else if ((t *= 2) < 1) {
			0.5 * Math.pow(2, 10 * (t - 1));
		} else {
			0.5 * (2 - Math.pow(2, -10 * --t));
		}
	}
	public static inline function expoOutIn(t:Float):Float {
		return if (t < 0.5) {
			0.5 * (1 - Math.pow(2, -20 * t));
		} else if (t == 0.5) {
			0.5;
		} else {
			0.5 * (Math.pow(2, 20 * (t - 1)) + 1);
		}
	}


	/*
	 * CIRC EASING
	 */
	public static inline function circIn(t:Float):Float {
		return 1 - Math.sqrt(1 - t * t);
	}
	public static inline function circOut(t:Float):Float {
		return Math.sqrt(t * (2 - t));
	}
	public static inline function circInOut(t:Float):Float {
		return ((t *= 2) < 1) ? -0.5 * (Math.sqrt(1 - t * t) - 1) : 0.5 * (Math.sqrt(1 - (t -= 2) * t) + 1);
	}
	public static inline function circOutIn(t:Float):Float {
		return (t < 0.5) ? 0.5 * Math.sqrt(1 - (t = t * 2 - 1) * t) : -0.5 * ((Math.sqrt(1 - (t = t * 2 - 1) * t) - 1) - 1);
	}


	/*
	 * BOUNCE EASING
	 */
	public static inline function bounceIn(t:Float):Float {
		return if ((t = 1 - t) < (1 / 2.75)) {
			1 - ((7.5625 * t * t));
		} else if (t < (2 / 2.75)) {
			1 - ((7.5625 * (t -= (1.5 / 2.75)) * t + 0.75));
		} else if (t < (2.5 / 2.75)) {
			1 - ((7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375));
		} else {
			1 - ((7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375));
		}
	}
	public static inline function bounceOut(t:Float):Float {
		return if (t < (1 / 2.75)) {
			(7.5625 * t * t);
		} else if (t < (2 / 2.75)) {
			(7.5625 * (t -= (1.5 / 2.75)) * t + 0.75);
		} else if (t < (2.5 / 2.75)) {
			(7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375);
		} else {
			(7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375);
		}
	}
	public static inline function bounceInOut(t:Float):Float {
		return if (t < 0.5) {
			if ((t = (1 - t * 2)) < (1 / 2.75)) {
				(1 - ((7.5625 * t * t))) * 0.5;
			} else if (t < (2 / 2.75)) {
				(1 - ((7.5625 * (t -= (1.5 / 2.75)) * t + 0.75))) * 0.5;
			} else if (t < (2.5 / 2.75)) {
				(1 - ((7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375))) * 0.5;
			} else {
				(1 - ((7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375))) * 0.5;
			}
		} else {
			if ((t = (t * 2 - 1)) < (1 / 2.75)) {
				((7.5625 * t * t)) * 0.5 + 0.5;
			} else if (t < (2 / 2.75))	{
				((7.5625 * (t -= (1.5 / 2.75)) * t + 0.75)) * 0.5 + 0.5;
			} else if (t < (2.5 / 2.75))	{
				((7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375)) * 0.5 + 0.5;
			} else {
				((7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375)) * 0.5 + 0.5;
			}
		}
	}
	public static inline function bounceOutIn(t:Float):Float {
		return if (t < 0.5) {
			if ((t = (t * 2)) < (1 / 2.75)) {
				0.5 * (7.5625 * t * t);
			} else if (t < (2 / 2.75)) {
				0.5 * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75);
			} else if (t < (2.5 / 2.75)) {
				0.5 * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375);
			} else {
				0.5 * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375);
			}
		} else {
			if ((t = (1 - (t * 2 - 1))) < (1 / 2.75)) {
				0.5 - (0.5 * (7.5625 * t * t)) + 0.5;
			} else if (t < (2 / 2.75)) {
				0.5 - (0.5 * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75)) + 0.5;
			} else if (t < (2.5 / 2.75)) {
				0.5 - (0.5 * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375)) + 0.5;
			} else {
				0.5 - (0.5 * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375)) + 0.5;
			}
		}
	}

	public static inline var overshoot:Float = 1.70158;

	/*
	 * BACK EASING
	 */
	public static inline function backIn(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			t * t * ((overshoot + 1) * t - overshoot);
		}
	}
	public static inline function backOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			((t = t - 1) * t * ((overshoot + 1) * t + overshoot) + 1);
		}
	}
	public static inline function backInOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else if ((t *= 2) < 1) {
			0.5 * (t * t * (((overshoot * 1.525) + 1) * t - overshoot * 1.525));
		} else {
			0.5 * ((t -= 2) * t * (((overshoot * 1.525) + 1) * t + overshoot * 1.525) + 2);
		}
	}
	public static inline function backOutIn(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else if (t < 0.5) {
			0.5 * ((t = t * 2 - 1) * t * ((overshoot + 1) * t + overshoot) + 1);
		} else {
			0.5 * (t = t * 2 - 1) * t * ((overshoot + 1) * t - overshoot) + 0.5;
		}
	}


	/*
	 * ELASTIC EASING
	 */
	static inline var amplitude:Float = 1;
	static inline var period:Float = 0.0003;
	public static inline function elasticIn(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			var s:Float = period / 4;
			-(amplitude * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * 0.001 - s) * (2 * PI) / period));
		}
	}
	public static inline function elasticOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			var s:Float = period / 4;
			Math.pow(2, -10 * t) * Math.sin((t * 0.001 - s) * (2 * PI) / period) + 1;
		}
	}
	public static inline function elasticInOut(t:Float):Float {
		return if (t == 0) {
			0;
		} else if (t == 1) {
			1;
		} else {
			var s:Float = period / 4;

			if ((t *= 2) < 1) {
				-0.5 * (amplitude * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * 0.001 - s) * (2 * PI) / period));
			} else {
				amplitude * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * 0.001 - s) * (2 * PI) / period) * 0.5 + 1;
			}
		}
	}
	public static inline function elasticOutIn(t:Float):Float {
		return if (t < 0.5) {
			if ((t *= 2) == 0) {
				0;
			} else {
				var s = period / 4;
				(amplitude / 2) * Math.pow(2, -10 * t) * Math.sin((t * 0.001 - s) * (2 * PI) / period) + 0.5;
			}
		} else {
			if (t == 0.5) {
				0.5;
			} else if (t == 1) {
				1;
			} else {
				t = t * 2 - 1;
				var s = period / 4;
				-((amplitude / 2) * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * 0.001 - s) * (2 * PI) / period)) + 0.5;
			}
		}
	}

	/*
	 * WARP EASING
	 */
	public static inline function warpOut(t:Float) {
		return t <= 0 ? 0 : 1;
	}
	public static inline function warpIn(t:Float) {
		return t < 1 ? 0 : 1;
	}
	public static inline function warpInOut(t:Float) {
		return t < 0.5 ? 0 : 1;
	}
	public static inline function warpOutIn(t:Float) {
		return if (t <= 0) 0 else if (t < 1) 0.5 else 1;
	}
}
