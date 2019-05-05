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
  
  /**A constructor for a Visualizer
  *@param float x, y
  *@param int num is the number of values
  */
  Visualizer(float x, float y, int num) {
    this.x = x;
    this.y = y;
    this.num = num;
    this.width = 400;
    this.height = 200;
    values = new float[num];
    speeds = new float[num];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  
  /**A constructor for a Visualizer
  *@param float x, y
  *@param int num is the number of values
  *@param int width, height (of the Visualizer)
  */
  Visualizer(float x, float y, int num, int width, int height){
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    MAX_VALUE = height/2;
    MIN_VALUE = -(height/2);
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
    rect(x, y, width, height);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(height/2), x+width, y+(height/2));

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    for(int i = 0; i < values.length; i++){ //looping through array
      if(values[i] < 0){ //if value is negative
        float g = (MAX_VALUE + values[i]) * (255/MAX_VALUE); //adjust green value
        fill(255, g, 0);
        rect(x+(i*(width/values.length)), y+(height/2)+(Math.abs(values[i])), width/values.length, values[i]);
      
        //fill(255, 165-(Math.abs(values[i]) * (165/MAX_VALUE)), 0);
        //fill(255, 165-(Math.abs(values[i]) * (165/(height/2))), 0);
        //}else fill(255, values[i]* (165/MAX_VALUE), 0);
        
      }else{ //if value is positive
        float r = (MAX_VALUE - values[i]) * (255/(MAX_VALUE/2)); //adjust red value
        fill(r, 255, 0);
        rect(x+(i*(width/values.length)), y+((height/2)-values[i]), width/values.length, values[i]);
        
        /*if(values[i] < (MAX_VALUE / 2)) fill(255-(values[i] * (255/height)), 255, 0);
        else fill(255-(values[i]*(255/height/2)), 255, 0);
        */
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
  v = new Visualizer(20, 20, 40, 400, 200);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
