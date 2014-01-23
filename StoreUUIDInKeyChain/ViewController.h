//
//  ViewController.h
//  StoreUUIDInKeyChain
//
//  Created by Suraj on 23/01/14.
//  Copyright (c) 2014 Suraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#import "FDKeychain.h"

@interface ViewController : UIViewController {
    __weak IBOutlet UILabel *lblUUID;
}

@end
