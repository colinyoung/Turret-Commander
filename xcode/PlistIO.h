//
//  PlistIO.h
//  SelectScreen
//
//  Created by Colin Young on 6/8/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PlistIO : NSObject {
	NSString *plistName;
	NSString *plistPath;
}
-(id)initWithPlistNamed:(NSString *)name;
-(NSArray *)read;
-(void)updateValue:(NSObject *)val atIndex:(int)index forKey:(NSString *)key;
-(int)getIndexWithLabel:(NSString *)label;
-(void)copyPlist;
-(BOOL)plistCopied;
@property (assign) NSString *plistName;
@property (assign) NSString *plistPath;
@end
