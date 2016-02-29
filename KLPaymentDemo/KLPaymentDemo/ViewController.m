//
//  ViewController.m
//  KLRMStoreDemo
//
//  Created by 康梁 on 16/2/22.
//  Copyright © 2016年 LeonKang. All rights reserved.
//



#import "ViewController.h"
#import "FLAdjust.h"
#import <StoreKit/StoreKit.h>
#import <Adjust/Adjust.h>
#import <RMStore/RMStore.h>
#import <MJApiClient/MJApiClient.h>

NSString * const IW_INAPP_PRODUCT_50_DIAMONDS = @"de.ideawise.koko.50diamonds";
NSString * const IW_INAPP_PRODUCT_125_DIAMONDS = @"de.ideawise.koko.125diamonds";
NSString * const IW_INAPP_PRODUCT_300_DIAMONDS = @"de.ideawise.koko.300diamonds";
NSString * const IW_INAPP_PRODUCT_1000_DIAMONDS = @"de.ideawise.koko.1000diamonds";

@interface ViewController () <RMStoreObserver>

@property (weak, nonatomic) IBOutlet UIButton *btnBuy1000;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy300;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy125;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy50;

@property (nonatomic, copy) NSDictionary *validProducts;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)purchase:(id)sender {
    NSString *productId = nil;
    NSString *AdjustTokenDiamondPackage = nil;
    if (sender == _btnBuy1000) {
        productId = IW_INAPP_PRODUCT_1000_DIAMONDS;
        AdjustTokenDiamondPackage = FLAdjustTokenDiamondPackage1000;
    } else if (sender == _btnBuy300) {
        productId = IW_INAPP_PRODUCT_300_DIAMONDS;
        AdjustTokenDiamondPackage = FLAdjustTokenDiamondPackage300;
    } else if (sender == _btnBuy125) {
        productId = IW_INAPP_PRODUCT_125_DIAMONDS;
        AdjustTokenDiamondPackage = FLAdjustTokenDiamondPackage125;
    } else if (sender == _btnBuy50) {
        productId = IW_INAPP_PRODUCT_50_DIAMONDS;
        AdjustTokenDiamondPackage = FLAdjustTokenDiamondPackage50;
    }
//    SKProduct *product = self.validProducts[productId];
//    if( !product ) return;
    
    [[RMStore defaultStore] addPayment:productId success:^(SKPaymentTransaction *transaction) {
        NSLog(@"Product purchased");
        
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchasing:
                [self adjustTrackEventWithToken:FLAdjustTokenDiamondPackagePurchasing];
                break;
                
            case SKPaymentTransactionStatePurchased:
                [self adjustTrackEventWithToken:AdjustTokenDiamondPackage];
                [self adjustTrackEventWithToken:FLAdjustTokenDiamondPackageALL];
                break;
                
            case SKPaymentTransactionStateFailed:
                [self adjustTrackEventWithToken:FLAdjustTokenDiamondPackageFiled];
                break;
                
            default:
                break;
        }
        
        
    } failure:^(SKPaymentTransaction *transaction, NSError *error) {
        NSLog(@"someting wrong, pay failed! error: %@", error);
        [self adjustTrackEventWithToken:FLAdjustTokenDiamondPackageFiled];
        NSLog(@"%@", transaction.transactionReceipt);
    }];
    
}

- (void)adjustTrackEventWithToken:(NSString *)token {
    ADJEvent *event = [ADJEvent eventWithEventToken:token];
    // http://www.adjust.com/callback?key=value&token="token"
    [event addCallbackParameter:@"key" value:@"value"];
    [event addCallbackParameter:@"token" value:token];
    [Adjust trackEvent:event];
}


#pragma mark - RMStoreObserver
- (void)storePaymentTransactionDeferred:(NSNotification *)notification {
    NSLog(@"%s", __func__);
    [self printNotificationAndTranckEvent:notification token:FLAdjustTokenDiamondPackageDeferred];
}

- (void)storePaymentTransactionFinished:(NSNotification *)notification {
    NSLog(@"%s", __func__);
    [self printNotificationAndTranckEvent:notification token:FLAdjustTokenDiamondPackagePayFinished];
}

- (void)storePaymentTransactionFailed:(NSNotification *)notification {
    NSLog(@"%s", __func__);
    [self printNotificationAndTranckEvent:notification token:FLAdjustTokenDiamondPackageFiled];
}

- (void)printNotificationAndTranckEvent:(NSNotification *)notification token:(NSString *)token {
    NSString *productIdentifier = notification.rm_productIdentifier;
    SKPaymentTransaction *transaction = notification.rm_transaction;
    NSLog(@"ProductIdentifier: %@ \n transaction: %@", productIdentifier, transaction);
    
    ADJEvent *event = [ADJEvent eventWithEventToken:token];
    [event setReceipt:transaction.transactionReceipt transactionId:productIdentifier];
    [Adjust trackEvent:event];
}


@end
