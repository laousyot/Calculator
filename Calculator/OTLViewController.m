//
//  OTLViewController.m
//  Calculator
//
//  Created by User on 1/20/13.
//  Copyright (c) 2013 User. All rights reserved.
//

#import "OTLViewController.h"
#import "math.h"

@interface OTLViewController ()

@end

@implementation OTLViewController

@synthesize displayer, cal;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // View
    UIImage *patternImage= [UIImage imageNamed:@"arches1.png"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:patternImage];
    
    cal = [NSMutableString stringWithCapacity:5];
    displayer.text = @"0";
    numberNeg=0;
    Opressed=FALSE;
    Minuspressed=FALSE;
    numOrOpPressed=FALSE;
    Cpressed=FALSE;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) pushNumber:	(id) sender {
	
    if ([displayer.text compare:@"0"]) {
        displayer.text = [displayer.text stringByAppendingString:[sender currentTitle]];
    }
    else {
        displayer.text = [sender currentTitle];
    }
    Opressed=FALSE;
    Minuspressed=FALSE;
    numOrOpPressed=TRUE;
}
- (IBAction) pushPi:	(id) sender {
    
	if ([displayer.text compare:@"0"]) {
        displayer.text = [displayer.text stringByAppendingString:@"3.141592"];
    }
    else {
        displayer.text = @"3.141592";
        
    }
}

// Method invoqued when we click on point

- (IBAction) pushPoint:	(id) sender {
	if ([displayer.text rangeOfString:@"."].location == NSNotFound ) {
		displayer.text = [displayer.text stringByAppendingString:@"."];
	}
}
- (IBAction) pushNeg: (id)sender{
    if((!Minuspressed &&(!numOrOpPressed))||(Cpressed)){
        numberNeg++;
        Minuspressed=TRUE;
        Cpressed=FALSE;
        if ([displayer.text compare:@"0"]) {
			displayer.text = [displayer.text stringByAppendingString:@"-"];
        }
		else {
			displayer.text = @"-";
            
		}
    }
}


- (IBAction) pushOperand:   (id)sender{
    
    if ((!Opressed && !Minuspressed)){
        Opressed=TRUE;
        numOrOpPressed=FALSE;
        if ([displayer.text compare:@"0"]) {
            displayer.text = [displayer.text stringByAppendingString:[sender currentTitle]];
        }
        else {
        }
    }
	
}

//Method invoqued when we click on the equal. This method calls the calcul method

- (IBAction) pushEqual:		(id) sender {
    [cal appendString:displayer.text];
    double res= [self calcul: cal];
    NSString *myString =[NSString stringWithFormat:@"%f",res];
    displayer.text = myString;
    [cal setString:@""];
	
}

//Reinitializes the Calculator

- (IBAction) pushC:			(id) sender {
    
    [cal setString:@""];
	displayer.text = @"0";
    numberNeg=0;
    nbNegatives=0;
    Cpressed=TRUE;
}

- (double) calcul :arg{
    
    int nbOperand=0;
    BOOL premierneg;
    nbNegatives=0;
    for (int i=0; i< [arg length]; i++)
    {
        if (([arg characterAtIndex:i ] == '+') ||([arg characterAtIndex:i ] == '-') ||([arg     characterAtIndex:i ] == 'x') || ([arg characterAtIndex:i ] == '/') )
        {
            if (i==0){
                premierneg= TRUE;
                nbNegatives++;
            }
            
            else if(i< [arg length]-1 &&([arg characterAtIndex:i+1 ] == '-'))
            {
                nbNegatives++;
                nbOperand++;
                i++;
                
            }
            else
            {
                nbOperand++;
            }
            
        }
    }
    
    if (nbOperand == 0)
    {
        double d = [arg doubleValue];
        return d;
        
    }else if (nbOperand==1 ){
        
        double number1;
        char operator=' ';
        int j=0;
        NSString *nb1;
        NSRange range;
        range.location=0;
        range.length=0;
        for (int i=0; i< [arg length]; i++)
        {
            if (([arg characterAtIndex:i ] == '+') ||([arg characterAtIndex:i ] == '-') ||([arg     characterAtIndex:i ] == 'x') || ([arg characterAtIndex:i ] == '/') )
            {
                if (i!=0 ){
                    break;
                    
                }
                
            }else {
                j=i;
                
            }
            
        }
        
        nb1=[arg substringToIndex:j+1];
        number1 =[nb1 doubleValue];
        operator = [arg characterAtIndex:j+1];
        range.length=j+2;
        [arg deleteCharactersInRange:range];
        double number2;
        number2 =[arg doubleValue];
        double finalresult;
        
        if (operator == '+' ) {
            finalresult= number1+number2;
        }
        if  (operator == '-' ) {
            finalresult= number1-number2;
        }
        if  (operator == 'x' ) {
            finalresult= number1*number2;
        }
        if  (operator == '/' ) {
            finalresult= number1/number2;
        }
        NSString *myString =[NSString stringWithFormat:@"%f",finalresult];
        [arg setString:myString];
        return finalresult;
    }
    else {
        
        double number1;
        char operator1=' ';
        int j=0;
        NSString *nb1;
        NSRange range;
        range.location=0;
        range.length=0;
        
        for (int i=0; i< [arg length]; i++)
        {
            if (([arg characterAtIndex:i ] == '+') ||([arg characterAtIndex:i ] == '-') ||([arg     characterAtIndex:i ] == 'x') || ([arg characterAtIndex:i ] == '/') )
            {if (i!=0 ){
                break;
            }
            }else {
                j=i;
            }
            
        }
        nb1=[arg substringToIndex:j+1];
        number1 =[nb1 doubleValue];
        operator1 = [arg characterAtIndex:j+1];
        range.length=j+2;
        [arg deleteCharactersInRange:range];
        range.length=0;
        
        double number2;
        NSString *nb2;
        char operator2=' ';
        int k=0;
        for (int i=0; i< [arg length]; i++)
        {
            
            if (([arg characterAtIndex:i ] == '+') ||([arg characterAtIndex:i ] == '-') ||([arg     characterAtIndex:i ] == 'x') || ([arg characterAtIndex:i ] == '/') )
            {if (i!=0 ){
                break;
                
            }
            }
            else{
                k=i;
            }
        }
        nb2=[arg substringToIndex:k+1];
        number2 =[nb2 doubleValue];
        operator2 = [arg characterAtIndex:k+1];
        range.length=k+2;
        [arg deleteCharactersInRange:range];
        
        if (operator2=='+' || operator2=='-' ){
            if (operator1 == '+' ) {
                
                double res= number1+number2;
                if(operator2=='+')
                    return (res+[self calcul :arg ]);
                if(operator2=='-')
                    return (res-[self calcul :arg ]);
                
            }
            if  (operator1 == '-' ) {
                double res= number1-number2;
                if(operator2=='+')
                    return (res+[self calcul :arg ]);
                if(operator2=='-')
                    return (res-[self calcul :arg ]);
                
            }
            if (operator1 == 'x' ) {
                double res= number1*number2;
                if(operator2=='+')
                    return (res+[self calcul :arg ]);
                if(operator2=='-')
                    return (res-[self calcul :arg ]);
                
            }
            if  (operator1 == '/' ) {
                double res= number1/number2;
                if(operator2=='+')
                    return (res+[self calcul :arg ]);
                if(operator2=='-')
                    return (res-[self calcul :arg ]);
            }
        }
        else if (operator2=='/' || operator2=='x' ){
            if (operator1 == '+' ) {
                
                NSMutableString* someString = [NSMutableString stringWithString: nb2];
                if (operator2== '/')
                    [someString appendString: @"/"];
                if (operator2== 'x')
                    [someString appendString: @"x"];
                [someString appendString: arg];
                return (number1+[self calcul:someString]);
            }
            if  (operator1 == '-' ) {
                NSMutableString* someString = [NSMutableString stringWithString: nb2];
                if (operator2== '/')
                    [someString appendString: @"/"];
                if (operator2== 'x')
                    [someString appendString: @"x"];
                [someString appendString: arg];
                return (number1-([self calcul:someString]));
            }
            if (operator1 == 'x' ) {
                double res= number1*number2;
                if (operator2=='/' ){
                    return (res/[self calcul :arg ]);
                }else if(operator2=='x' ){
                    return (res*[self calcul :arg ]);
                }
                
            }
            if  (operator1 == '/' ) {
                double res= number1/number2;
                if (operator2=='/' ){
                    return (res/[self calcul :arg ]);
                }else if(operator2=='x' ){
                    return (res*[self calcul :arg ]);
                }
                
            }
        }
        
        
    }
    
}


@end
