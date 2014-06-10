//
//  ViewController.m
//  抓阄
//
//  Created by zoe on 14-5-23.
//  Copyright (c) 2014年 Polyvi Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *data;
}

@property (weak, nonatomic) IBOutlet UITextField *item1;
@property (weak, nonatomic) IBOutlet UITextField *item2;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UILabel *allRecords;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

//    UIGraphicsBeginImageContext(self.view.frame.size);
//    [[UIImage imageNamed:@"bg1.png"] drawInRect:self.view.bounds];
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    self.view.backgroundColor = [UIColor colorWithPatternImage:image];

   // self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg1.png"]];
    //self.view.backgroundColor = [UIColor blueColor];

//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg1.png"]];
//    [self.view addSubview:imageView];
//
//    [self.view sendSubviewToBack:imageView];

    data = [@{self.item1.text: @0,
             self.item2.text: @0} mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)start:(id)sender {
    NSArray *options = @[self.item1.text, self.item2.text];
    int seed = arc4random() % 2;

    NSNumber *newVal = @([(NSNumber *)[data objectForKey:options[seed]] integerValue] + 1);
    [data setValue:newVal forKey:options[seed]];
    NSNumber *line1 = @([(NSNumber *)[data objectForKey:self.item1.text] integerValue] + [(NSNumber *)[data objectForKey:self.item2.text] integerValue]);
    NSString *line2 = [NSString stringWithFormat:@"%@:%@", self.item1.text, data[self.item1.text]];
    NSString *line3 = [NSString stringWithFormat:@"%@:%@", self.item2.text, data[self.item2.text]];
    self.result.text = [NSString stringWithFormat:@"本次:%@", options[seed]];
    self.allRecords.text = [NSString stringWithFormat:@"记录:共%@次\n%@\n%@", line1, line2, line3];
    //self.result.text = [NSString stringWithFormat:@"本次结果:%@\n%@", options[seed], data];
}
- (IBAction)retry:(id)sender {
    data = [@{self.item1.text: @0,
             self.item2.text: @0} mutableCopy];
    self.result.text = @"本次:";
    self.allRecords.text = @"记录:";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

@end
