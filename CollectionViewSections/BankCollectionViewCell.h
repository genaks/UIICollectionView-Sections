//
//  BankCollectionViewCell.h
//  zoto
//
//  Created by Akshay on 30/10/15.
//  Copyright © 2015 MadsTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BankCollectionViewCell : UICollectionViewCell
@property (retain, nonatomic) UILabel* bankLabel;
@property (retain, nonatomic) UILabel* bankName;
@property (retain, nonatomic) UIImageView* bankImage;
@property (retain, nonatomic) UILabel* cvvLabel;
@property (retain, nonatomic) UIImageView *addImage;
@property (retain, nonatomic) UILabel *addLabel;

@end
