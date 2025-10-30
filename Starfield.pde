class Particle{
   int myColor;
   double myX, myY, mySpeed, myAngle;
  
  public Particle(){
    myX =  myY = 350;
    mySpeed = (Math.random()*2);
    myAngle = (Math.random()*2)*Math.PI;
    myColor = color(255);
  }
  
  public void move(){
    myX = myX + (Math.cos(myAngle))*mySpeed;
    myY = myY + (Math.sin(myAngle))*mySpeed;
  }
  public void show(){
    stroke(myColor);
    line((float)myX, (float)myY, (float)(myX + Math.cos(myAngle)*10), (float)(myY + Math.sin(myAngle)*10));
  }
}//end of Particle class

class OddballParticle extends Particle{
    public OddballParticle(){
    myY = 700;
    myX = (Math.random()*700);
    myColor = 255;
    mySpeed = (Math.random()*3+6); 
  }
  public void show(){
    fill(myColor);
    noStroke();
    triangle((float)myX,(float)myY, (float)myX-7, (float)myY+50, (float)myX+7, (float)myY+50);
    rect((float)myX-25,(float)myY+49, 50, 10);
    triangle((float)myX-25, (float)myY+59, (float)myX-8, (float)myY+59, (float)myX-10, (float)myY+67);
    triangle((float)myX+25, (float)myY+59, (float)myX+8, (float)myY+59, (float)myX+10, (float)myY+67);
    rect((float)myX-10, (float)myY+54, 20, 10, 15);
    stroke(0);
    rect((float)myX-25, (float)myY+49, 3, 10);
    rect((float)myX+25, (float)myY+49, 3, 10);
    rect((float)myX-11,(float)myY+53,3,20);
    rect((float)myX+9,(float)myY+53,3,20);
    rect((float)myX-12,(float)myY+45, 5, 15);
    rect((float)myX+8,(float)myY+45, 5, 15);
    noStroke();
    rect((float)myX-24,(float)myY+25,2,25);
    rect((float)myX+25,(float)myY+25,2,25);
    fill(255,0,0);
    rect((float)myX-22, (float)myY+48, 4, 10);
    rect((float)myX+20, (float)myY+48, 4, 10);
    quad((float)myX, (float)myY+2, (float)myX-7,(float)myY+50, (float)myX-5, (float)myY+50, (float)myX+1, (float)myY+1);
    quad((float)myX, (float)myY+2, (float)myX+7,(float)myY+50, (float)myX+5, (float)myY+50, (float)myX-1, (float)myY+1);
}
  public void move(){
    if (myY < -50){
    myY = 700;
    myX = Math.random()*700;
    mySpeed = (Math.random()*3)+6;  
}
    else
    myY = myY - mySpeed;
  }
}


Particle [] bob = new Particle[300];

public void setup(){
  size(700,700);
  for (int i = 0; i < bob.length - 7; i++)
  bob[i] = new Particle();
  for (int i = bob.length - 7; i < bob.length; i++)
  bob[i] = new OddballParticle();
}

public void draw(){
  background(0);
  for (int i = 0; i < bob.length; i++){
  bob[i].show();
  bob[i].move();
}
}

public void mousePressed(){
  for (int i = 0; i < bob.length - 7; i++)
  bob[i] = new Particle();
  for (int i = bob.length - 7; i < bob.length; i++)
  bob[i] = new OddballParticle();
}
