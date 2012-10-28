package ;

/**
 * ...
 * @author sonygod
 */

import haxe.remoting.AMFConnection;
import flash.utils.ByteArray;
import ICall;
import tink.lang.Cls;
import haxe.io.Bytes;
/**
 * ...
 * @author sonygod
 */

class AMFTest {

    public static function main():Void {
        var url:String = "http://localhost:8080/index.n";
        var c:AMFConnection = AMFConnection.urlConnect(url);
        c.setErrorHandler(onError);
         //basic call, don't got any tip from ide..
        c.HelloService.hello.call(["one", "two"], onResult);


        function onResult(r:Dynamic) {
            trace("result: " + r);
        }

        function onError(e:Dynamic) {
            trace("error: " + Std.string(e));
        }


        var target = {

        onResult:onResult,
        onError:onError,
        AMF:c,

        };
        var f = new Forwarder(target);
        //special call,got tips.
        f.hello("one", "two");
        f.getLength(["1", "2", "3"]);

    }

    static private function onResult(r:Dynamic):Void {
        trace("Static result: " + r);
    }

    static private function onError(e:Dynamic):Void {
        trace("Static error: " + Std.string(e));
    }

}
typedef Hellox = {
    function hello(x:String, y:String):String;
    function getLength(data:Array < String>):Int;
    function getObject(obj:Obj):String;
    function getClass(p:Bytes):Dynamic;
}

typedef FwdTarget = {

    function onError(e:Dynamic):Void;

    function onResult(r:Dynamic):Void;

    var AMF:AMFConnection;
}


class Forwarder implements Cls {
    var fields:Hash<Dynamic> = new Hash<Dynamic>();
    @:forward(!multiply) var target:FwdTarget;

    @:forward function fwd2(HelloService:Hellox) {
    get: fields.get($name),
    set: fields.set($name, param),

    call:target.AMF.resolve($id).resolve($name).call($args, target.onResult),
    }


    public function new(target) {
    this.target = target;

    }
}
