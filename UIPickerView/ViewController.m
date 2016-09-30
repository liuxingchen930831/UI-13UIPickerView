//
//  ViewController.m
//  UIPickerView
//
//  Created by liuxingchen on 16/9/30.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *shuiguoLabel;
@property (weak, nonatomic) IBOutlet UILabel *chaocaiLabel;
@property (weak, nonatomic) IBOutlet UILabel *yinliaoLabel;
@property(nonatomic,strong)NSArray * foods ;
@end

@implementation ViewController
- (IBAction)randrom:(id)sender {
    for (int i = 0; i<3; i++) {
        //取出i一列的行数
        NSInteger count = [self.foods[i] count];
        int randrom = arc4random_uniform((u_int32_t)count);
        // 主动选中第component列的第row行
        [self.pickerView selectRow:randrom inComponent:i animated:YES];
        [self pickerView:self.pickerView didSelectRow:randrom inComponent:i];
    }
    
}

-(NSArray *)foods
{
    if (_foods ==nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:@"foods.plist" ofType:nil];
        _foods = [NSArray arrayWithContentsOfFile:path];
    }
    return _foods;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    for (int i = 0; i< 3; i++) {
        [self pickerView:self.pickerView didSelectRow:0 inComponent:i];
    }
    
}
//控制PickerView有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.foods.count;
}
//控制PickerView的component列有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.foods[component] count];
}
//控制PickerView的component列第row行的标题
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foods[component][row];

}
//控制PickerView的component列的高度
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}
// 选中第component列第row行的时候调用
// 注意：这个方法必须用户主动拖动pickerView，才会调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"%ld----%ld",component,row);
    
    switch (component) {
        case 0:
            self.shuiguoLabel.text = self.foods[component][row];
            break;
        case 1:
           self.chaocaiLabel.text  = self.foods[component][row];
            break;
        case 2:
            self.yinliaoLabel.text  = self.foods[component][row];
            break;
        
    }
}

@end
