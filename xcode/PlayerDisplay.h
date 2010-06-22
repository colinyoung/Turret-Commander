//
//  PlayerDisplay.h
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlayerDisplay : NSObject {
	CGPoint pos;
	NSString *colorName;
	CGFloat rotation;
}
-(id)initWithPos:(CGPoint)pos_ andColor:(NSString *)color_;
-(void)rotateToPoint:(CGPoint)point;
@property (assign) CGPoint pos;
@property (assign) CGFloat rotation;
@property (nonatomic,retain) NSString *colorName;
@end
