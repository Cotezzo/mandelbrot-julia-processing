int RepM = 250;
//int RepJ = 250;
int f(cmplxN z, cmplxN c) {
  int rep = 0;
  while(rep < RepM && z.absV() <= 2){
    z.sqrd(); z.addN(c); //z^2 + c
    rep++;
  }
  if(rep == RepM) return 0;
  else return rep % 255;
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -//

double schifo1, schifo2; //Per stampare le coordinate
double jsx = -2, jdx = 2, jup = 1.5, jdwn = -1.5; //Julia

void disegnaJulia(double wn, double hn, int start, double mx, double my){
  double x1, y1;
  color c;
  int col;
  double n1 = mx / (wn-start) * (dx - sx) + sx;
  double n2 = my / hn * (dwn - up) + up;
  
  for(int x = start; x < wn; x++) {
    for(int y = 0; y < hn; y++) {
      x1 = (x-start) / (wn-start) * (jdx - jsx) + jsx;
      y1 = y / hn * (jdwn - jup) + jup;
      cmplxN z1 = new cmplxN(x1, y1);
      cmplxN c1 = new cmplxN(n1, n2);
      col = f(z1, c1);
      c = color(col, 255, col * 20);
      pixels[x + y * width] = c;
    }
  }
  schifo1 = n1; schifo2=n2; bmx=mx; bmy=my;
}

double sx = -2, dx = 1, up = 1, dwn = -1; //Mandelbrot

void disegnaBrot(double wn, double hn, int start){
  for(int x = 0; x < wn; x++) {
    for(int y = start; y < hn; y++) {
      double x1 = x / wn * (dx - sx) + sx;
      double y1 = (y-start) / (hn-start) * (dwn - up) + up;
      cmplxN z1 = new cmplxN(x1, y1);
      cmplxN c1 = new cmplxN(x1, y1);
      int col = f(z1, c1);
      color c = color(col, 255, col * 20);
      pixels[x + y * width] = c;
    }
  }
}

double getmxMap(double mx){
  return mx / ((double)width/2) * (dx - sx) + sx;
}

double getmyMap(double my){
  return (my) / (double)height * (dwn - up) + up;
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -//

void testo(String s1, int w, int h){
  textSize(14); fill(0); 
  text(s1, w, h+1);
  text(s1, w+1, h);
  text(s1, w-1, h);
  text(s1, w, h-1);
  fill(255);
  text(s1, w, h);
}

void setuppino(){
  disegnaBrot(W/2,H,0);
  updatePixels();
}

void resetJulia(){
    jsx = -2; jdx = 2; jup = 1.5; jdwn = -1.5;
    zmJ=1;
}

void ZoomM(boolean InOut){
  double x1 = mouseX / (W/2) * (dx - sx) + sx;
  double y1 = mouseY / H * (dwn - up) + up;
  
  int a = (InOut)? 1: -1;
  double d = (InOut)? 2: 1;
  sx += a*(x1 - sx) / d; dx -= a*(dx - x1) / d;
  up += a*(y1 - up) / d; dwn -= a*(dwn - y1) / d;
  zmM+=a;
  setuppino();
}

void ZoomJ(boolean InOut){
  double x1 = (mouseX-(W/2)) / (W/2) * (jdx - jsx) + jsx;
  double y1 = mouseY / H * (jdwn - jup) + jup;
  
  int a = (InOut)? 1: -1;
  double d = (InOut)? 2: 1;
  jsx += a*(x1 - jsx) / d; jdx -= a*(jdx - x1) / d;
  jup += a*(y1 - jup) / d; jdwn -= a*(jdwn - y1) / d;
  zmJ+=a;
  disegnaJulia(W,H,(int)W/2,bmx,bmy);
  updatePixels();
}

//- - - - - - - -


//double schifo1, schifo2; //Per stampare le coordinate
//double jsx = -2, jdx = 2, jup = 1.5, jdwn = -1.5; //Julia
double bmx, bmy;

void disegnaJuliaVecchio(double wn, double hn, int start){
  double x1, y1;
  color c;
  int col;
  double n1 = bmx / (wn-start) * (dx - sx) + sx;
  double n2 = bmy / hn * (dwn - up) + up;
  
  for(int x = start; x < wn; x++) {
    for(int y = 0; y < hn; y++) {
      x1 = (x-start) / (wn-start) * (jdx - jsx) + jsx;
      y1 = y / hn * (jdwn - jup) + jup;
      cmplxN z1 = new cmplxN(x1, y1);
      cmplxN c1 = new cmplxN(n1, n2);
      col = f(z1, c1);
      c = color(col, 255, col * 20);
      pixels[x + y * width] = c;
    }
  }
  schifo1 = n1; schifo2=n2;
}
