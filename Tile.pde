class Tile {




	
	PVector position ;
	float tileSize ;
	PVector joints []= new PVector[4*(divider-1)];
	IntList order=new IntList();


	Tile(float tx, float ty, int s){
		position= new PVector(tx,ty);
		tileSize= (s);


	}

	void innit(){
		populateJoints();
		randomPairs();

	}
	void populateJoints(){
		int num=0; 
		for (int i=1; i<(divider);i++){
			joints[num]=new PVector(position.x+i*tileSize/divider,position.y);
			num++;
		}
		for (int i=1; i<(divider);i++){
			joints[num]=new PVector(position.x+tileSize,position.y+i*tileSize/divider);
			num++;

		}
		for (int i=(divider-1); i>0;i--){
			joints[num]=new PVector(position.x+i*tileSize/divider,position.y+tileSize);
			num++;
		}
		for (int i=(divider-1); i>0;i--){
			joints[num]=new PVector(position.x,position.y+i*tileSize/divider);
			num++;
		}
	}

	void randomPairs(){
		order.clear();
		for (int t=0; t<4*(divider-1);t++){order.append(t);}
		order.shuffle();
		
	}
	


	void drawLine(int ti, int tj){
		
		int i=order.get(ti);
		int j=order.get(tj);
		
		PVector anchor1= joints[i];
		PVector control1 = PVector.add(anchor1, controlPoint(i));
		
		PVector anchor2= joints[j];	
		PVector control2 = PVector.add(anchor2, controlPoint(j));

		//println(anchor1,control1,control2,anchor2);

		bezier(anchor1.x,anchor1.y,control1.x,control1.y,control2.x,control2.y,anchor2.x,anchor2.y);
	}

	void drawAllLines(){

		for(int i=0;i<4*(divider-1);i+=2){
			drawLine(i,i+1);
		}
	}


		PVector controlPoint(int i){
			PVector result= new PVector(0,0);
			switch(int(i/(divider-1))){
				case 0:
				result=new PVector(0,sc*tileSize/divider);
				break;
				case 1:
				result=new PVector(-sc*tileSize/divider,0);
				break;
				case 2:
				result=new PVector(0,-sc*tileSize/divider);
				break;
				case 3:
				result=new PVector(sc*tileSize/divider,0);
				break;}

				return(result);	

			}		



		}

