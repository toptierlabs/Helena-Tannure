//
//  AgendaTableViewCell.m
//  Helena Tannure
//
//  Created by TopTier on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AgendaTableViewCell.h"


@implementation AgendaTableViewCell

-(void) setLabelText:(NSString *) _text{
    cellText.text = _text;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
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
