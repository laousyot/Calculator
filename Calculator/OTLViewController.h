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
    
    NSMutableString *cal;
    int numberNeg;
    int nbNegatives;
    BOOL Opressed;
    BOOL Minuspressed;
    BOOL numOrOpPressed;
    BOOL Cpressed;
    
}

@property (nonatomic,retain) UILabel *displayer;
@property(readwrite) NSMutableString *cal;

// Numbers
- (IBAction) pushNumber:	(id) sender;
- (IBAction) pushNeg:   (id)sender;
- (IBAction) pushPoint:	(id) sender;

// Mathematical operators
- (IBAction) pushOperand:		(id) sender;
- (IBAction) pushPi:		(id) sender;
- (double) calcul: (NSMutableString *) arg;

// Calculus
- (IBAction) pushEqual:		(id) sender;
- (IBAction) pushC:		(id) sender;



@end
