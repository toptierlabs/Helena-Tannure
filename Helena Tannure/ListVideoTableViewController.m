//
//  ListVideoTableViewController.m
//  Helena Tannure
//
//  Created by TopTier on 9/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ListVideoTableViewController.h"
#import "Helena_TannureAppDelegate.h"


@implementation ListVideoTableViewController

@synthesize videosPrincipal;
@synthesize videosExt;
@synthesize keysExt;
@synthesize keysPrincipal;
@synthesize youtubeController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return [self.videosPrincipal count];
    }else{
        return [self.videosExt count];
    }
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString* CellIdentifier=@"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]autorelease];
    }
    
    if ([indexPath section] == 0) {
        cell.textLabel.text = [self.keysPrincipal objectAtIndex:[indexPath row] ];
    }else{
        cell.textLabel.text = [self.keysExt objectAtIndex:[indexPath row] ];
    }
    
    return cell;
    
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"Oficiais";
    }else{
        return @"Escolhidos pela Helena";
    }
}

- (void) tableView:(UITableView *)tableView 
didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *url;
    if ([indexPath section] == 0) {
        url = [self.videosPrincipal objectForKey:[self.keysPrincipal objectAtIndex:[indexPath row]]];
        self.youtubeController.title = [self.keysPrincipal objectAtIndex:[indexPath row]];
        self.youtubeController.url = url;
        
        Helena_TannureAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        
        [delegate.navController pushViewController:self.youtubeController animated:YES];
        
    }else{
        url = [self.videosExt objectForKey:[self.keysExt objectAtIndex:[indexPath row]]];
        self.youtubeController.title = [self.keysExt objectAtIndex:[indexPath row]];
        self.youtubeController.url = url;
        
        Helena_TannureAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
        [delegate.navController pushViewController:self.youtubeController animated:YES];
    }
    
    
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)dealloc
{
    [self.keysExt release];
    [self.keysPrincipal release];
    
    [self.youtubeController release];

    
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
    
    NSString *pathPrincipal = [[NSBundle mainBundle] pathForResource:@"VideosPrincipal" ofType:@"plist"];
    NSString *pathExtra = [[NSBundle mainBundle] pathForResource:@"VideosExtra" ofType:@"plist"];
    
    NSDictionary *dicPrincipal = [[NSDictionary alloc] initWithContentsOfFile:pathPrincipal];
    NSDictionary *dicExtra = [[NSDictionary alloc] initWithContentsOfFile:pathExtra];
    
    self.videosPrincipal = dicPrincipal;
    self.videosExt = dicExtra;
    
    NSArray *arrayPrin = [self.videosPrincipal allKeys];
    NSArray *arrayExt = [self.videosExt allKeys];
    
    self.keysPrincipal = arrayPrin;
    self.keysExt = arrayExt;
    
    YoutubeViewController *auxYoutube = [[YoutubeViewController alloc] initWithNibName:@"YoutubeView" bundle:nil];
    
    self.youtubeController = auxYoutube;
    
    [dicPrincipal release];
    [dicExtra release];
    [auxYoutube release];
    
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate



@end
