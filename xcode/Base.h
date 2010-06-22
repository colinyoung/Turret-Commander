//
//  Base.h
//  SelectScreen
//
//  Created by Colin Young on 6/10/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Base : NSObject {
	int health, x, y;
}
-(id)initWithHealth:(int)health_;
@property(assign) int health;
@property(assign) int x;
@property(assign) int y;
@end
