<|HEADER|>
#import "WebServer.h"

#import "WebHandler.h"

#import "import-private.h"


static char  *options[] =
{
   "num_threads", "1",
   NULL, NULL
};


@implementation WebServer

- (instancetype) init
{
   MulleWebHandlerManager   *manager;
   WebHandler               *handler;

   self = [self initWithCStringOptions:options];

   handler = [WebHandler object];
   manager = [MulleWebHandlerManager object];
   [self setRequestHandler:manager];

   return( self);
}


- (void) run
{
   for(;;)
   {
      [[NSRunLoop currentRunLoop] run];
      mulle_thread_yield();
   }
}


- (MulleWebHandlerManager *) webHandlerManager
{
   return( (MulleWebHandlerManager *) [self requestHandler]);
}

@end
<|FOOTER|>
