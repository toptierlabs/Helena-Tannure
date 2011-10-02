//
//  AgendaEventsViewCell.m
//  Helena Tannure
//
//  Created by TopTier on 9/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AgendaEventsViewCell.h"


@implementation AgendaEventsViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void) setLabelDate:(NSString *) _text{
    cellDate.text = _text;
}
-(void) setLabelDesc:(NSString *) _text{
    cellDesc.text = _text;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [super dealloc];
}

@end
