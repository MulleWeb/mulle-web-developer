<|HEADER|>
#import "WebHandler.h"

#import "import-private.h"


@implementation WebHandler

- (MulleCivetWebResponse *)  manager:(MulleWebHandlerManager *) manager
            webResponseForWebRequest:(MulleCivetWebRequest *) request
                              server:(MulleCivetWebServer *) server
{
   NSString                        *printed;
   MulleCivetWebTextResponse       *response;
   MulleObjCBufferedOutputStream   *stream;
   NSDictionary                    *plist;

   switch( [request method])
   {
   case MulleHTTPGet  :
      response = [MulleCivetWebTextResponse webResponseForWebRequest:request];
      [response setHeaderValue:@"application/json"
                         forKey:MulleHTTPContentTypeKey];

      stream = [response createStreamAndSendHeaderData];
      plist  = @{ @"helloWorld": @"VfL Bochum 1848" };
      [plist jsonUTF8DataToStream:stream];
      [stream flush];
      return( nil);
                    // sent this ourselves, thank you
   default :
      break;
   }

   return( [server webResponseForError:501
                      errorDescription:@"We don't do that here"
                         forWebRequest:request]);
}

@end

<|FOOTER|>
