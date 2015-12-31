//
//  iOS9____UITestingUITests.m
//  iOS9新特性-UITestingUITests
//
//  Created by 康梁 on 15/12/28.
//  Copyright © 2015年 kl. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface iOS9____UITestingUITests : XCTestCase

@end

@implementation iOS9____UITestingUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


// UI 基本组件
- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *nameElementsQuery = [app.otherElements containingType:XCUIElementTypeStaticText identifier:@"name"];
    XCUIElement *textField = [[nameElementsQuery childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"kl"];
    
    XCUIElement *textField2 = [[nameElementsQuery childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 typeText:@"kl"];
    
    XCUIElement *loginButton = app.buttons[@"login"];
    [loginButton tap];
    [loginButton tap];
    [textField2 typeText:@"kll"];
    [textField2 tap];
    [loginButton tap];
    [app.alerts[@"Error"].collectionViews.buttons[@"cancel"] tap];

    
    
    XCTAssertEqual(app.alerts.count, 1);
    
    
}
// controller 跳转
- (void)testVC {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *switch2 = app.switches[@"1"];
    [switch2 tap];
    
    XCUIElement *switch3 = app.switches[@"0"];

    [switch3 tap];
    [app.buttons[@"Button"] tap];
    [[[[app.navigationBars[@"vcr"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
    
    XCTAssertEqualObjects(app.navigationBars.element.identifier, @"vcr");

}

@end
