//
//  YoutubeViewController.h
//  Helena Tannure
//
//  Created by TopTier on 9/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YoutubeViewController : UIViewController {
    IBOutlet UIWebView *webView;
    NSString *url;
}
@property (nonatomic,retain) UIWebView *webView;
@property (nonatomic,retain) NSString *url; 

- (void)embedYouTube:(NSString *)urlString;

@end
