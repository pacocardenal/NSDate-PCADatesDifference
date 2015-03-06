//
//  NSDate+PCADatesDifference.m
//  StudyTime
//
//  Created by Paco Cardenal on 25/2/15.
//  Copyright (c) 2015 Paco Cardenal. All rights reserved.
//

#import "NSDate+PCADatesDifference.h"

@implementation NSDate (PCADatesDifference)

// Adjust the NSDate "aDate" to your local time zone.

+ (NSDate *)calculateDateInTimeZone:(NSDate *)aDate {

    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];
    
    // Calculate local time zone (GMT +/- X)
    NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
    float timeZoneOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]] / 3600.0;
    
    [components setHour:-[components hour] + timeZoneOffset];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    // Today is a variable pointing at a date object at today midnight
    NSDate *theDate = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    return theDate;
    
}

// Calculate a day in the past (positive) or in the future (negative).

+ (NSDate *)calculateDayBeforeToday:(int)numberOfDaysBefore {
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond ) fromDate:[[NSDate alloc] init]];

//    Uncomment if you want to recalculate your local time zone
//    Calculate local time zone (GMT +/- X)
//    NSTimeZone *destinationTimeZone = [NSTimeZone localTimeZone];
//    float timeZoneOffset = [destinationTimeZone secondsFromGMTForDate:[NSDate date]] / 3600.0;
    
    float timeZoneOffset = 0;
    
    [components setHour:-[components hour] + timeZoneOffset];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    
    // Today is a variable pointing at a date object at today midnight
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0];
    
    [components setHour:-24 * numberOfDaysBefore];
    [components setMinute:0];
    [components setSecond:0];
    
    NSDate *theDay = [cal dateByAddingComponents:components toDate: today options:0];
    
    return theDay;
    
}

// Utility methods that calculate a NSDate with the value of yesterday, today or tomorrow at 00:00h.

+ (NSDate *)calculateYesterday {
    
    return [self calculateDayBeforeToday:1];
    
}

+ (NSDate *)calculateToday {
    
    return [self calculateDayBeforeToday:0];
    
}

+ (NSDate *)calculateTomorrow {
    
    return [self calculateDayBeforeToday:-1];
    
}

// Represent a string with "00:00 H" format in hours:minutes. You can show or hide the final "H" with the BOOL hours parameter.

+ (NSString *)calculateMinutesFromInterval:(NSTimeInterval)anInterval
                              withHourText:(BOOL)hours {
    
    // Get the system calendar
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    // Create the NSDates
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:anInterval sinceDate:date1];
    
    // Get conversion to hours, minutes
    unsigned int unitFlags = NSCalendarUnitHour | NSCalendarUnitMinute;
    
    NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSMutableString *hoursMinutesString = [NSMutableString stringWithFormat:@"%02ld:%02ld", (long)[conversionInfo hour], (long)[conversionInfo minute]];
    
    if (hours) {
        [hoursMinutesString appendString:@" H"];
    }
    
    return hoursMinutesString;
    
}

// Difference of days between two NSDate objects.

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime
                     andDate:(NSDate*)toDateTime
{
    
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&fromDate
                 interval:NULL forDate:fromDateTime];
    [calendar rangeOfUnit:NSCalendarUnitDay startDate:&toDate
                 interval:NULL forDate:toDateTime];
    
    NSDateComponents *difference = [calendar components:NSCalendarUnitDay
                                               fromDate:fromDate toDate:toDate options:0];
    
    return [difference day];
    
}

@end
