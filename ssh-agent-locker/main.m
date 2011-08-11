#import <Foundation/Foundation.h>

OSStatus keychain_locked_callback(SecKeychainEvent keychainEvent, SecKeychainCallbackInfo *info, void *context);
int kill_ssh_agent(void);

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    SecKeychainAddCallback(&keychain_locked_callback, kSecLockEventMask, nil);
    [[NSRunLoop currentRunLoop] run];
    [pool drain];
    return 0;
}

OSStatus keychain_locked_callback(SecKeychainEvent keychainEvent, SecKeychainCallbackInfo *info, void *context)
{
    int ret = kill_ssh_agent();
    if (ret != 0)
    {
        NSLog(@"Killing ssh-agent returned odd results: %d", ret);
    }
	return 0;
}

int kill_ssh_agent(void)
{
    NSArray *arguments = [NSArray arrayWithObjects:@"stop", @"org.openbsd.ssh-agent", nil];
    NSTask * stopAgent = [NSTask launchedTaskWithLaunchPath:@"/bin/launchctl" arguments:arguments];
    [stopAgent waitUntilExit];
    return [stopAgent terminationStatus];
}
