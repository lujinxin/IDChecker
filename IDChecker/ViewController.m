//
//  ViewController.m
//  IDChecker
//
//  Created by 陆金鑫 on 16/8/3.
//  Copyright © 2016年 陆金鑫. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    
    NSTextField *_idField;   //身份证号输入框
    
    NSTextField *_resultField;   //校验结果
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createInstruction];
    
    [self createIDField];
    
    [self createCheckBtn];
    
    [self createCheckResultField];
    
}

//---------------------------使用说明------------------------------
- (void)createInstruction {
    
    NSTextField *instructionField = [[NSTextField alloc] initWithFrame:CGRectMake(20, 90, 290, 40)];
    
    instructionField.stringValue = @"请输入18位身份证号或者身份证号的前17位，然后点击 Check 按钮！";
    
    instructionField.enabled = NO;
    instructionField.bordered = NO;
    instructionField.backgroundColor = [NSColor clearColor];
    
    [self.view addSubview:instructionField];
}


//---------------------------创建身份证号输入框----------------------
- (void)createIDField {
    _idField = [[NSTextField alloc] initWithFrame:CGRectMake(20, 20, 200, 20)];
    [self.view addSubview:_idField];
}


//---------------------------创建check按钮-------------------------
- (void)createCheckBtn {
    
    NSButton *checkBtn = [[NSButton alloc] initWithFrame:CGRectMake(_idField.frame.size.width +20 +20, _idField.frame.size.height, 60, 20)];
    [checkBtn setTitle: @"Check"];
    
//    [checkBtn setButtonType:NSPushOnPushOffButton];
    checkBtn.target = self;
    checkBtn.action = @selector(checkBtnAct:);
    
    [self.view addSubview:checkBtn];
    
}



//---------------------------check按钮单击事件---------------------
- (void)checkBtnAct:(NSButton *)sender {
    
    NSLog(@"------------check 按钮被点击");
    
    NSString *idStr = [NSString string];
    idStr = _idField.stringValue;
    
    if ((idStr.length != 17) && (idStr.length != 18)) {
        if (idStr.length == 0) {
            _resultField.stringValue = @"2逼，没输你点个毛！";
            _resultField.textColor = [NSColor purpleColor];
        } else {
            _resultField.stringValue = @"傻×，输错了！";
            _resultField.textColor = [NSColor purpleColor];
        }
        
        return;
    }
    
    NSMutableArray *idArr = [NSMutableArray array];
    for (int i = 0 ; i < idStr.length; i++) {
        NSString *objStr = [idStr substringWithRange:NSMakeRange(i, 1)];
        [idArr addObject:objStr];
    }
    
    
    NSInteger sum = 0;
    NSInteger ckNum;
    NSString *ckResult = [NSString string];
    
//    int i;
//    for (i = 0; i < 17; i++) {
//        NSInteger temp = [idArr[i] integerValue];
//        NSLog(@"iiiiiiiiiiiiiiiiii:%ld", temp);
//    }
    
    
    NSInteger n1 = [[idArr objectAtIndex:0] integerValue];
    NSInteger n2 = [idArr[1] integerValue];
    NSInteger n3 = [idArr[2] integerValue];
    NSInteger n4 = [idArr[3] integerValue];
    NSInteger n5 = [idArr[4] integerValue];
    NSInteger n6 = [idArr[5] integerValue];
    NSInteger n7 = [idArr[6] integerValue];
    NSInteger n8 = [idArr[7] integerValue];
    NSInteger n9 = [idArr[8] integerValue];
    NSInteger n10 = [idArr[9] integerValue];
    NSInteger n11 = [idArr[10] integerValue];
    NSInteger n12 = [idArr[11] integerValue];
    NSInteger n13 = [idArr[12] integerValue];
    NSInteger n14 = [idArr[13] integerValue];
    NSInteger n15 = [idArr[14] integerValue];
    NSInteger n16 = [idArr[15] integerValue];
    NSInteger n17 = [idArr[16] integerValue];
//    NSInteger n18 = [idArr[17] integerValue];
    
    sum = n1*7 +n2*9 +n3*10 +n4*5 +n5*8 +n6*4 +n7*2 +n8*1 +n9*6 +n10*3 +n11*7 +n12*9 +n13*10 +n14*5 +n15*8 +n16*4 +n17*2;
    
    ckNum = sum %11;
    
    if (ckNum < 2) {
        NSString *tempResult = [NSString stringWithFormat:@"%ld", (1 - ckNum)];
        ckResult = tempResult;
    } else if (ckNum == 2) {
        ckResult = @"x";
    } else {
        NSString *tempResult = [NSString stringWithFormat:@"%ld", (12 - ckNum)];
        ckResult = tempResult;
    }
    
//       ckNum    0 1 2 3 4 5 6 7 8 9 10
//    ckResult    1 0 X 9 8 7 6 5 4 3 2
    
    if (idStr.length == 18) {
        
        if ([idArr[17] isEqualToString:ckResult] || [idArr[17] isEqualToString:@"x"] || [idArr[17] isEqualToString:@"X"]) {
            _resultField.stringValue = @"身份证号合法！";
            _resultField.textColor = [NSColor greenColor];
        } else {
            _resultField.stringValue = @"身份证号不合法！";
            _resultField.textColor = [NSColor redColor];
        }
        
    } else {
        _resultField.stringValue = [NSString stringWithFormat:@"校验码为：%@，请自行核对！", ckResult];
        _resultField.textColor = [NSColor blueColor];
    }
    
//    _resultField.stringValue = @"输入正确！";
//    
//    NSLog(@"idStr是：%@", idStr);
//    
//    NSLog(@"n1= %ld", n1);
//    
//    NSLog(@"idArr是：%@", idArr);
}



//---------------------------校验结果------------------------------
- (void)createCheckResultField {
    _resultField = [[NSTextField alloc] initWithFrame:CGRectMake(_idField.frame.origin.x, _idField.frame.origin.y +40, 200, 20)];
    _resultField.enabled = NO;
    _resultField.bordered = NO;
    _resultField.backgroundColor = [NSColor clearColor];

    
    _resultField.stringValue = @"校验结果";
    
    [self.view addSubview:_resultField];
}













- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
