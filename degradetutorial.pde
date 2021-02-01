

//Declaramos los 2 colores globales
color col1 = color(random(255), random(255), random(255));
color col2 = color(random(255), random(255), random(255));

void setup() {
  size(1200, 800, P2D);   //Seteamos el tamaño del render
  generate();//Corremos la funcion que genera el sistema generativo de imagenes apenas arranca 
}

void keyPressed() {
  generate(); //Cada vez que apretamos cualquier tecla hacemos que se genere todo de nuevo
}

void generate() {
  
  //Cada vez que generamos el sistema volvemos a reasignar los colores
  col1 = color(random(255), random(255), random(255));
  col2 = color(random(255), random(255), random(255));
  
 
  fondo();
  
  
  
  
  //Colocamos 10 poligonos con sombrita en una posicón random con la cantidad de puntas y el tamaño en random
  int cnt = 10;
  
  for(int i=0; i<cnt; i++){
    poly(random(width), random(height), int(random(3,20)), random(50, 200));
  }
  
  
  
  
}


//Funcion poly para dibujar poligonos. 

void poly(float _x, float _y, int _cnt, float _size) {
  
  //Definimos la cantidad que va a tener de poligonos internos. Es decir son 30 poligonos que se dibujan.
  //El primer for es la cantidad de poligonos.
  //El segundo for la cantidad de vertices del poligono
  int cnt2 = 30;
 
  noStroke();
  for (int k=0; k<cnt2; k++) {
    beginShape();

    for (int i=0; i<_cnt; i++) {
      
      float sizefinal = map(k, 0, cnt2, _size, 0); //Mapeamos del poligono mas grande hasta el poligono mas pequño
      float a = map(i, 0, _cnt, 0, TWO_PI); //Calculamos el angulo en función de la cantidad de vertices que hay. Y lo mapeamos a 2 PI , lo que equivale a una vuelta circular
      float rdm = 10; //Agregamos un poco de random a la posición de los vertices 
      
      //Utilizamos la función de distribución circular dada por seno y coseno. Para mayor entendimiento de esto consultar en otro tutorial 
      //Como este que no se de quie es :)
      //https://www.youtube.com/watch?v=bBGj7R1SbL8
      
      float xx = _x + sin(a) * sizefinal+random(-rdm,rdm);
      float yy = _y + cos(a) * sizefinal+random(-rdm,rdm);


      float neg = random(70); //hacemos una variable para oscurecer las distintas partes del color interno
      
      //Calculamos los 2 colores con las sombritas internas : 
      color col2_2 = color(red(col2)-neg, green(col2)-neg, blue(col2)-neg);
      color col1_1 = color(red(col1)-neg, green(col1)-neg, blue(col1)-neg);
      
      //Hacemos un lerp en función de que posición del poligono es y en base a eso hacemos que sea totalmente un color o totalmente otro color
      color colf = lerpColor(col2_2,col1_1,map(k,0,cnt2,0,1));
      //if (k == cnt2-1) {
        fill(colf,150);
      /*} else {
        fill(0,10);
      }*/

      vertex(xx, yy);
    }
    endShape(CLOSE);
  }
}

void fondo() {
  //Hacemos una función para dibujar el fondo en su totalidad.
  beginShape();
  fill(col1); 
  vertex(0, 0);
  fill(col1); 
  vertex(width, 0);
  fill(col2); 
  vertex(width, height);
  fill(col2); 
  vertex(0, height);
  endShape();
}







void draw() {
  //   generate();
}
