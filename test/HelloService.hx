package ;

/**
 * ...
 * @author sonygod
 */

import haxe.io.Bytes;
import neko.Lib;
class HelloService
{
       public function new()
       {

       }

       public function hello(x:String, y:String):String
       {
//              Lib.print("x: " + x + ", y: " + y);
               return x + y;
       }
	   
	   public function getLength(data:Array < String>):Int {
		   
		   return data.length;
	   }
	   
	  
}