//
//  AgendaTableViewCell.h
//  Helena Tannure
//
//  Created by TopTier on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AgendaTableViewCell : UITableViewCell {
    IBOutlet UILabel *cellText;
    
}

-(void) setLabelText:(NSString *) _text;

@end
