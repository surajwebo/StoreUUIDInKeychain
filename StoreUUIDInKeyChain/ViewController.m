//
//  ViewController.m
//  StoreUUIDInKeyChain
//
//  Created by Suraj on 23/01/14.
//  Copyright (c) 2014 Suraj. All rights reserved.
//

#import "ViewController.h"

static NSString * const KeychainItem_Service = @"FDKeychain";
static NSString * const KeychainItem_UUID = @"Local";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *UUID = [self generateUUID];
    NSLog(@"UUID: %@",UUID);
    
    [lblUUID setText:UUID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Create UUID
-(NSString *)generateUUID {
    NSString *CFUUID = nil;
    
    if (![FDKeychain itemForKey: KeychainItem_UUID
                     forService: KeychainItem_Service
                          error: nil]) {
        //create CFUUDID.
        CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
        
        CFUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuid));
        
        //[[NSUserDefaults standardUserDefaults] setObject:CFUUID forKey:@"UUID"];
        
        [FDKeychain saveItem: CFUUID
                      forKey: KeychainItem_UUID
                  forService: KeychainItem_Service
                       error: nil];
        
    } else {
        // CFUUID = [[NSUserDefaults standardUserDefaults] objectForKey:@"UUID"];
        CFUUID = [FDKeychain itemForKey: KeychainItem_UUID
                             forService: KeychainItem_Service
                                  error: nil];
    }
    
    return CFUUID;
}

@end
