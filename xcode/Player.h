//
//  Player.h
//  SelectScreen
//
//  Created by Colin Young on 5/20/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Player : NSObject {
	NSUInteger points;
	NSString * color;
	NSString *difficulty;
	NSString *name;
	CGPoint pos;
}
@property(nonatomic,retain) NSString *name;
@property(nonatomic,retain) NSString *color;
@property(nonatomic,retain) NSString *difficulty;
@property(assign) NSUInteger points;
@property(assign) CGPoint pos;
-(id)initWithSettings:(NSArray *)settings;
@end
