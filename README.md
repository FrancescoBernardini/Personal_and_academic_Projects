# Robo_Tuna_Chunks

**#1 - AFMotor class update**
The folder AFMotor_Mod contains the modifications I did to the AFMotor class in order to associate to it some 
parameters of the motor, that is handy to have associated to the class instance itself, such as:
1) the Arduino pin the motor is attached to
2) The current voltage read by the Arduino pin
3) The treshold that the user wants to set for the movement of a given motor, and that can be different for each motor.


**#2 - Optimal guidance of a homing missile**
Within MECE6388 Optimal Control class, I chose as final project topic the optimal guidance of a homing missile. I developed a 
(very naive) procedure to rake through the LQR parameters and choose the most suitable ones based on three criteria:
1) The maximum control that can be applied
2) The maximum error that can be allowed for a successful collision
3) The maximum power required by the mission (embodied in an integral of the control from 0 to T)

**#3 - FPGA**
This folder contains material related to class ECE6370, dealing with FPGA and Verilog.
