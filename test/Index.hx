package ;

/**
 * ...
 * @author sonygod
 */

import neko.Lib;
import nekoserver.amf.AmfHandler;
import nekoserver.amf.io.Amf0;
import nekoserver.io.ResponseOutput;
import nekoserver.RemotingServer;

import HelloService;

/**
 * ...
 * @author Guntur Sarwohadi
 */

class Index
{
       public function new()
       {

       }

/*      public function hello(x:String, y:String):String
       {
               Lib.print("x: " + x + ", y: " + y);
               return x + y;
       }
*/
       static function main()
       {
               var server:RemotingServer = new RemotingServer();
               server.addHandler(new AmfHandler(true));
               server.addObject("HelloService", new HelloService());
               if (server.handleRequest())
                       return;

               Lib.print("remoting server");
       }

}