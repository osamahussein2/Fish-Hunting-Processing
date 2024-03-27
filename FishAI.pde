class FishAI
{
  // Instantiate the fish AI's position and velocity vectors, and add floats for the width and height of the fish AI
  PVector position = new PVector();
  PVector velocity = new PVector();
  
  float aiFishWidth;
  float aiFishHeight;
  
  // Initialize the position and velocity vectors, as well as the width and height
  FishAI(PVector position_, PVector velocity_)
  {
    
    position = position_;
    velocity = velocity_;
    
    aiFishWidth = 50;
    aiFishHeight = 40;
  }
  
  // Draw the AI fish to the screen
  void drawFishAI()
  {
    // Draw the body of the AI fish
    stroke(0);
    fill(random(0, 255), random(0, 255), random(0, 255));
    triangle(position.x, position.y, position.x, position.y + 40, position.x - 30, position.y + 20);
    ellipse(position.x - 50, position.y + 20, aiFishWidth, aiFishHeight);
    
    // Draw the AI fish's eyes
    noStroke();
    fill(random(0, 255));
    ellipse(position.x - 60, position.y + 10, 5, 5);
  }
  
  // Update the AI fish's position for the player to eat
  void updateFishAI()
  {
    
    position.x -= velocity.x; // Make the AI fishes move to the left as game progresses
    position.y += velocity.y;
    
    // If the AI fish's x position is equal to or is below 0, then place the AI fish at the right side of the screen (it will be randomized for both x and y positions)
    if(position.x <= 0)
    {
      position.x = random(400, 800);
      position.y = random(70, 330);
    }
  }
}
