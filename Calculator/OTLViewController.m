//
//  OTLViewController.m
//  Calculator
//
//  Created by User on 1/20/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import "OTLViewController.h"

@interface OTLViewController ()

@end

@implementation OTLViewController

@synthesize displayer, operator, clicoperator, update, number1;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // View
    UIImage *patternImage= [UIImage imageNamed:@"arches.png"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:patternImage];
    number1 = 0;
	operator = ' ';
	clicoperator = NO;
	update = NO;
	displayer.text = @"0";
    
    numberNeg=0;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 * Method invoqued when we click on a number
 */
- (IBAction) pushNumber:	(id) sender {
	if (update) {
		update = NO;
		displayer.text = [sender currentTitle];
	}
	else {
		if ([displayer.text compare:@"0"]) {
			displayer.text = [displayer.text stringByAppendingString:[sender currentTitle]];
		}
		else {
			displayer.text = [sender currentTitle];
		}
	}
}

/**
 * Method invoqued when we click on point
 */
- (IBAction) pushPoint:	(id) sender {
	if ([displayer.text rangeOfString:@"."].location == NSNotFound ) {
		displayer.text = [displayer.text stringByAppendingString:@"."];
	}
}
- (IBAction) pushNeg: (id)sender{
    if ([displayer.text rangeOfString:@"+/-"].location == NSNotFound ) {
        numberNeg++;
		displayer.text = @"-";
	}

    
}

/**
 * Method invoqued when we click on "+". This method calls the calcul method
*/
- (IBAction) pushPlus:		(id) sender {
	if (clicoperator) {
		[self calcul];
	}
	else {
		number1 = [displayer.text doubleValue];
		clicoperator = YES;
	}
	operator = '+';
	update = YES;
}

/**
 * Method invoqued when we click on "-". This method calls the calcul method
 */
- (IBAction) pushMinus:		(id) sender {
	if (clicoperator) {
		[self calcul];
	}
	else {
		number1 = [displayer.text doubleValue];
		clicoperator = YES;
	}
	operator = '-';
	update = YES;
}

/**
 * Method invoqued when we click on "*". This method calls the calcul method
 */
- (IBAction) pushMult:		(id) sender {
	if (clicoperator) {
		[self calcul];
	}
	else {
		number1 = [displayer.text doubleValue];
		clicoperator = YES;
	}
	operator = '*';
	update = YES;
}

/**
 * Method invoqued when we click on "/". This method calls the calcul method
 */
- (IBAction) pushDiv:		(id) sender {
	if (clicoperator) {
		[self calcul];
	}
	else {
		number1 = [displayer.text doubleValue];
		clicoperator = YES;
	}
	operator = '/';
	update = YES;
}

/**
 * Method invoqued when we click on the equal. This method calls the calcul method
 */
- (IBAction) pushEqual:		(id) sender {
	[self calcul];
	update = YES;
	clicoperator = NO;
}

/**
 * Reinitializes the Calculator
 */
- (IBAction) pushC:			(id) sender {
	clicoperator = false;
	update = true;
	number1 = 0;
	operator = ' ';
	displayer.text = @"0";
}
/**
 * Method that does the calculus
 */
- (void) calcul {
    if (numberNeg % 2 != 0){
        if (operator == '+') {
            number1 = number1 + [displayer.text doubleValue];
            number1= (-1)*number1;
            displayer.text = [NSString stringWithFormat:@"%g", number1];
        }
        
        if (operator == '-') {
            number1 = number1 - [displayer.text doubleValue];
            number1= (-1)*number1;
            displayer.text = [NSString stringWithFormat:@"%g", number1];
        }
        
        if (operator == '*') {
            number1 = number1 * [displayer.text doubleValue];
            number1= (-1)*number1;
            displayer.text = [NSString stringWithFormat:@"%g", number1];
        }
        
        if (operator == '/') {
            if ([displayer.text doubleValue] != 0 ){
                number1 = number1 / [displayer.text doubleValue];
                number1= (-1)*number1;
                displayer.text = [NSString stringWithFormat:@"%g", number1];
                
            } else {
                number1 = 0;
                displayer.text = [NSString stringWithFormat:@"NaN"];
            }
            
        }
        numberNeg=0;
    }
    else {
        if (operator == '+') {
            number1 = number1 + [displayer.text doubleValue];
            displayer.text = [NSString stringWithFormat:@"%g", number1];
        }
        
        if (operator == '-') {
            number1 = number1 - [displayer.text doubleValue];
            displayer.text = [NSString stringWithFormat:@"%g", number1];
        }
        
        if (operator == '*') {
            number1 = number1 * [displayer.text doubleValue];
            displayer.text = [NSString stringWithFormat:@"%g", number1];
        }
        
        if (operator == '/') {
            if ([displayer.text doubleValue] != 0 ){
                number1 = number1 / [displayer.text doubleValue];
                displayer.text = [NSString stringWithFormat:@"%g", number1];
                
            } else {
                number1 = 0;
                displayer.text = [NSString stringWithFormat:@"NaN"];
            }
        }
    }
    
	
}


@end
