//
//  AgendaViewController.h
//  Helena Tannure
//
//  Created by TopTier on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgendaTableViewCell.h"
#import "AgendaEventsViewCell.h"
#import "TFHpple.h"

@interface AgendaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>  {
    IBOutlet UITableView *tblDates;
    IBOutlet UITableView *tblEvents;
    NSArray *arryData;
    IBOutlet AgendaTableViewCell *tblCell;
    IBOutlet AgendaEventsViewCell *tblCellEvents;
    NSMutableData *receivedData;
    

}

-(void) makeHttpRequest:(NSString *) url;

@end
