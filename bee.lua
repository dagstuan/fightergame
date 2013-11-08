bee = {
  image = nil, -- see note below
  name = nil
}

function bee.Create(display)
  -- first make a copy of the master object
  local self = {}
  -- then set fields
  self.image = display.newImage("images/bee_1.png")
  self.image.x = 20
  self.image.y = 20
  
  self.Draw = function()
      self.image.x = self.image.x + 1
  end
  
  return self 
end