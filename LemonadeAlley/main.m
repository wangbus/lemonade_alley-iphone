//
//  main.m
//  LemonadeAlley
//
//  Created by James Wang on 9/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>
#import <Restkit/Restkit.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"LemonadeAlleyAppDelegate");
    [pool release];
    return retVal;
}
