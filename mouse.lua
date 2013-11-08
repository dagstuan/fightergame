require "movieclip"

mouse = {
  image = nil, -- see note below
  name = nil
}

function mouse.Create(display)
  -- first make a copy of the master object
  local self = {}
  -- then set fields
  self.image = movieclip.newAnim{"images/mouse_1.png", "images/mouse_2.png"}
  self.image.x = math.random(self.image.width,display.contentWidth-(self.image.width/2))
  
  self.image.x = display.contentWidth /2
  self.image.y = display.contentHeight - boulder.height / 2
  
  self.count = 0
    
  self.Draw = function(x)
      self.changeImage()
      self.image.x = x
  end
  
  self.changeImage = function()
	self.image:nextFrame()
    
  end
  
  return self 
end