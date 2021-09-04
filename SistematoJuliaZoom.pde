import org.apache.commons.math3.*;

int zmM = 1, zmJ = 1;
double W, H;

void setup(){
  size(1800, 600);
  background(255);
  W = width; H = height;
  colorMode(HSB);
  loadPixels();
  setuppino();
}



boolean switcc=true;
void draw(){
  if(mouseX<W/2 && switcc)
    disegnaJulia(W,H,(int)W/2,mouseX,mouseY);
  updatePixels();
  if(mouseX<W/2)
    testo("c: " + getmxMap(mouseX) + " + " + getmyMap(mouseY) + "i", 7, height-10);
  //else
    //testo("NullPointerException", 10, height-10)  
  testo("c: " + schifo1 + " + " + schifo2 + "i", width/2+7, height-10);
  testo("Zoom: x" + zmM, 7, 20);
  testo("Zoom: x" + zmJ, width/2+7 ,20);
  testo("Rep: " + RepM, 7, 40);
  //testo("Rep: " + RepJ, 7, width/2+7 ,40);
}




boolean z;
void keyPressed(){
  if(mouseX<W/2){
    if(key=='a'){ z=true; ZoomM(z);}
    if(key=='s'){ z=false; ZoomM(z);}
  }else if(!switcc){
    if(key=='a'){ z=true; ZoomJ(z);}
    if(key=='s'){ z=false; ZoomJ(z);}
  }
  if(key == ' '){
    switcc=!switcc;
    resetJulia();
  }
  if(key == 'd'){RepM += 250; disegnaJulia(W,H,(int)W/2,bmx,bmy); setuppino();}
  if(key == 'x'){RepM -= 250; disegnaJulia(W,H,(int)W/2,bmx,bmy); setuppino();}
}
