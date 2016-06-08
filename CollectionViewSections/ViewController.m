//
//  PaymentViewController.m
//  zoto
//
//  Created by Akshay on 28/10/15.
//  Copyright © 2015 MadsTech. All rights reserved.
//

#import "ViewController.h"
#import "CardCollectionViewCell.h"
#import "BankCollectionViewCell.h"

@interface ViewController ()
{
    CGRect screenRect;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    UIView *cardsView;
    UIView *banksView;
    CGFloat elementHeight;
    
    NSMutableArray *cards;
    
    NSMutableArray *banks;
    
    UIImageView *leftImage;
    UILabel *label;
    
    UITapGestureRecognizer *tapRecognizer;
    
}
@property (nonatomic, strong) UICollectionView *cardscollectionView;
@property (nonatomic, strong) UICollectionView *bankscollectionView;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Select Option";
    
    screenRect = [[UIScreen mainScreen] bounds];
    screenWidth = screenRect.size.width;
    screenHeight = screenRect.size.height;
    
    elementHeight = screenHeight / 20;
    
    CGRect navFrame = self.navigationController.navigationBar.frame;
    
    cardsView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(navFrame), screenWidth, screenHeight/2)];
    
    [self.view addSubview:cardsView];
    
    leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, elementHeight, elementHeight)];
    leftImage.image = [UIImage imageNamed:@"dccc.png"];
    leftImage.contentMode = UIViewContentModeCenter;
    [cardsView addSubview:leftImage];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame) + 10,  20, screenWidth - elementHeight - 40, elementHeight)];
    label.text = @"Pay via Debit/ATM/Credit Card";
    label.textColor = [UIColor blackColor];
    [cardsView addSubview:label];
    
    UIImageView *rightImage = [[UIImageView alloc]initWithFrame:CGRectMake(screenWidth - (elementHeight + 10) - 20,20, elementHeight + 10, elementHeight)];
    rightImage.image = [UIImage imageNamed:@"verisign_icon.png"];
    rightImage.contentMode = UIViewContentModeScaleAspectFit;
    [cardsView addSubview:rightImage];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 1000.0f;
    layout.minimumInteritemSpacing = 1000.0f;
    layout.sectionInset = UIEdgeInsetsMake(0.0, 0.0,0.0,10.0);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.cardscollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame) + 10, CGRectGetMaxY(label.frame), screenWidth - 10 - leftImage.frame.size.width, 150) collectionViewLayout:layout];
    [self.cardscollectionView setDataSource:self];
    [self.cardscollectionView setDelegate:self];
    self.cardscollectionView.backgroundColor = [UIColor whiteColor];
    [cardsView addSubview:self.cardscollectionView];
    [self.cardscollectionView registerClass:[CardCollectionViewCell class] forCellWithReuseIdentifier:@"cardCell"];
    [self.cardscollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.cardscollectionView.tag = 1;
    
    banksView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(cardsView.frame), screenWidth, screenHeight/2)];
    [self.view addSubview:banksView];
    
    leftImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, elementHeight, elementHeight)];
    leftImage.image = [UIImage imageNamed:@""];
    [banksView addSubview:leftImage];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame) + 10,  20, screenWidth - elementHeight - 40, elementHeight)];
    label.text = @"Bank Account Number";
    label.textColor = [UIColor blackColor];
    [banksView addSubview:label];
    
    self.bankscollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftImage.frame) + 10, CGRectGetMaxY(label.frame), screenWidth - 10 - leftImage.frame.size.width, 150) collectionViewLayout:layout];
    [self.bankscollectionView setDataSource:self];
    [self.bankscollectionView setDelegate:self];
    self.bankscollectionView.backgroundColor = [UIColor whiteColor];
    [banksView addSubview:self.bankscollectionView];
    [self.bankscollectionView registerClass:[BankCollectionViewCell class] forCellWithReuseIdentifier:@"bankCell"];
    [self.bankscollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    self.bankscollectionView.tag = 1;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    if (collectionView == _cardscollectionView) {
        return 2;
    }
    else
    {
        return 1;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView == self.cardscollectionView) {
        if(indexPath.section < cards.count)
        {
            
            
            CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cardCell" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
            cell.cvvLabel.text = @"CVV";
            cell.cvvLabel.backgroundColor = [UIColor whiteColor];
            cell.cardName.text = @"Bank 1";
            CGSize maximumLabelSize = CGSizeMake(155, 50);
            CGSize expectedLabelSize = [@"Bank 1" sizeWithFont:cell.cardName.font constrainedToSize:maximumLabelSize lineBreakMode:cell.cardName.lineBreakMode];
            //adjust the label the the new height.
            CGRect newFrame = cell.cardName.frame;
            newFrame.size.height = expectedLabelSize.height;
            cell.cardName.frame = newFrame;
            cell.addLabel.text = @"";
            NSMutableString *dottedPassword = [NSMutableString new];
            cell.addImage.image = [UIImage imageNamed:@""];
            for (int i = 0; i < 4; i++)
            {
                [dottedPassword appendString:@"●"]; // BLACK CIRCLE Unicode: U+25CF, UTF-8: E2 97 8F
            }
            NSString *cardNumber = @"1234";
            
            cell.cardLabel.text = [[dottedPassword stringByAppendingString:@"  "] stringByAppendingString:cardNumber];
            cell.layer.cornerRadius = 3.0f;
            cell.layer.borderWidth=0.5f;
            cell.layer.borderColor=[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0].CGColor;
            return cell;
            
        }
        else
        {
            CardCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cardCell" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
            cell.cvvLabel.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
            cell.addImage.image = [UIImage imageNamed:@"enterbankac.png"];
            cell.cardName.text = @"";
            cell.cardLabel.text = @"";
            cell.cardImage.image = [UIImage imageNamed:@""];
            cell.cvvLabel.text = @"";
            cell.addLabel.text = @"Enter New Card";
            cell.layer.cornerRadius = 3.0f;
            cell.layer.borderWidth=0.5f;
            cell.layer.borderColor=[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0].CGColor;
            return cell;
        }
    }
    else
    {
        if(indexPath.section < cards.count)
        {
            
            BankCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bankCell" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
            cell.cvvLabel.text = @"CVV";
            cell.cvvLabel.backgroundColor = [UIColor whiteColor];
            cell.bankName.text = @"Bank 2";
            CGSize maximumLabelSize = CGSizeMake(155, 50);
            CGSize expectedLabelSize = [@"Bank 2" sizeWithFont:cell.bankName.font constrainedToSize:maximumLabelSize lineBreakMode:cell.bankName.lineBreakMode];
            //adjust the label the the new height.
            CGRect newFrame = cell.bankName.frame;
            newFrame.size.height = expectedLabelSize.height;
            cell.bankName.frame = newFrame;
            cell.addLabel.text = @"";
            NSMutableString *dottedPassword = [NSMutableString new];
            cell.addImage.image = [UIImage imageNamed:@""];
            for (int i = 0; i < 4; i++)
            {
                [dottedPassword appendString:@"●"]; // BLACK CIRCLE Unicode: U+25CF, UTF-8: E2 97 8F
            }
            NSString *cardNumber = @"5678";
            
            cell.bankLabel.text = [[dottedPassword stringByAppendingString:@"  "] stringByAppendingString:cardNumber];
            cell.layer.cornerRadius = 3.0f;
            cell.layer.borderWidth=0.5f;
            cell.layer.borderColor=[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0].CGColor;
            return cell;
            
        }
        else
        {
            BankCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"bankCell" forIndexPath:indexPath];
            cell.contentView.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
            cell.cvvLabel.backgroundColor = [UIColor colorWithRed:246.0f/255.0f green:250.0f/255.0f blue:253.0f/255.0f alpha:1.0f];
            cell.addImage.image = [UIImage imageNamed:@"enterbankac.png"];
            cell.bankName.text = @"";
            cell.bankLabel.text = @"";
            cell.bankImage.image = [UIImage imageNamed:@""];
            cell.cvvLabel.text = @"";
            cell.addLabel.text = @"Enter New Account";
            cell.layer.cornerRadius = 3.0f;
            cell.layer.borderWidth=0.5f;
            cell.layer.borderColor=[UIColor colorWithRed:204.0/255.0 green:204.0/255.0 blue:204.0/255.0 alpha:1.0].CGColor;
            return cell;
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld", (long) indexPath.section);
    if (collectionView == self.cardscollectionView) {
        if (indexPath.section == cards.count)
        {
            
        }
        else
        {
            
        }
        
    }
    else
    {
        if(indexPath.section == banks.count)
        {
        }
        else
        {
            
        }
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(175, 100);
}

@end