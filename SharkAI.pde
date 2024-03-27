class SharkAI
{
  // Instantiate the shark AI's position and velocity vectors, and add floats for the width and height of the shark AI
  PVector position = new PVector();
  PVector velocity = new PVector();
  
  float sharkWidth;
  float sharkHeight;
  
  // Initialize shark AI position and velocity vectors, as well as the width and height of the shark
  SharkAI(PVector position_, PVector velocity_)
  {
    position = position_;
    velocity = velocity_;
    
    sharkWidth = 70;
    sharkHeight = 60;
  }
  
  // Draw the shark to the screen
  void drawSharkAI()
  {
    // Draw the body of the shark AI
    stroke(0);
    fill(random(0, 255));
    triangle(position.x + 10, position.y, position.x + 10, position.y + 40, position.x - 20, position.y + 20);
    ellipse(position.x - 50, position.y + 20, sharkWidth, sharkHeight);
    
    // Draw the shark AI's eyes
    noStroke();
    fill(random(0, 255));
    ellipse(position.x - 70, position.y + 10, 5, 5);
  }
  
  // Update the shark's position to eat the player
  void updateSharkAI()
  {
    position.x -= velocity.x; // The shark will move to the left as the game progresses
    position.y += velocity.y;
    
    // If the shark AI's x position is equal to or is below 0, then place the shark AI at the right side of the screen (it will be randomized for both x and y positions)
    if(position.x <= 0)
    {
      position.x = random(900, 1500);
      position.y = random(70, 330);
    }
  }
}
