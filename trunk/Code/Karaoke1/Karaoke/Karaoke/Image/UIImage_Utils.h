//
//  UIImage_Utils.h
//  Paparazzi
//
//  Created by ductc on 9/30/13.
//
//

#import <UIKit/UIKit.h>
#import "UIImage+Resize.h"

@interface UIImage(Utils)
- (UIImage *)fixOrientation;
/** this function draw on current image a new image and resize if need
 * @author ductc
 */
-(UIImage*)drawImage:(UIImage*)im onRect:(CGRect)rect targetSize:(CGSize)size;
/** this function resize image
 *@author ductc
 */
-(UIImage*)resizeImage:(CGSize)maxSize;
@end
