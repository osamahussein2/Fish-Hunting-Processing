class Collision
{
  // Nothing goes in this constructor because there's no variables here
  Collision()
  {
    
  }
  
  // If the player collides with another fish (AI controlled), then the player will eat the fish and that fish will reset its position randomly
  boolean playerCollidedWithFishAI()
  {
    /* This site is the inspiration I used to check collisions between fishes: https://openprocessing.org/sketch/84478/
    (this site above didn't work properly for me, but at least it gave me a starting point to get the collisions working) */
    
    // I found circle-circle collision here that I used inside the for loop below: https://dkessner.github.io/ProcessingExamples/circleCollisionDetection/
    
    // Loop the collision between player and fish AI to increase the player's score by 1 each time the player eats a fish
    for (int number = 0; number < fishAI.length; number++)
    {
      // If the distance between the player and fish AI is less than both the radius of the player and fish AI, then they collided and returns true
      if (dist(playerFish.position.x, playerFish.position.y, fishAI[number].position.x, fishAI[number].position.y) < ((playerFish.playerWidth / 2) + (fishAI[number].aiFishWidth / 2)))
      {
        // Reset the AI fishes positions
        fishAI[number].position.x = random(400, 800);
        fishAI[number].position.y = random(70, 330);
        
        // Increase the player score by 1 for every fish the player ate
        playerFish.score += 1;
        return true;
      }
    }
    
    // Otherwise, there's no collision
    return false;
  }
  
  // If the player collides with a shark (AI controlled), then the game will reset and the player's score will reset to 0
  boolean playerCollidedWithSharkAI()
  {
    // I found circle-circle collision here that I used inside the for loop below: https://dkessner.github.io/ProcessingExamples/circleCollisionDetection/
    
    // Loop the collision between player and shark AI to reset the game entirely
    for (int number = 0; number < sharkAI.length; number++)
    {
      // If the distance between the player and shark is less than both the radius of the player and shark AI, then they collided and returns true
      if (dist(playerFish.position.x, playerFish.position.y, sharkAI[number].position.x, sharkAI[number].position.y) < ((playerFish.playerWidth / 2) + (sharkAI[number].sharkWidth / 2)))
      {
        resetGame(); // Reset the game upon collision
        return true;
      }
    }
    
    // Otherwise, there's no collision
    return false;
  }
  
  // The player fish, AI fishes and the sharks' positions will be reset once the game resets and the player's score will also reset to 0
  void resetGame()
  {
    playerFish.position.x = 20;
    playerFish.position.y = 180;
    
    for (int number = 0; number < fishAI.length; number++)
    {
      fishAI[number].position.x = random(400, 800);
      fishAI[number].position.y = random(70, 330);
    }
    
    for (int number = 0; number < sharkAI.length; number++)
    {
      sharkAI[number].position.x = random(900, 1500);
      sharkAI[number].position.y = random(70, 330);
    }
    
    playerFish.score = 0;
  }
}
