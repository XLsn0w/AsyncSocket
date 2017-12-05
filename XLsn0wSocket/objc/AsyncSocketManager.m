//
//  AsyncSocketManager.m
//  XLsn0wSocket
//
//  Created by golong on 2017/12/4.
//  Copyright © 2017年 XLsn0w. All rights reserved.
//

#import "AsyncSocketManager.h"
#import <UIKit/UIKit.h>
#import "GCDAsyncSocket.h"

@interface AsyncSocketManager () <GCDAsyncSocketDelegate>

//客户端socket
@property (nonatomic, strong) GCDAsyncSocket *clinetSocket;

@end

@implementation AsyncSocketManager

- (instancetype)init {
    if(self =[super init]) {
        self.clinetSocket= [[GCDAsyncSocket alloc] initWithDelegate:self
                                                      delegateQueue:dispatch_get_main_queue()];
    }
    return self;
}

- (void)socket:(GCDAsyncSocket*)sock didConnectToHost:(NSString*)host port:(uint16_t)port{
    
    [self showMessageWithStr:@"链接成功"];
    
    [self showMessageWithStr:[NSString stringWithFormat:@"服务器IP：%@", host]];
    
    [self.clinetSocket readDataWithTimeout:-1 tag:0];
    
}

//收到消息

- (void)socket:(GCDAsyncSocket*)sock didReadData:(NSData*)data withTag:(long)tag{
    
    NSString*text = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    [self showMessageWithStr:text];
    
    [self.clinetSocket readDataWithTimeout:-1 tag:0];
    
}


//开始连接

- (void)connectSocketWithIP:(NSString *)IP port:(NSInteger)port {
    [self.clinetSocket connectToHost:IP onPort:port withTimeout:-1 error:nil];
}

//发送消息

- (void)sendMessageActionWithMsg:(NSString *)msg {
    
    NSData *data = [msg dataUsingEncoding:NSUTF8StringEncoding];
    
    //withTimeout -1 :无穷大
    
    //tag：消息标记
    
    [self.clinetSocket writeData:data withTimeout:-1 tag:0];
    
}

//接收消息
- (void)receiveMessageAction:(id)sender {
    [self.clinetSocket readDataWithTimeout:11 tag:0];
}

- (void)showMessageWithStr:(NSString*)str {
    
    //self.showMessageTF.text= [self.showMessageTF.text stringByAppendingFormat:@"%@\n", str];
    
}

@end
