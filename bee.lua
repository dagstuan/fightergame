require "movieclip"

bee = {
  image = nil, -- see note below
  name = nil
}

function bee.Create(display)
  -- first make a copy of the master object
  local self = {}
  -- then set fields
  self.image = display.newImage("images/bee_1.png")
  self.y = 0
  self.x = math.random(self.image.width,display.contentWidth-(self.image.width/2))
  self.image.x = self.x
  self.image.y = self.y
  
  self.speed = math.random(2,5)
      
  self.count = 0
  self.imageNumber = 1
  
  self.Draw = function()
      self.changeImage()
	
      self.image.y = self.image.y + self.speed
      self.y = self.image.y
  end
  
  self.changeImage = function()
	--self.count = self.count + 1
	--print(self.count)
    --if (math.modf(self.count, 30)) then
    	-- self.imageNumber = self.imageNumber + 1
    	-- self.image:removeSelf()
    	-- self.image = display.newImage("images/bee_"..self.imageNumber..".png",self.x,self.y)
    	--if self.imageNumber <= 2 then self.imageNumber = self.imageNumber +1
    	--elseif self.imageNumber = 1
    	--end 
  end
  
  return self 
end