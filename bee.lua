require "movieclip"

bee = {
  image = nil, -- see note below
  name = nil
}

function bee.Create(display)
  -- first make a copy of the master object
  local self = {}
  -- then set fields
  self.image = movieclip.newAnim{"images/bee_1.png", "images/bee_2.png" , "images/bee_3.png"}
  self.image.x = math.random(self.image.width,display.contentWidth-(self.image.width/2))
  
  self.speed = math.random(2,5)
  self.count = 0
    
  self.Draw = function()
      self.changeImage()
      self.image.y = self.image.y + self.speed
  end
  
  self.changeImage = function()
      self.image:nextFrame()
  end
  
  return self 
end