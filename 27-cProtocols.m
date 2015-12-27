#import <Foundation/Foundation.h>

@protocol PrintProtocolDelegate

- (void)processCompleted;

@end

@interface PrintClass :NSObject
{
    id delegate;
}

- (void) printDetails;
- (void) setDelegate:(id)newDelegate;
@end

@implementation PrintClass

- (void)printDetails{
    NSLog(@"Printing Details");
    [delegate processCompleted];
}

- (void) setDelegate:(id)newDelegate{
    delegate = newDelegate;
}

@end


@interface SampleClass:NSObject<PrintProtocolDelegate>

- (void)startAction;

@end

@implementation SampleClass

- (void)startAction{
    PrintClass *printClass = [[PrintClass alloc]init];
    [printClass setDelegate:self];
    [printClass printDetails];
}

-(void)processCompleted{
    NSLog(@"Printing Process Completed");
}

@end


int main(int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    SampleClass *sampleClass = [[SampleClass alloc]init];
    [sampleClass startAction];
    [pool drain];
    return 0;
}
