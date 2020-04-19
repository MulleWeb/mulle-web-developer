<|HEADER|>
#import "import.h"

#import "WebServer.h"
#import "WebHandler.h"

#import "import-private.h"


int   main( int argc, char *argv[])
{
   WebServer                *server;
   MulleWebHandlerManager   *manager;
   WebHandler               *handler;

   // your server subclass
   server  = [WebServer object];
   manager = [server webHandlerManager];
   // your handler subclass
   handler = [WebHandler object];

   // make available at https://localhost/foo
   [manager setHandler:handler
                forKey:@"foo"];

   // technically webserver is already running though!
   fprintf( stderr, "Serving content at: localhost:8080/foo\n");

   [server run];  // this is an endless runloop
   return( 0);
}

<|FOOTER|>
