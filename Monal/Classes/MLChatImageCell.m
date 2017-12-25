//
//  MLChatImageCell.m
//  Monal
//
//  Created by Anurodh Pokharel on 12/24/17.
//  Copyright © 2017 Monal.im. All rights reserved.
//

#import "MLChatImageCell.h"
#import "UIImageView+WebCache.h"
@import QuartzCore; 

@implementation MLChatImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.thumbnailImage.layer.cornerRadius=15.0f;
    self.thumbnailImage.layer.masksToBounds=YES;
}

-(void) loadImage
{
    if(self.link)
    {
        [self.thumbnailImage sd_setImageWithURL:[NSURL URLWithString:self.link] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if(error)
            {
                self.thumbnailImage.image=nil;
            }
            else  {
                
                if (image.size.height>image.size.width) {
                    self.imageHeight.constant = 350;
                }
            }
            
        }];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(BOOL) canPerformAction:(SEL)action withSender:(id)sender
{
    return NO;
}

-(void)prepareForReuse{
    [super prepareForReuse];
    self.imageHeight.constant=178;
}


@end
