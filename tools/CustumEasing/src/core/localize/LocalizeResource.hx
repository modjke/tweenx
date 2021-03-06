package core.localize;
import component.complex.ComplexEasingSelectItemId;
import core.output.OutputMode;
import tweenxcore.expr.InOutKind;

interface LocalizeResource 
{
    public function common(key:ResourceKey):String;
    public function easingItem(item:ComplexEasingSelectItemId):String;
    public function outputMode(mode:OutputMode):String;
    public function inOut(kind:InOutKind):String;
    public function getCode():String;
}
