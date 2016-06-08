//
//  BankCollectionViewCell.m
//  zoto
//
//  Created by Akshay on 30/10/15.
//  Copyright © 2015 MadsTech. All rights reserved.
//

#import "CardCollectionViewCell.h"
@implementation CardCollectionViewCell
{
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        screenRect = [[UIScreen mainScreen] bounds];
        screenWidth = screenRect.size.width;
        screenHeight = screenRect.size.height;
        
        // Initialization code
        
        CGFloat elementHeight = screenHeight / 20;
        self.contentView.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
        
        self.cardLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 75, 140, 20)];
        self.cardLabel.textAlignment = NSTextAlignmentLeft;
        self.cardLabel.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:self.cardLabel];
        
        self.cardName = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 155, 50)];
        self.cardName.textAlignment = NSTextAlignmentLeft;
        self.cardName.textColor = [UIColor darkGrayColor];
        self.cardName.lineBreakMode = NSLineBreakByWordWrapping;
        self.cardName.numberOfLines = 0;
        [self.contentView addSubview:self.cardName];
        
        self.cardImage = [[UIImageView alloc] initWithFrame:CGRectMake(135, 75, 30, 20)];
        self.cardImage.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:self.cardImage];
        
        self.cvvLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 75, 140, 20)];
        self.cvvLabel.backgroundColor = [UIColor whiteColor];
        self.cvvLabel.textColor = [UIColor lightGrayColor];
        //[self.contentView addSubview:self.cvvLabel];
        
        self.addImage = [[UIImageView alloc] initWithFrame:CGRectMake(70, 25, 35, 30)];
        self.addImage.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:self.addImage];
        
        self.addLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.addImage.frame) + 10, 135, 20)];
        self.addLabel.textColor = [UIColor colorWithRed:0 green:114.0/255.0 blue:198.0/255.0 alpha:1.0];
        self.addLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.addLabel];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

- (void) drawRect:(CGRect)rect
{
    
}

@end
