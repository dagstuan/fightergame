bee = {}

function bee:new(display)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self
    self.image = display.newImage("images/bee_1.png")
    self.image.x = 20
    self.image.y = 20
    
    return bee
end

function bee:draw(self)
    self.image.x = self.image.x + 1
end