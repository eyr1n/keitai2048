class TileDraw {
	var mc:MovieClip;
	var mcAddTile:MovieClip;
	var mcTiles:MovieClip;
	var textStyle1:TextFormat;
	var textStyle2:TextFormat;
	var i, j;
	
	public function TileDraw(target) {
		mc = target;
		mcAddTile = mc.createEmptyMovieClip("mcAddTile" , 6);
		mcTiles = mc.createEmptyMovieClip("mcTiles" , 7);
		
		textStyle1 = new TextFormat();
		textStyle1.align = "center";
		textStyle1.size = 12;
		textStyle1.color = 0xeee4da;
		
		textStyle2 = new TextFormat();
		textStyle2.align = "center";
		textStyle2.size = 20;
		textStyle2.color = 0xf9f6f2;
		
		mc.createTextField("scoreTitle", 1, 136, 8, 100, 20);
		mc.scoreTitle.setNewTextFormat(textStyle1);
		mc.scoreTitle.text = "SCORE";
		
		textStyle1.size = 20;
		textStyle1.color = 0xffffff;
		
		mc.createTextField("score", 2, 136, 24, 100, 30);
		mc.score.setNewTextFormat(textStyle1);
		mc.score.text = "0";
		
		textStyle1.align = "left";
		textStyle1.size = 16;
		textStyle1.color = 0x776e65;
		
		mc.createTextField("title1", 3, 8, 4, 224, 30);
		mc.title1.setNewTextFormat(textStyle1);
		mc.title1.text = "keitai";
		
		textStyle1.size = 32;
		
		mc.createTextField("title2", 4, 8, 20, 224, 40);
		mc.title2.setNewTextFormat(textStyle1);
		mc.title2.text = "2048";
		
		textStyle1.align = "center";
		textStyle1.size = 12;
		
		mc.createTextField("copyright", 5, 0, 300, 240, 20);
		mc.copyright.setNewTextFormat(textStyle1);
		mc.copyright.text = "Based on 2048 by Gabriele Cirulli.";
		
		textStyle1.size = 20;
		
		mc.lineStyle (8 , 0xbbada0 , 100);
		mc.beginFill (0xbbada0 , 100);
		mc.moveTo (140, 8);
		mc.lineTo ( 232, 8);
		mc.lineTo ( 232, 48);
		mc.lineTo (140, 48);
		mc.endFill();
		
		mc.lineStyle (16 , 0xbbada0 , 100);
		mc.beginFill (0xbbada0 , 100);
		mc.moveTo (8, 68);
		mc.lineTo ( 232, 68);
		mc.lineTo ( 232, 292);
		mc.lineTo (8, 292);
		mc.endFill();
		
		for (i = 0; i < 4; i++ ){
			for (j = 0; j < 4; j++ ){
				mcTiles.createTextField("tile" + i + j, i * 4 + j, 58 * j + 8, 58 * i + 80, 50, 46);
				mcTiles["tile" + i + j].wordWrap = true;
			}
		}
	}
	
	public function tileDraw(tiles):Void {
		var tileColor;
		
		for (i = 0; i < 4; i++ ){
			for (j = 0; j < 4; j++ ){
				if (tiles[i][j] >= 8) mcTiles["tile"+i+j].setNewTextFormat(textStyle2);
				else mcTiles["tile"+i+j].setNewTextFormat(textStyle1);
			
				if (tiles[i][j] == 0) mcTiles["tile"+i+j].text = "";
				else mcTiles["tile"+i+j].text = tiles[i][j];
			}
		}
		
		mcTiles.clear();
		
		for (i = 0; i < 4; i++ ){
			for (j = 0; j < 4; j++ ){
				switch(tiles[i][j]) {
					case 0:
						tileColor = 0xcdc1b4;
						break;
					case 2:
						tileColor = 0xeee4da;
						break;
					case 4:
						tileColor = 0xede0c8;
						break;
					case 8:
						tileColor = 0xf2b179;
						break;
					case 16:
						tileColor = 0xf59563;
						break;
					case 32:
						tileColor = 0xf67c5f;
						break;
					case 64:
						tileColor = 0xf65e3b;
						break;
					default:
						tileColor = 0xedcf72;
						break;
				}
				mcTiles.lineStyle (8 , tileColor , 100);
				mcTiles.beginFill (tileColor , 100);
				mcTiles.moveTo ( 58 * j + 12 , 58 * i + 72 );
				mcTiles.lineTo ( 58 * j + 54 , 58 * i + 72);
				mcTiles.lineTo ( 58 * j + 54 , 58 * i + 114 );
				mcTiles.lineTo ( 58 * j + 12 , 58 * i + 114 );
				mcTiles.endFill();
			}
		}
	}
	
	public function addTileDraw(pos):Void {
		mcAddTile.clear();
		mcAddTile.lineStyle (12 , 0xedcf72 , 100);
		mcAddTile.moveTo ( 58 * pos[0] + 12 , 58 * pos[1] + 72 );
		mcAddTile.lineTo ( 58 * pos[0] + 54 , 58 * pos[1] + 72);
		mcAddTile.lineTo ( 58 * pos[0] + 54 , 58 * pos[1] + 114 );
		mcAddTile.lineTo ( 58 * pos[0] + 12 , 58 * pos[1] + 114 );
		mcAddTile.lineTo ( 58 * pos[0] + 12 , 58 * pos[1] + 72 );
	}
	
	public function scoreDraw(score):Void {
		mc.score.text = score;
	}
}
