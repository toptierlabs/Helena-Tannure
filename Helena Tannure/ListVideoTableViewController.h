//
//  ListVideoTableViewController.h
//  Helena Tannure
//
//  Created by TopTier on 9/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YoutubeViewController.h"


@interface ListVideoTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *videoTableView;
    YoutubeViewController * youtubeController;
}

@property (nonatomic,retain) NSDictionary *videosPrincipal;
@property (nonatomic,retain) NSDictionary *videosExt;
@property (nonatomic,retain) NSArray   *keysPrincipal;
@property (nonatomic,retain) NSArray   *keysExt;
@property (nonatomic,retain) YoutubeViewController * youtubeController;

@end
