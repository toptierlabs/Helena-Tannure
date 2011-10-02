//
//  AgendaEventsViewCell.h
//  Helena Tannure
//
//  Created by TopTier on 9/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AgendaEventsViewCell : UITableViewCell {
        IBOutlet UILabel *cellDate;
        IBOutlet UILabel *cellDesc;
}



-(void) setLabelDate:(NSString *) _text;
-(void) setLabelDesc:(NSString *) _text;
@end


