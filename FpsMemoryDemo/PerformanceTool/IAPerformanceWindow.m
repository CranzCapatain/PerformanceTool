//
//  IAPerformanceWindow.m
//  FpsMemoryDemo
//
//  Created by Alter on 2018/7/23.
//  Copyright © 2018年 Netease. All rights reserved.
//

#import "IAPerformanceWindow.h"
#import "IAPerformanceLabel.h"

@interface IAPerformanceWindow ()

@property (nonatomic, strong) IAPerformanceLabel *memoryLabel;

@property (nonatomic, strong) IAPerformanceLabel *cpuLabel;

@property (nonatomic, strong) IAPerformanceLabel *fpsLabel;

@end

@implementation IAPerformanceWindow

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.windowLevel = UIWindowLevelAlert;
    self.rootViewController = [UIViewController new];
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    
    self.memoryLabel = [[IAPerformanceLabel alloc] init];
    self.cpuLabel = [[IAPerformanceLabel alloc] init];
    self.fpsLabel = [[IAPerformanceLabel alloc] init];
    
    self.memoryLabel.optional = IAPerformanceOptionalMemory;
    self.cpuLabel.optional = IAPerformanceOptionalCPU;
    self.fpsLabel.optional = IAPerformanceOptionalFPS;
    
    self.memoryLabel.suffix = @"M";
    self.cpuLabel.suffix = @"%";
    self.fpsLabel.suffix = @"fps";
    
    [self addSubview:self.memoryLabel];
    [self addSubview:self.cpuLabel];
    [self addSubview:self.fpsLabel];
}

- (void)layoutSubviews {
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    
    self.memoryLabel.frame = CGRectMake(10, 0, [self.memoryLabel getWidth], self.frame.size.height);
}

- (void)updateMemory:(float)memory {
    self.memoryLabel.hidden = NO;
    [self.memoryLabel updateValue:memory];
    
    self.memoryLabel.frame = CGRectMake(10, 0, [self.memoryLabel getWidth], self.frame.size.height);
    self.cpuLabel.frame = CGRectMake((self.frame.size.width - [self.cpuLabel getWidth]) / 2, 0, [self.cpuLabel getWidth], self.frame.size.height);
    self.fpsLabel.frame = CGRectMake(self.frame.size.width - [self.fpsLabel getWidth] - 10, 0, [self.fpsLabel getWidth], self.frame.size.height);
}

- (void)updateCPU:(float)cpu {
    self.cpuLabel.hidden = NO;
    [self.cpuLabel updateValue:cpu];
    
    self.cpuLabel.frame = CGRectMake((self.frame.size.width - [self.cpuLabel getWidth]) / 2, 0, [self.cpuLabel getWidth], self.frame.size.height);
}

- (void)updateFPS:(float)fps {
    self.fpsLabel.hidden = NO;
    [self.fpsLabel updateValue:fps];
    
    self.fpsLabel.frame = CGRectMake(self.frame.size.width - [self.fpsLabel getWidth] - 10, 0, [self.fpsLabel getWidth], self.frame.size.height);
}

@end
