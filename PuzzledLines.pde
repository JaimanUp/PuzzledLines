import processing.pdf.*;

//Tile tile = new Tile(0,0,200);
Tile tile;

int divider=5;
float sc=0.0;


int grid=100;
//PVector joints []= new PVector[4*(divider-1)];



void setup(){
	size(600,600,P3D);

	//rect(0,0,200,200);

	background(255);
	
	noFill();


}

void draw(){
	beginRaw(PDF, "output.pdf");

	stroke(0,200,230,25);
	strokeWeight(12);
	for(int i=grid;i<width-grid;i+=grid){
		for (int j=grid;j<height-grid;j+=grid){
			Tile tile = new Tile(i,j,grid);
			tile.innit();

			tile.drawAllLines();
		}
	}
	stroke(255,0,240,20);
	strokeWeight(12);
	for(int i=grid;i<width-grid;i+=grid){
		for (int j=grid;j<height-grid;j+=grid){
			Tile tile = new Tile(i,j,grid);
			tile.innit();

			tile.drawAllLines();
		}
	}*/


	
	endRaw();
	noLoop();
}

void mousePressed(){


	loop();
	background(0);
	tile.innit();

}