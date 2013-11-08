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
  self.image.y = display.contentHeight - self.image.height / 2
  self.display = display
  self.count = 0
    
  self.Move = function(left)
  	local img = self.image
  	if (left) then
  			self.image.xScale = 1
            if (img.x < self.display.contentWidth - img.width / 2) then
                img.x = img.x + 15
                
            end
        else
        	self.image.xScale = -1
            if (img.x > img.width / 2) then
                img.x = img.x - 15
            end
        end
        self.changeImage()
  end
  
  self.changeImage = function()
	self.image:nextFrame()
    
  end
  
  return self 
end