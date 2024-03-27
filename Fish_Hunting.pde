// Fish Hunting by Osama Hussein

// Warning: all the colors that change on the screen are going to hurt your eyes!!!

// Instantiate the top water rectangle vector, and add floats for the width and height of the top water rectangle
PVector topWaterRectangle = new PVector();

float topWaterWidth;
float topWaterHeight;

// Instantiate the class objects so that they are used to run their classes' functions inside the draw() function (as well as initializing them inside the setup() function)
PlayerFish playerFish = new PlayerFish(new PVector(20, 180), new PVector(2, 2));
FishAI[] fishAI = new FishAI[7];
SharkAI[] sharkAI = new SharkAI[3];

void setup()
{
  // Setup the window to be 400x400 pixels
  size(400, 400);
  
  // Initialize the top water rectangle x and y
  topWaterRectangle = new PVector(0, 0);
  
  // Initialize the top water width to 400, and the height to 40
  topWaterWidth = 400;
  topWaterHeight = 40;
  
  // Initialize the fish AI class object array
  for (int number = 0; number < fishAI.length; number++)
  {
    fishAI[number] = new FishAI(new PVector(random(400, 800), random(70, 330)), new PVector(random(2.0, 2.5), 0.0));
  }
  
  // Initialize the shark AI class object array
  for (int number = 0; number < sharkAI.length; number++)
  {
    sharkAI[number] = new SharkAI(new PVector(random(900, 1500), random(70, 330)), new PVector(random(1.0, 1.5), 0));
  }
}

void draw()
{
  // Randomize the whole background to look like a moving real-life water
  background(35, random(60, 137), random(80, 218));
  
  // Draw the top water (No fish or shark can go where the dark blue water is)
  noStroke();
  fill(15, 94, random(100, 255));
  rect(topWaterRectangle.x, topWaterRectangle.y, topWaterWidth, topWaterHeight);
  
  // This is where the class objects' functions are used
  
  // PlayerFish class functions
  
  playerFish.drawPlayerFish(); // Draw the player fish
  playerFish.drawOffLimitsBoundary(); // Draw the off-limits boundary only for the player
  playerFish.updatePlayerFish(); // Then update the player fish
  playerFish.updatePlayerScore(); // Lastly, update the player score
  
  // FishAI class functions (use for loop because of the array)
  for (int number = 0; number < fishAI.length; number++)
  {
    fishAI[number].drawFishAI(); // Draw the fish AI
    fishAI[number].updateFishAI(); // Then update the fish AI
  }
  
  // SharkAI class functions (use for loop because of the array)
  for (int number = 0; number < sharkAI.length; number++)
  {
    sharkAI[number].drawSharkAI(); // Draw the shark AI
    sharkAI[number].updateSharkAI(); // Then update the shark AI
  }
}

void keyPressed()
{
  // If the player presses the down arrow key, move the player fish down
  if (keyCode == DOWN)
  {
    playerFish.position.y = playerFish.position.y + playerFish.velocity.y;
  }
  
  // If the player presses the up arrow key, move the player fish up
  if (keyCode == UP)
  {
    playerFish.position.y = playerFish.position.y - playerFish.velocity.y;
  }
}

void keyReleased()
{
  // If the player releases the down arrow key, don't move the player fish until the player presses it again
  if (keyCode == DOWN)
  {
    playerFish.position.y = playerFish.position.y + 0;
  }
  
  // If the player releases the up arrow key, don't move the player fish until the player presses it again
  if (keyCode == UP)
  {
    playerFish.position.y = playerFish.position.y - 0;
  }
}
