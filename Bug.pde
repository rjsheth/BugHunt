class Bug {
  // fields
  float x;
  float y; 
  color bodyColor; 
  float speed; 
  int s;  //state

  // constructor
  Bug(float x, float y, int s) {
    this.x = x;
    this.y = y;
    this.s = s;
    this.speed = random(1, 1.5);
    this.bodyColor = color(random(255), random(255), random(255));
  }
  // methods
  void crawl() {

    //left to right
    if (s==1) {
      x=x+speed;
      if (x>515) {
        x=-15;
        x=x+speed;
      }
    }
    //right to left
    else if (s==2) {
      x=x-speed;
      if (x<-15) {
        x=515;
        x=x-speed;
      }
    }
    //top to bottom
    else if (s==3) {
      y=y+speed;
      if (y>515) {
        y=-15;
        y=y+speed;
      }
    }
    //bottom to top
    else if (s==4) {
      y=y-speed;
      if (y<-15)
      {
        y=515;
        y=y-speed;
      }
    }
  }

  void display() {
    //draw the bug
    fill(bodyColor);
    if (s==1 || s==2) {
      line(x-10, y-15, x-10, y+15);
      line(x, y-15, x, y+15);
      line(x+10, y-15, x+10, y+15);
      fill(bodyColor);
      ellipse(x, y, 30, 20);
    }
    if (s==3 || s==4) {
      line(x-15, y-10, x+15, y-10);
      line(x-15, y, x+15, y);
      line(x-15, y+10, x+15, y+10);
      ellipse(x, y, 20, 30);
    } 
    if (s==0);
  }

  void squash() {
    speed=0;
    s=0;
  }

  void runAway() {
    speed = speed*1.5;
  }
  boolean mouseOn() {
    if (dist(mouseX, mouseY, x, y) <= 15) {
      return true;
    } else return false;
  }
  boolean scared() {
    if (dist(mouseX, mouseY, x, y) <= 30) {
      return true;
    } else return false;
  }
}