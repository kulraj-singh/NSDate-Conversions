//
//  NSDate+Conversions.m
//
//  Created by Kulraj Singh on 28/04/15.
//

#import "NSDate+Conversions.h"

@implementation NSDate (Conversions)

+(NSDate*)dateForString:(NSString *)string format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = format;
    NSDate *date = [dateFormatter dateFromString:string];
    return date;
}

- (NSString*)stringWithFormat:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = format;
    NSString *string = [dateFormatter stringFromDate:self];
    return string;
}

- (NSString*)getShortTime
{
    NSDate *currentDate = [NSDate date];
    NSInteger timeInterval = [currentDate timeIntervalSinceDate:self];
    //less than one minute
    if (timeInterval < 60) {
        return @"1 min";
    }
    timeInterval /= 60;
    
    //less than one hour : some minutes
    if (timeInterval < 60) {
        if (timeInterval == 1) {
            return @"1 min";
        }
        NSString *time = [NSString stringWithFormat:@"%d mins", (int)timeInterval];
        return time;
    }
    
    //less than a day : some hours
    timeInterval /= 60;
    if (timeInterval < 24) {
        if (timeInterval == 1) {
            return @"1 hr";
        }
        NSString *time = [NSString stringWithFormat:@"%d hrs", (int)timeInterval];
        return time;
    }
    
    //less than a month : a few days
    timeInterval /= 24;
    if (timeInterval < 30) {
        if (timeInterval == 1) {
            return @"1 day";
        }
        //condition for weeks
        if (timeInterval >= 7) {
            timeInterval /= 7;
            if (timeInterval == 1) {
                return @"1 wk";
            } else {
                NSString *time = [NSString stringWithFormat:@"%d wks", (int)timeInterval];
                return time;
            }
        }
        NSString *time = [NSString stringWithFormat:@"%d days", (int)timeInterval];
        return time;
    }
    
    //less than an year : a few months
    timeInterval /= 30;
    if (timeInterval < 12) {
        if (timeInterval == 1) {
            return @"1 month";
        }
        NSString *time = [NSString stringWithFormat:@"%d months", (int)timeInterval];
        return time;
    }
    
    timeInterval /= 12;
    if (timeInterval == 1) {
        return @"1 yr";
    }
    NSString *time = [NSString stringWithFormat:@"%d yrs", (int)timeInterval];
    return time;
}

@end
