<|HEADER|>

#import "import.h"


@interface WebServer : MulleCivetWebServer

- (instancetype) init;
- (void) run;
- (MulleWebHandlerManager *) webHandlerManager;

@end

<|FOOTER|>
