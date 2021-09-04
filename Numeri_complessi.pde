class cmplxN{
  double re, im;

  cmplxN(double r, double i) {
    re = r; im = i;
  }

  double absV(){
    return Math.sqrt(re * re + im * im);
  }

  /*void powe(double n){
    im *= -1;
    double m = this.absV();
    double theta = Math.atan(im / re);
    re = pow(m, n) * cos(theta * n);
    im = pow(m, n) * sin(theta * n);
  }*/

  void sqrd(){
    //im *= -1;
    double app = re;
    re = app * app - im * im;
    im = 2 * app * im;
  }
  void addN(cmplxN n) {
    this.re += n.re; 
    this.im += n.im;
  }
}
