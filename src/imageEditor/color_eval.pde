// evaluate the distance of two colors by Euclid distance on RGB
boolean equals(color c1, color c2) {
  return (abs(red(c1)-red(c2)) + abs(green(c1)-green(c2)) + abs(blue(c1)-blue(c2)) + abs(alpha(c1)-alpha(c2))) <= AFFORD_DIFF;
}

// evaluate the distance of two colors by CIEDE2000
//@Deprecated
//  boolean equals(color c1, color c2) {
//  return CIEDE2000(new Lab(c1), new Lab(c2)) <= AFFORD_DIFF;
//}

// CIEDE2000 is one of measure of distance between two colors.
@Deprecated
  float CIEDE2000(Lab lab1, Lab lab2) {
  float sq_Lbar = sq((lab1.L + lab2.L) * 0.5 - 50);
  float rt_Cbar7 = sqrt(1.0 - pow(25, 7) / (pow((sqrt(sq(lab1.a)+sq(lab1.b))+sqrt(sq(lab2.a)+sq(lab2.b)))*0.5, 7) + pow(25, 7)));
  float ad1 = (3 + rt_Cbar7) * lab1.a * 0.5;
  float ad2 = (3 + rt_Cbar7) * lab2.a * 0.5;
  float C1_dash = sqrt(sq(ad2) + sq(lab2.b));
  float C2_dash = sqrt(sq(ad1) + sq(lab1.b));
  float Cbar_dash = (C1_dash + C2_dash) * 0.5;
  float hbar_dash1 = atan2(lab1.b, ad1);
  float hbar_dash2 = atan2(lab2.b, ad2);
  float dh_dash   = hbar_dash2 - hbar_dash1;
  float Hbar_dash = hbar_dash2 + hbar_dash1;
  if (abs(dh_dash) > PI) {
    if (hbar_dash1 < hbar_dash2) dh_dash -= TWO_PI;
    else                         dh_dash += TWO_PI;
    if (Hbar_dash < TWO_PI)    Hbar_dash += TWO_PI;
    else                       Hbar_dash -= TWO_PI;
  }
  float dH_dash = 2 * sqrt(C1_dash*C2_dash) * sin(dh_dash*0.5);
  if (C1_dash !=0 && C2_dash != 0) Hbar_dash *= 0.5;
  float C = (C2_dash - C1_dash) / (0.045+0.002025*Cbar_dash);
  float H = dH_dash / (0.015 + 0.000225*Cbar_dash*(1 - 0.17*cos(Hbar_dash-THIRD_PI*0.5) + 0.24*cos(2*Hbar_dash) + 0.32*cos(3*Hbar_dash+THIRD_PI*0.1) - 0.2*cos(4*Hbar_dash-HALF_PI*0.7)));
  return sqrt(
    sq((lab2.L-lab1.L) / (1 + 0.015*sq_Lbar/sqrt(20+sq_Lbar)))
    + sq(C) + sq(H)
    - 2 * rt_Cbar7 * sin(THIRD_PI * exp(-sq(7.2/PI*Hbar_dash-11))) * C * H
    );
}

// Lab is one of color space.
@Deprecated
  class Lab {
  float L, a, b;

  Lab(color c) {
    float x_r = (0.412391*red(c) + 0.357584*green(c) + 0.180481*blue(c)) / 242.36629;
    float y_r = (0.212639*red(c) + 0.715169*green(c) + 0.072192*blue(c)) / 255.00002;
    float z_r = (0.019331*red(c) + 0.119195*green(c) + 0.950532*blue(c)) / 277.70978;

    float f_x = x_r > EPSILON ? (float) Math.cbrt(x_r) : (k_lab*x_r + 16) / 116;
    float f_y = y_r > EPSILON ? (float) Math.cbrt(y_r) : (k_lab*y_r + 16) / 116;
    float f_z = z_r > EPSILON ? (float) Math.cbrt(z_r) : (k_lab*z_r + 16) / 116;

    this.L = (float) 116*f_y - 16;
    this.a = 500 * (f_x - f_y);
    this.b = 200 * (f_y - f_z);
  }
}

// there are constant values that use in Lab constractor.
@Deprecated
  final float EPSILON_Lab = 216.0 / 24389;
@Deprecated
  final float k_lab       = 24389 / 27.0;