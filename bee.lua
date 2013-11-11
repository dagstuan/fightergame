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
  self.dead = false
  self.speed = math.random(2,5)
  self.count = 0
  self.display = display
  self.dir = 1
  self.moved = 1
    
  self.Draw = function()
      if (self.image ~= nil) then
          

      
                 
          
          	if(self.image.y < self.display.contentHeight-20) then
          	
          		local speed = math.random(3)
		          self.image.x = self.image.x + (self.dir * speed)
		         
		          self.moved = self.moved + speed 
				  
		          if self.moved >=40 then 
			          self.dir = self.dir * -1
			          self.moved = 0
		          end
          	
          	
          	
          		self.changeImage() 
          		self.image.y = self.image.y + self.speed
            else
                self.dead = true
                local x = self.image.x
                local y = self.image.y
            	self.removeSelf()
            	self.image = self.display.newImage("images/bee_dead.png")
            	self.image.x = x
            	self.image.y = y
            end
          
      end
  end
  
  self.changeImage = function()
      self.image:nextFrame()
  end
  
  self.getX = function()
      if (self.image ~= nil) then
          return self.image.x
      else
          return -100000
      end
  end
    
  self.getY = function()
      if (self.image ~= nil) then
          return self.image.y
      else
          return -100000
      end
  end
  
  self.removeSelf = function()
      if (self.image ~= nil) then
          self.image:removeSelf()
          self.image = nil
      end
  end
  
  return self 
end