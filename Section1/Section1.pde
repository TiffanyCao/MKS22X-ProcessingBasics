int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  int num;
  int width, height;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    this.width = 400;
    this.height = 200;
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  
  Visualizer(float x, float y, int num, int width, int height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    values = new float[num];
    speeds = new float[num];
    for (int i = 0; i < values.length; i++){
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 400, 200);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+100, x+400, y+100);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    for(int i = 0; i < values.length; i++){ //looping through array
      if(values[i] < 0){ //if value is negative
        fill(255, 165-(Math.abs(values[i]) * 1.6), 0);
        /*if(values[i] >= -50){ //if value is greater than -50
          fill(255, 165, 0); //orange
        }else fill(255, 0, 0); //red
        */
        //if(values[i] >= -50) fill(255, Math.abs(values[i])*3.3, 0);
        //else fill(255, 0, 0);
        rect(x+(i*(400/values.length)), y+100+(Math.abs(values[i])), 400/values.length, values[i]);
      }else{ //if value is positive
        /*if(values[i] < 50) fill(255, 255, 0); //if value is less than 50, yellow
        else fill(0, 255, 0); //green
        */
        if(values[i] < 50) fill(255-(values[i] * 1.5), 255, 0);
        else fill(255-(values[i]*2.55), 255, 0);
        rect(x+(i*(400/values.length)), y+(100-values[i]), 400/values.length, values[i]);
      }
    }
   

    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) { //loop through array
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if(values[i] >= MAX_VALUE || values[i] <= MIN_VALUE){ //if the value reaches min or max, reverse the speeds
        speeds[i] = -speeds[i];
      }
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min

      
    }
  }
}

void setup() {
  size(600, 500);
  v = new Visualizer(20, 20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
