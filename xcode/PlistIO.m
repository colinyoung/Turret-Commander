//
//  PlistIO.m
//  SelectScreen
//
//  Created by Colin Young on 6/8/10.
//  Copyright 2010 Shortwave Design. All rights reserved.
//

#import "PlistIO.h"


@implementation PlistIO

@synthesize plistName, plistPath;

-(id)initWithPlistNamed:(NSString *)name {
	if (self = [super init]) {
		plistName = name;
		NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *documentsDirectory = [paths objectAtIndex:0];
		plistPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@%@", plistName, @"_save.plist"]];
		/* Uncomment following two lines if you have made changes to source plists. */
		//NSFileManager *manager = [NSFileManager defaultManager];
		//[manager removeItemAtPath:plistPath error:nil];
		NSLog(@"plistpath: %@", plistPath);
		if (![self plistCopied]) {
			[self copyPlist];
		}
	}
	return self;
}

-(NSArray *)read {
	NSString *toRead = @"";
	if (![self plistCopied]) {
		// plist wasn't writable
		// so we return the bundled one (read-only)
		toRead = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];  
	} else {
		toRead = plistPath;
	}
	NSArray* tmp = [[NSArray alloc] initWithContentsOfFile:toRead];
	return tmp;
}

-(void)updateValue:(NSObject *)val atIndex:(int)index forKey:(NSString *)key {
	NSFileManager* manager = [NSFileManager defaultManager];
	if ([manager isWritableFileAtPath:plistPath]) 
	{
			NSMutableArray* array = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
			NSMutableDictionary *infoDict = [array objectAtIndex:index];
			[infoDict setObject:val forKey:key];
			[array replaceObjectAtIndex:index withObject:infoDict];
			[array writeToFile:plistPath atomically:NO];	
		//[manager changeFileAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate] atPath: [[NSBundle mainBundle] bundlePath]];
		[array release];
		return;
	} else {
		NSLog(@"ERROR: PList not writable");
	}
	//[bundle release];
	//[plistPath release];
	//[manager release];
}
-(int)getIndexWithLabel:(NSString *)label {
	NSArray *r = [[self read] autorelease];
	int i = 0;
	for (NSDictionary *d in r) {
		NSString *test = [d objectForKey:@"Label"];
		NSLog(@"testing %@ against %@", test, label);
		if ([test isEqualToString:label]) {
			NSLog(@"index of %@ is %d", label, i);
			return i;
		}
		i++;
	}
	return 0;
}
-(BOOL)plistCopied
{
	NSFileManager* manager = [NSFileManager defaultManager];
	BOOL retVal = [manager fileExistsAtPath:plistPath];
	if (retVal)
		NSLog(@"file does exist");
	else
		NSLog(@"file doesn't exist");
	return retVal;
}
-(void)copyPlist
{
	NSFileManager* manager = [NSFileManager defaultManager];

	NSString *appBundleSettingsFilePath = [[NSBundle mainBundle] 
		pathForResource:plistName ofType:@"plist"];

	[manager copyItemAtPath:appBundleSettingsFilePath toPath:plistPath error:nil];
}
@end
