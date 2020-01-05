//
//  DetailViewController.m
//  TestTableView
//
//  Created by wangjingru on 2020/1/3.
//  Copyright © 2020 wangjingru. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKNavigationDelegate.h>

@interface DetailViewController ()<WKNavigationDelegate>

@property(nonatomic, strong, readwrite) WKWebView *webView;
@property(nonatomic, strong, readwrite) UIProgressView *progressView;
@property(nonatomic, copy, readwrite) NSString* articleUrl;

@end

@implementation DetailViewController

-(instancetype) initWithString: (NSString *)urlString{
    self = [super init];
    if(self){
        self.articleUrl = urlString;
    }
    return self;
}

-(void) dealloc{
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview: ({
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88)];
        _webView.navigationDelegate = self;
        _webView;
    })];
    [self.view addSubview: ({
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        _progressView;
    })];
    
    [self.webView loadRequest: [NSURLRequest requestWithURL: [NSURL URLWithString:self.articleUrl]]];
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    NSLog(@"finish navigation");
}


- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context{
    _progressView.progress = _webView.estimatedProgress;
    NSLog(@"");
}

@end
