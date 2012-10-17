package ;

/**
 * ...
 * @author sonygod
 */

import haxe.remoting.AMFConnection;

/**
 * ...
 * @author Guntur Sarwohadi
 */

class AMFTest
{

       public static function main():Void
       {
               var url:String = "http://localhost:8080/index.n";
               var c:AMFConnection = AMFConnection.urlConnect(url);
               c.setErrorHandler(onError);
               c.HelloService.hello.call(["one", "two"], onResult);
			   
			   var aa:Array<String> = ["1", "2"];
			   c.HelloService.getLength.call([aa], onResult);
			   
			  
			   
			
			   
			   
			   
       }

       static private function onResult(r:Dynamic):Void
       {
               trace("result: " + r);
       }

       static private function onError(e:Dynamic):Void
       {
               trace("error: " + Std.string(e));
       }

}