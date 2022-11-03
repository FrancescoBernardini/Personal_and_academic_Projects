"# Robo_Tuna_Chunks" 

The folder AFMotor_Mod contains the modifications I did to the AFMotor class, in order to associate it to the closed-loop system motor+potentiometer. The additional properties that are needed for this enlargement

1) the Arduino pin the motor is attached to
2) The current voltage read by the Arduino pin connected to the 
3) The treshold that the user wants to set for the movement of a given motor, and that can be different for each motor.

The correct way to instantiate an element class is now:

AF_DCMotor _motorname_(_motornumber_, __ArduinoPin__, __CurrentVoltage__, __MovementTreshold__, _motorfrequency_);

The description of each argument is provided below:

1) _motorname_: the name of the class member. Same as before.

2) _motornumber_: the number of the motor on the motor shield that is associated to this class member. Same as before.
3)  __ArduinoPin__: the Arduino's analog pin that reads the potentiometer associated to the motor; new parameter.
4)  __CurrentVoltage__: used to store the current value of the voltage read by the potentiometer. Can be initialized to whatever value (default 0) but should be updated as soon as the potentiometer can be read. New parameter.
5)  __MovementTreshold__: allows to establish the threshold for the placement of the motor, based on the user's knowledge of the motor's accuracy. An example of usage is when setting as a target voltage Vfin, a function can be designed such that the motor stops moving when the voltage is Vfin +- __MovementTreshold__. New parameter.
6)  _motorfrequency_: the frequency for the commands to send to the motor. Same as before.
