//
//  BankCollectionViewCell.h
//  zoto
//
//  Created by Akshay on 30/10/15.
//  Copyright © 2015 MadsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardCollectionViewCell : UICollectionViewCell
@property (retain, nonatomic) UILabel* cardLabel;
@property (retain, nonatomic) UILabel* cardName;
@property (retain, nonatomic) UIImageView* cardImage;
@property (retain, nonatomic) UILabel* cvvLabel;
@property (retain, nonatomic) UIImageView *addImage;
@property (retain, nonatomic) UILabel *addLabel;

@end
