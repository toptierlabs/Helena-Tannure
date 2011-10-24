//
//  AgendaViewController.m
//  Helena Tannure
//
//  Created by TopTier on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AgendaViewController.h"


@implementation AgendaViewController

NSMutableArray *listOfDaysMonths;
NSMutableArray *listOfDays;

NSMutableArray *listOfEventsHour;
NSMutableArray *listOfEventsDesc;

NSMutableString *responseHTML;

- (UITableViewCell *) tableView:(UITableView *)tableView 
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == tblDates) {
        static NSString *MyIdentifier = @"Cell";
        
        
        AgendaTableViewCell *cell = (AgendaTableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if(cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"AgendaTableViewCell" owner:self options:nil];
            cell = tblCell;
        }
        
        [cell setLabelText:[listOfDaysMonths objectAtIndex:indexPath.row]];
        
        CGRect a=CGRectMake(8, 0, 300, 44);
        UIImageView *aImg=[[UIImageView alloc] initWithFrame:a];
        UIImageView *bImg=[[UIImageView alloc] initWithFrame:a];
        aImg.image=[UIImage imageNamed:@"tablecellgray.png"]; //arrow.png
        bImg.image=[UIImage imageNamed:@"tablecellpink.png"];
        [aImg setContentMode:UIViewContentModeScaleToFill];
        [bImg setContentMode:UIViewContentModeScaleToFill];
        cell.backgroundView=aImg;
        cell.selectedBackgroundView=bImg;


        
        [aImg release];
        [bImg release];
        return cell;

    }
    else if (tableView == tblEvents) {
        
        static NSString *MyIdentifier = @"CellEvents";
        
        AgendaEventsViewCell *cell = (AgendaEventsViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        if(cell == nil) {
            [[NSBundle mainBundle] loadNibNamed:@"AgendaEventsViewCell" owner:self options:nil];
            cell = tblCellEvents;
        }
        
        [cell setLabelDate:[listOfEventsHour objectAtIndex:indexPath.row]];
        [cell setLabelDesc:[listOfEventsDesc objectAtIndex:indexPath.row]];
        return cell;
        
    }

}

- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath
{
//    cell.backgroundColor = [UIColor colorWithRed: 0.0 green: 1.0 blue: 0.0 alpha: 1.0];
    if (tableView == tblDates) {
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.detailTextLabel.backgroundColor = [UIColor clearColor];
        
        
    }

}


-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tblDates cellForRowAtIndexPath:indexPath];
    UIView *subview = [[cell.contentView subviews] objectAtIndex:([[cell.contentView subviews] count] -1)];
    [subview removeFromSuperview];
}

- (void) tableView:(UITableView *)tableView 
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == tblDates) {
        [listOfEventsHour removeAllObjects];
        [listOfEventsDesc removeAllObjects];
        NSString *temp = [responseHTML stringByReplacingOccurrencesOfString:@"<br />" withString:@""];

        
        NSData *data = [temp dataUsingEncoding:NSUTF16StringEncoding];

        // Create parser
        TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
        

        NSArray *elementsDay  = [xpathParser searchWithXPathQuery:@"//div[@class='info']"];
        
        
        TFHppleElement *elementDay = [elementsDay objectAtIndex:indexPath.row];
        
        NSString *contentDay = [elementDay content];
                
        contentDay = [contentDay stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        NSRange range = NSMakeRange (0, 5);
        NSString * hora = [contentDay substringWithRange:range];
        
        range = NSMakeRange (5, [contentDay length] - 5);
        NSString * texto = [contentDay substringFromIndex:5];

        
        texto = [texto stringByReplacingOccurrencesOfString:@"\n" withString:@""];
        texto = [texto stringByReplacingOccurrencesOfString:@"\t" withString:@""];
        
       //TODO:Ver como acomodar estas dos cisas
       [listOfEventsHour addObject:hora];
       [listOfEventsDesc addObject:texto];

        
        NSIndexPath *index = [tblDates indexPathForSelectedRow];
        if (index != nil){
            if (index.row == indexPath.row)
            {
                CGRect rect=CGRectMake(10, 10, 20, 20);
                UIImageView *aView = [[UIImageView alloc] initWithFrame:rect];
                aView.image = [UIImage imageNamed:@"arrow.png"];
                [aView setFrame:CGRectMake(49 , 10, 20, 20)];
                UITableViewCell *cell = [tblDates cellForRowAtIndexPath:indexPath];

                tblDates.clipsToBounds = NO;
                [cell.contentView addSubview:aView];
            }
        }
        
        [tblEvents reloadData];
    }
    
}

-(void) makeHttpRequest:(NSString *) url {
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    // create the connection with the request
    
    // and start loading the data
    
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if (theConnection) {
        // Create the NSMutableData to hold the received data. 
        // receivedData is an instance variable declared elsewhere.
        receivedData = [[NSMutableData data] retain];
        
    } else {
        
        // Inform the user that the connection failed.
    }
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == tblDates) {
        return [listOfDaysMonths count];
    }
    else
    {
        return [listOfEventsHour count];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [listOfEventsHour release];
    [listOfEventsDesc release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    listOfDaysMonths = [[NSMutableArray alloc] init];
    listOfDays = [[NSMutableArray alloc] init];

    
    [self makeHttpRequest: @"http://www.helenatannure.com/agenda.php"];
    
    listOfEventsHour = [[NSMutableArray alloc] init];
    listOfEventsDesc = [[NSMutableArray alloc] init];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//-----------------metodos de para pedido HTTP------------------------------------------------------------

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    
    // Append the new data to receivedData.
    
    // receivedData is an instance variable declared elsewhere.
    
    [receivedData appendData:data];
    
}



//Y esto otro por si falla
- (void)connection:(NSURLConnection *)connection

  didFailWithError:(NSError *)error

{
    
    // release the connection, and the data object
    [connection release];
    
    // receivedData is declared as a method instance elsewhere 
    [receivedData release];
    
    
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",   
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
}



//Y esto para cuando termina, aca tenes que parsear los datos y actualizar la grilla
- (void)connectionDidFinishLoading:(NSURLConnection *)connection

{
    
    // do something with the data
    
    // receivedData is declared as a method instance elsewhere 
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    NSString *string = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
    responseHTML = [[NSMutableString alloc] initWithString:string];
    
    NSData *data = [responseHTML dataUsingEncoding:NSUTF16StringEncoding];
    
    // Create parser
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:data];
    
    //Get all the cells of the 2nd row of the 3rd table 
    NSArray *elementsMonth  = [xpathParser searchWithXPathQuery:@"//span[@class='mes']"];
    
    NSArray *elementsDay  = [xpathParser searchWithXPathQuery:@"//span[@class='dia']"];
    
    for (int i = 0; i< [elementsMonth count]; i++) {
        // Access the cell
        TFHppleElement *elementMonth = [elementsMonth objectAtIndex:i];
        TFHppleElement *elementDay = [elementsDay objectAtIndex:i];
        // Get the text within the cell tag
        NSString *contentMonth = [elementMonth content]; 
        NSString *contentDay = [elementDay content];
        [listOfDays addObject:contentDay];
        NSMutableString *monthDay = [[NSMutableString alloc] initWithString:contentMonth];
        [monthDay appendString:contentDay];
        [listOfDaysMonths addObject: monthDay];
        
    }
    
    [tblDates reloadData];

    
    [xpathParser release];
    [string release];
    
    
    // release the connection, and the data object
    [connection release];
    [receivedData release];
    
}

@end
