

import 'package:flutter/material.dart';
import 'package:my_calculator/Controllers/arithmetic_operations.dart';
import 'package:my_calculator/Controllers/operations_temp.dart';

class NumberButton extends StatelessWidget {

  String label; Color color; double width;   Function onTapped;
  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }




  NumberButton(this.label,this.color,this.onTapped(),this.width);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(this.label == 'C'){
           first_operand=0.0;
           second_operand=0.0;
           result = 0.0;
           screen_display = '';
           arithmatic_operation = '+';
           get_second_operand = false;
           repeat_operation = false;
           encore_operation = false;
           first_operand_display='';
           second_operand_display='';
           result_obtained = false;
        } else if(isNumeric(this.label)){
          if(get_second_operand){
            second_operand_display = second_operand_display + this.label;
            screen_display =  first_operand_display + arithmatic_operation + second_operand_display;
          } else if(!get_second_operand) {
            first_operand_display = first_operand_display + this.label;
            screen_display = first_operand_display;
          }
        } else if(this.label =='+' || this.label == '-' || this.label =='X' || this.label == '/'){
          result_obtained = false;
          arithmatic_operation = this.label;
          screen_display = screen_display + arithmatic_operation;
          if(encore_operation){
            first_operand = result;
            first_operand_display = result.toString();
            screen_display = result.toString() + arithmatic_operation;
            repeat_operation = false;


          }
          else{
            first_operand = double.parse(first_operand_display);
            get_second_operand = true;
          }
        } else if(this.label == '='){

          if(repeat_operation){
            first_operand = result;
            if(arithmatic_operation == '+'){
              result = first_operand + second_operand;
              screen_display = result.toString();
            }
            if(arithmatic_operation == '-'){
              result = first_operand - second_operand;
              screen_display = result.toString();
            }
            if(arithmatic_operation == 'X'){
              result = first_operand * second_operand;
              screen_display = result.toString();
            }
            if(arithmatic_operation == '/'){
              result = first_operand / second_operand;
              screen_display = result.toString();
            }

          } else {
            second_operand = double.parse(second_operand_display);
            if(arithmatic_operation == '+'){
              result = first_operand + second_operand;
              screen_display = result.toString();
            }
            if(arithmatic_operation == '-'){
              result = first_operand - second_operand;
              screen_display = result.toString();
            }
            if(arithmatic_operation == 'X'){
              result = first_operand * second_operand;
              screen_display = result.toString();
            }
            if(arithmatic_operation == '/'){
              result = first_operand / second_operand;
              screen_display = result.toString();
            }
            repeat_operation = true;
            encore_operation = true;
          }
          second_operand_display = '';

        }
        this.onTapped();
        },
      child: AnimatedContainer(
        duration: Duration(seconds: 4),
        curve: Curves.easeInOut,
        margin: EdgeInsets.all(5),
        color: this.color,
        width:this.width,
        height:80,
        child: Center(
            child: Text(
              style: TextStyle(
                  fontSize: 70
              ),
              this.label,
            )
        ),
      ),
    );
  }
}
