require "movieclip"

bee = {}

bee.changeImage = function()
	--self.count = self.count + 1
	--print(self.count)
    --if (math.modf(self.count, 30)) then
    	-- self.imageNumber = self.imageNumber + 1
    	-- self.image:removeSelf()
    	-- self.image = display.newImage("images/bee_"..self.imageNumber..".png",self.x,self.y)
    	--if self.imageNumber <= 2 then self.imageNumber = self.imageNumber +1
    	--elseif self.imageNumber = 1
    	--end 
    --end
end

function bee:new(display)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    self.image = display.newImage("images/bee_1.png")
    self.y = 0
    self.x = math.random(self.image.width,display.contentWidth-(self.image.width/2))
    self.image.x = self.x
    self.image.y = self.y
    
    self.speed = math.random(2,5)
    
    
    self.count = 0
    self.imageNumber = 1
    
    return bee
end

function bee:draw(display,self)
	self.changeImage()
	
    self.image.y = self.image.y + self.speed
    self.y = self.image.y
    
end