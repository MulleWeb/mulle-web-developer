<|HEADER|>
#import "import.h"

#import "import-private.h"


int   main( int argc, const char * argv[])
{
   MulleCurl         *curl;
   MulleJSMNParser   *parser;
   id                plist;
   NSError           *error;

   curl   = [MulleCurl object];
   parser = [MulleJSMNParser object];

   [curl setParser:parser];
   [curl setRequestHeaders:@{
                              @"Accept" : @"application/vnd.github.v3+json",
                              @"User-Agent": @"Awesome-Octocat-App"  // :=)
                            }];

   // for testing turn off https certificate checks

   [curl setOptions:@{
                       @"CURLOPT_SSL_VERIFYPEER": @(NO),
                       @"CURLOPT_SSL_VERIFYHOST": @(NO)
                     }];

   plist = [curl parseContentsOfURLWithString:@"https://api.github.com/users/mulle-nat/orgs"];
   if( ! plist)
   {
      // get current error
      error = [NSError mulleExtract];
      fprintf( stderr, "Error: %s\n", [[error description] UTF8String]);
      return( 1);
   }

   printf( "%s\n", [[plist description] UTF8String]);
   return( 0);
}

<|FOOTER|>
