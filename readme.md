# NSDate+PCADatesDifference

This is a **category** for the **NSDate** class that provides some methods for working with NSDate and the difference between NSDate objects.

You are welcome to use it. If you'd like to contribute, please send a pull request.

## Content

The methods in the **NSDate+PCADatesDifference** category are:

**+ (NSDate *)calculateDateInTimeZone:(NSDate *)aDate;**

Adjust the NSDate "aDate" to your local time zone.

**+ (NSDate *)calculateDayBeforeToday:(int)numberOfDaysBefore;**

Calculate a day in the past (positive) or in the future (negative).

**+ (NSDate *)calculateYesterday;
+ (NSDate *)calculateToday;
+ (NSDate *)calculateTomorrow;**

Utility methods that calculate a NSDate with the value of yesterday, today or tomorrow at 00:00h.

**+ (NSString *)calculateMinutesFromInterval:(NSTimeInterval)anInterval
                              withHourText:(BOOL)hours;**
                              
Represent a string with "00:00 H" format in hours:minutes. You can show or hide the final "H" with the BOOL hours parameter.

**+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime
                     andDate:(NSDate*)toDateTime;**
                     
Difference of days between two NSDate objects.

## License

Released under **ISC** (similar to 2-clause BSD)

http://wikipedia.org/wiki/ISC_license

## Credits

Originally created by **Paco Cardenal**
http://www.twitter.com/pacocardenal