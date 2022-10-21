/***********************************************************************************/
/*Aside from all the recommendations about the obsolescence of this library, 
/*here's a quick explanation of how I modified the AFMotor class:

/* I added three new variables to its definition:
/*1) motorpin: it indicates the Arduino pin the motor is connected to;
/*2) voltage: it indicates the voltage read by the Arduino pin, and is meant to 
/*be updated everytime a movement is performed, or at the beginning of every loop
/*3) treshold: when planning motion, the finite precision of the motors very hardly
/*allows to reach precisely a given voltage value, therefore a naive algorithm 
/*with that goal in mind might never complete and stall the program. 
/*This variable encloses the error we allow on the movement of one motor, and can 
/*be set while defining the motor.

/*Future developments will involve:
/*a) Create get/set methods to access these new variables, which very inelegantly and 
/*dangerously now are handled as public attributes;
/*b) Add some check to ensure only valid values are input while defining a motor;
/*b) Design a robust algorithm to set the position of a motor through voltage feedback
/*************************************************************************************/