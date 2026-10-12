//julian bryson | 10/7/26 | calculator
String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[13];

 

void setup() {
  size(325, 550);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  numButtons[0] = new Button(120, 345, 70, 70, '0', 128, 140);
  numButtons[1] = new Button(45, 120, 70, 70, '1', 128, 140);
  numButtons[2] = new Button(120, 120, 70, 70, '2', 128, 140);
  numButtons[3] = new Button(195, 120, 70, 70, '3', 128, 140);
  numButtons[4] = new Button(45, 195, 70, 70, '4', 128, 140);
  numButtons[5] = new Button(120, 195, 70, 70, '5', 128, 140);
  numButtons[6] = new Button(195, 195, 70, 70, '6', 128, 140);
  numButtons[7] = new Button(45, 270, 70, 70, '7', 128, 140);
  numButtons[8] = new Button(120, 270, 70, 70, '8', 128, 140);
  numButtons[9] = new Button(195, 270, 70, 70, '9', 128, 140);

  opButtons[0] = new Button(270, 120, 70, 70, '+', 128, 140);
  opButtons[1] = new Button(270, 195, 70, 70, '-', 128, 140);
  opButtons[2] = new Button(270, 270, 70, 70, '/', 128, 140);
  opButtons[3] = new Button(270, 345, 70, 70, 'x', 128, 140);
  opButtons[4] = new Button(45, 420, 70, 70, ' ', 128, 140);
  opButtons[5] = new Button(270, 420, 70, 70, ' ', 128, 140);
  opButtons[6] = new Button(270, 495, 70, 70, '=', 128, 140);
  opButtons[7] = new Button(45, 345, 70, 70, '.', 128, 140);
  opButtons[8] = new Button(195, 345, 70, 70, ' ', 128, 140);
  opButtons[9] = new Button(120, 420, 70, 70, ' ', 128, 140);
  opButtons[10] = new Button(195, 420, 70, 70, ' ', 128, 140);
  opButtons[11] = new Button(195, 495, 70, 70, ' ', 128, 140);
  opButtons[12] = new Button(45, 495, 145, 70, 'C', 128, 140);
}

void draw() {
  background(0);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  //background shape
  rectMode(CORNER);
  rect(20, 20, width-40, 60, 10);
  //Overlay text
  fill(0);
  textAlign(RIGHT);
  text(displayVal, width-30, 40);
}
void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover()) {
      String digit = str(numButtons[i].label);

      if (newEntry || displayVal.equals("0.0")) {
        displayVal = digit;
        newEntry = false;
      } else {
        displayVal += digit;
      }

      if (left == true) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    
  //Op buttons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      char clicked = (opButtons[i].label);

      if (clicked == '=') {
        performCalc();
      } else if (clicked == 'C') {
        l = 0.0;
        r = 0.0;
        result = 0.0;
        op = ' ';
        left = true;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == '+' || clicked == '-' ||
                 clicked == 'x' || clicked == '+') {
        op = clicked;
        left = false;
        newEntry = true;
      } else if(clicked == '.') {
        if(displayVal.contains(".") == false) {
          if(left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    } 
    //else {
    //  displayVal = displayVal + (opButtons[i].label);
    //}
  }
}

//void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '/') {
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
}

//void keyPressed(){
if (key == '1') {
  println("you hit 1" + keyCode);
  }
}
//void handleEvent(char val, boolean isNum) {
 // if(isNum == true) {
  //} else {
 // }
//}
