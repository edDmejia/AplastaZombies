int numeroBolas = 10;
int puntaje = 0;
PImage inicio;
PImage fondo;
int maxpuntaje = 0;
int savedTime;
int totalTime = 12000;
boolean introScreen = true;
zombie[] bolas = new zombie[numeroBolas]; 

void setup() {
  size(600,600);
  inicio = loadImage("inicio.png");
  fondo = loadImage("fondo.jpg");
  textSize(20);
  savedTime = millis();
  
  for (int i = 0; i < bolas.length; i++) {
  bolas[i] = new zombie(); 
  }
}

void draw(){
  background(fondo);
  
  if(keyPressed){
    if (key == 'o'|| key == 'O') {
      introScreen = false;
      }
    }
  if (introScreen == true){
    image(inicio,0,0);
    fill(#FF0000);
    text("MAX : "+maxpuntaje,200,440);
    }
    else{
  
  for (int i = 0; i < bolas.length; i++) {
    bolas[i].caida();
    bolas[i].colision();
    bolas[i].puntaje();
    bolas[i].GAMEOVER();
  }
 }
}

class zombie {
  float d = 50;
  float x = random(600);
  float y = random(height);

  void caida() {
    y = y +3 ;   //VELOCIDAD
    //fill(0,10,200,60);
    ellipse(x, y, d, d);

   if(y>height){
   x = random(600);
   y = random(-100);
   }
  }
  
  void colision () {
    float distancia = dist(mouseX , mouseY, x, y);
    if (mousePressed){
    if (distancia < d){
      //println("hola");
      x = -1000;
      puntaje++;
      maxpuntaje = max(puntaje, maxpuntaje);
      }
     }
    } 
    
  void puntaje () {
    fill(#FFF000);
   text("Puntaje = " +puntaje,400,20);  
}

void GAMEOVER(){
  
  int passedTime = millis() - savedTime;  //resta de tiempo
  if (passedTime > totalTime){
    introScreen = true;
    puntaje = 0;
    savedTime= millis();
    for (int i = 0; i < bolas.length; i++) {
    bolas[i] = new zombie(); 
   }
  }
 }
}
