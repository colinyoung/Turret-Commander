//
//  Instructions.h
//  SelectScreen
//
//  Created by Colin Young on 6/12/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Instructions : UIViewController {
	UIWebView *webView;
}
@property(nonatomic,retain) IBOutlet UIWebView *webView;
@end
