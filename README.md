Calculator Othmane Laousy


An easy way to do a calculator in C is to ask the user for the first and second number and then the operators (+,-,* or /), calculate and print the result easily handling edge cases (division by 0…) using if statements. Here is the code:

main() 
{ 

char op;

int a,b;

printf("Give operand a:");

scanf("%d",&a);

printf("Give the operator (+,-,*,/)");

scanf("%c",&op); 

printf("Give operand b:"); 

scanf("%d",&b); 

switch(op) 

{ 
case'+':printf("%d+%d=%d",a,b,a+b);break; 

case'-':printf("%d-%d=%d",a,b,a-b);break; 

case'*':printf("%d*%d=%d",a,b,a*b);break; 

case'/':if(b==0) 

printf("Error: Division by 0!");break; 

else 

printf("%d/%d=%d",a,b,a/b);break; 

default:printf("Operator not accepted"); 


} 

} 


Since we went through some Objective-c during the lecture here is how I would implement a calculator as a view based application: 
So first of all, we are going to build the interface dragging and dropping buttons and frames provided by XCode.Then in the .h file we add the IBOutlet to be able to modify the display from the code and the IBActions, that we will call when touching the buttons. We will add one IBAction per button.After that we link the view and the controller using what we saw in class. (All our buttons are going to be Touch Up Inside)
Now we need to consider the properties that will help for calculating:
First of all the input needs to be checked, in fact the calculator can’t process inputs like “1++3” or “(1*3(” but we must accept strings like “(-3)*1”. We can either change the color of the operation shown in the frame to let the user know that he/she made a mistake and correct it using the back key or delete everything and display an error message (invalid input for example).
If the input is valid, we can have a method that replaces special inputs such as PI by their approximated numberWe can store the operators and operands into two different stacks one for the operators and another for the operands. The case in which the user wants to do another operation using the result displayed can be handled via a Boolean “update”; we would then keep the result shown and use it for the other operation.When evaluating the operation we need to handle the right order which means divisions and multiplications first and then subtraction and addition, also all the inputs in parenthesis should be calculated first. So we can have a method that handles the parenthesis and then another one that does the operation with the order using both stacks. 