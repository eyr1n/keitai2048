class GameFunc{
	var mc:MovieClip;
	var score;
	var i, j;

	public function GameFunc(target) {
		mc = target;
		score = 0;
	}
	
	public function addTile(tiles):Array {
		var count = 0;
		var zeroTiles = new Array();
		zeroTiles[0] = new Array();
		zeroTiles[1] = new Array();
		
		for (i = 0; i < 4; i++ ){
			for (j = 0; j < 4; j++ ){
				if (tiles[i][j] == 0) {
					zeroTiles[0][count] = i;
					zeroTiles[1][count] = j;
					count++;
				}
			}
		}
		var tilePos = Math.floor( Math.random() * count );
		tiles[zeroTiles[0][tilePos]][zeroTiles[1][tilePos]] = Math.random() < 0.9 ? 2 : 4;
		var pos = new Array();
		pos[0] = zeroTiles[1][tilePos];
		pos[1] = zeroTiles[0][tilePos];
		return pos;
	}
	
	public function canMoveTile(tiles, dir):Boolean {
		var flag = false;
		for (i = 0; i < 4; i++) {
			for (j = 0; j < 3; j++) {
				switch(dir) {
					case 0:
						if ((tiles[j][i] == 0 && tiles[j + 1][i] != 0) || (tiles[j][i] == tiles[j + 1][i] && tiles[j][i] != 0)) {
							flag = true;
							j = 2;
							i = 3;
						}
						break;
						
					case 1:
						if ((tiles[j + 1][i] == 0 && tiles[j][i] != 0) || (tiles[j][i] == tiles[j + 1][i] && tiles[j][i] != 0)) {
							flag = true;
							j = 2;
							i = 3;
						}
						break;
						
					case 2:
						if ((tiles[i][j] == 0 && tiles[i][j + 1] != 0) || (tiles[i][j] == tiles[i][j+1] && tiles[i][j] != 0)){
							flag = true;
							j = 2;
							i = 3;
						}
						break;
						
					case 3:
						if ((tiles[i][j + 1] == 0 && tiles[i][j] != 0 ) || (tiles[i][j] == tiles[i][j+1] && tiles[i][j] != 0)) {
							flag = true;
							j = 2;
							i = 3;
						}
						break;
				}
			}
		}
		return flag;
	}
	
	public function sumTile(tiles, dir):Void {
		for (i = 0; i < 4; i++ ){
			for (j = 0; j < 3; j++){
				switch (dir){
					case 0:
						if (tiles[j][i] == tiles[j+1][i]){
							tiles[j][i] += tiles[j+1][i];
							score += tiles[j][i];
							tiles[j+1][i] = 0;
							j++;
						}
						break;
						
					case 1:
						if (tiles[3-j][i] == tiles[2-j][i]){
							tiles[3-j][i] += tiles[2-j][i];
							score += tiles[3-j][i];
							tiles[2-j][i] = 0;
							j++;
						}
						break;
						
					case 2:
						if (tiles[i][j] == tiles[i][j+1]){
							tiles[i][j] += tiles[i][j+1];
							score += tiles[i][j];
							tiles[i][j+1] = 0;
							j++;
						}
						break;
						
					case 3:
						if (tiles[i][3-j] == tiles[i][2-j]){
							tiles[i][3-j] += tiles[i][2-j];
							score += tiles[i][3-j];
							tiles[i][2-j] = 0;
							j++;
						}
						break;
				}
			}
		}
		moveTile(tiles, dir);
	}
	
	public function moveTile(tiles, dir):Void {
		var line;
		var zero;
		var tmp = new Array();
		
		for (line = 0; line < 4; line++ ){
			j = 0;
			zero = 0;
			switch(dir) {
				case 0:
					for (i = 0; i < 4; i++){
						if (tiles[i][line] == 0) zero++;
					}
					
					for (i = 0; i < 4; i++ ){
						if (tiles[i][line] != 0) {
							tmp[j] = tiles[i][line];
							j++;
						}
					}
					
					for (i = 0; i < 4-zero; i++ ){
						tiles[i][line] = tmp[i];
					}
					
					for (i = 0; i < zero; i++ ){
						tiles[4-zero + i][line] = 0;
					}
					break;
				
				case 1:
					for (i = 0; i < 4; i++){
						if (tiles[i][line] == 0) zero++;
					}
					
					for (i = 0; i < 4; i++ ){
						if (tiles[i][line] != 0) {
							tmp[j] = tiles[i][line];
							j++;
						}
					}
					
					for (i = 0; i < zero; i++ ){
						tiles[i][line] = 0;
					}
					
					for (i = 0; i < 4-zero; i++ ){
						tiles[zero + i][line] = tmp[i];
					}
					break;
				
				case 2:
					for (i = 0; i < 4; i++){
						if (tiles[line][i] == 0) zero++;
					}
					
					for (i = 0; i < 4; i++ ){
						if (tiles[line][i] != 0) {
							tmp[j] = tiles[line][i];
							j++;
						}
					}
					
					for (i = 0; i < 4-zero; i++ ){
						tiles[line][i] = tmp[i];
					}
					
					for (i = 0; i < zero; i++ ){
						tiles[line][4-zero + i] = 0;
					}
					break;
				
				case 3:
					for (i = 0; i < 4; i++){
						if (tiles[line][i] == 0) zero++;
					}
					
					for (i = 0; i < 4; i++ ){
						if (tiles[line][i] != 0) {
							tmp[j] = tiles[line][i];
							j++;
						}
					}
					
					for (i = 0; i < zero; i++ ){
						tiles[line][i] = 0;
					}
					
					for (i = 0; i < 4-zero; i++ ){
						tiles[line][zero + i] = tmp[i];
					}
					break;
			}
		}
	}
}
