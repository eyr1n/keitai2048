class Main {
	public static function main(mc:MovieClip):Void {
		var tiles = [
			[0, 0, 0, 0],
			[0, 0, 0, 0],
			[0, 0, 0, 0],
			[0, 0, 0, 0]
		];
		
		var td:TileDraw = new TileDraw(mc);
		
		var gf:GameFunc = new GameFunc(mc);
		gf.addTile(tiles);
		gf.addTile(tiles);
		
		td.tileDraw(tiles);
		
		var keyListener = new Object(); 
		keyListener.onKeyUp = function() {
			var dir;
			switch (Key.getCode()) {
				case 50: //Up
					dir = 0;
					break;
				case 56: //Down
					dir = 1;
					break;
				case 52: //Left
					dir = 2;
					break;
				case 54: //Right
					dir = 3;
					break;
			}
			if (gf.canMoveTile(tiles, dir)) {
				gf.moveTile(tiles, dir);
				gf.sumTile(tiles, dir);
				td.addTileDraw(gf.addTile(tiles));
				td.scoreDraw(gf.score);
				td.tileDraw(tiles);
			}
		}
		Key.addListener(keyListener);
    }
}
