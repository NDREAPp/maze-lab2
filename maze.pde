int cols, rows;
int w = 40;
int playerX = 0;
int playerY = 0;
int exitX = 9;
int exitY = 9;
boolean gameOver = false;

int[][] grid = {
  {0, 1, 0, 0, 0, 1, 1, 1, 1, 1},
  {0, 1, 1, 1, 0, 0, 0, 0, 0, 1},
  {0, 0, 0, 1, 1, 1, 1, 1, 0, 1},
  {1, 1, 0, 0, 0, 0, 0, 1, 0, 0},
  {1, 0, 0, 1, 0, 1, 0, 1, 1, 1},
  {1, 1, 1, 1, 0, 1, 0, 0, 0, 1},
  {1, 0, 0, 0, 0, 1, 1, 1, 0, 1},
  {1, 1, 1, 1, 0, 0, 0, 1, 0, 0},
  {0, 0, 0, 1, 1, 1, 1, 1, 1, 1},
  {1, 1, 0, 0, 0, 0, 0, 0, 0, 0}
};

void setup() {
  size(400, 400);
  cols = width / w;
  rows = height / w;
}

void draw() {
  background(255);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 1) {
        fill(0);
        rect(i*w, j*w, w, w);
      }
    }
  }

  fill(255, 0, 0);
  ellipse(playerX*w + w/2, playerY*w + w/2, w, w);

  if (gameOver) {
    textSize(32);
    fill(0, 255, 0);
    textAlign(CENTER, CENTER);
    text("¡Ganaste!", width/2, height/2);
  }
}

void keyPressed() {
  int nextX = playerX;
  int nextY = playerY;

  if (keyCode == UP) {
    nextY--;
  } else if (keyCode == DOWN) {
    nextY++;
  } else if (keyCode == LEFT) {
    nextX--;
  } else if (keyCode == RIGHT) {
    nextX++;
  }

  if (nextX >= 0 && nextX < cols && nextY >= 0 && nextY < rows && grid[nextX][nextY] == 0) {
    playerX = nextX;
    playerY = nextY;
  }

  if (playerX == exitX && playerY == exitY) {
    gameOver = true;
  }
}
