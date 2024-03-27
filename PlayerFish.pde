class PlayerFish
{
  // Instantiate the player's fish position and velocity vectors, and add floats for the width and height of the player fish
  PVector position = new PVector();
  PVector velocity = new PVector();
  
  float playerWidth;
  float playerHeight;
  
  // Class object variable for collision class is needed to help update the player's score once the player eats a fish or reset the game if eaten by a shark
  Collision collision = new Collision();
  
  // The score is needed to tell the player how many fishes they ate before being eaten by the shark
  int score;
  
  // Initialize the player's position and velocity vectors, as well as the width and the height of the player, and set the player's score to 0 at the start of the game
  PlayerFish(PVector position_, PVector velocity_)
  {
    position = position_;
    velocity = velocity_;
    
    playerWidth = 50;
    playerHeight = 40;
    
    score = 0;
    
    // The player needs to know how to play, so print these statements to the console once the game runs
    
    println("Move fish up by pressing the up arrow key");
    println("Move fish down by pressing the down arrow key");
  }
  
  // Draw the player's fish to the screen
  void drawPlayerFish()
  {
    // Draw the body of the player fish
    stroke(0);
    fill(0, random(80, 255), 0);
    triangle(position.x, position.y, position.x, position.y + 40, position.x + 30, position.y + 20);
    ellipse(position.x + 50, position.y + 20, playerWidth, playerHeight);
    
    // Draw the player fish's eyes
    noStroke();
    fill(random(0, 255));
    ellipse(position.x + 60, position.y + 10, 5, 5);
  }
  
  // Update the player's fish x position (the y position will be used when the player presses a key relating to moving the player up and down)
  void updatePlayerFish()
  {
    position.x += velocity.x; 
    
    // If the player's x position is equal to or greater than 400, then place the player back to the left side of the screen
    if(position.x >= 400)
    {
      position.x = 1;
    }
  }
  
  // Update the player's score as the player eats more fish
  void updatePlayerScore()
  {
    // Show the score at the top left of the screen, right where the top water is
    fill(255);
    textSize(20);
    text("Score: " + score, 10, 20);
    
    // Update game if collision occurs between the player and fish AI, or the player and shark AI
    collision.playerCollidedWithFishAI();
    collision.playerCollidedWithSharkAI();
  }
  
  // The player cannot swim past certain boundaries that is set in this function (it's actually not drawing the boundary to the screen but it will prevent the player from crossing that boundary)
  void drawOffLimitsBoundary()
  {
    // The player cannot move below y = 42 because that's where the top water is and the player cannot swim at the top water area
    if (position.y <= 42)
    {
      position.y = 42;
    }
    
    // The player cannot move above y = 358 because the player cannot go below the screen
    if (position.y >= 358)
    {
      position.y = 358;
    }
  }
}
