#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@interface PhotoViewController : TTThumbsViewController {
    
    NSMutableArray *images;
    
	// parser
	NSXMLParser * rssParser;
	NSMutableArray * stories;
	NSMutableDictionary * item;
	NSString * currentElement;
	NSMutableString * currentImage;
	NSMutableString * currentCaption;
}

@property (nonatomic, retain) NSMutableArray *images;
@property (nonatomic,retain) NSDictionary *dicPhotos;
@property (nonatomic,retain) NSArray   *keysPhotos;

@end
