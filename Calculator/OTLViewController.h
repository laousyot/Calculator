//
//  OTLViewController.h
//  Calculator
//
//  Created by User on 1/20/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface OTLViewController : UIViewController{
    IBOutlet UILabel *displayer;
    double number1;
	char operator;
	bool update;
	bool clicoperator;
    
    int numberNeg;
}

@property (nonatomic,retain) UILabel *displayer;
@property(readwrite) double number1;
@property(readwrite) char  operator;
@property(readwrite) bool  update;
@property(readwrite) bool  clicoperator;


// Numbers
- (IBAction) pushNumber:	(id) sender;
- (IBAction) pushNeg:   (id)sender;
- (IBAction) pushPoint:	(id) sender;

// Mathematical operators
- (IBAction) pushPlus:		(id) sender;
- (IBAction) pushMinus:		(id) sender;
- (IBAction) pushMult:		(id) sender;
- (IBAction) pushDiv:		(id) sender;
- (void) calcul;

// Calculus
- (IBAction) pushEqual:		(id) sender;
- (IBAction) pushC:		(id) sender;



@end
