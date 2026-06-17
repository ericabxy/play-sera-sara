-- @module src.unitsprite
local unitsprite = {
  texture = nil,  -- Must be initialized.
  quad = nil,  -- Must be initialized.
  xsize = 16,
  ysize = 16,
  dx = 0,
  dy = 0,
  x = 0,
  y = 0
}

local EMPTYCHAR = '.'

function unitsprite:clamp(rectangle)
  if self.x < rectangle.x then
    self.x = rectangle.x
  elseif self.x + 1 > rectangle.x + rectangle.width then
    self.x = rectangle.x + rectangle.width - 1
  end
  if self.y < rectangle.y then
    self.y = rectangle.y
  elseif self.y + 1 > rectangle.y + rectangle.height then
    self.y = rectangle.y + rectangle.height - 1
  end
end

function unitsprite:paint(xoffset, yoffset)
  xoffset, yoffset = xoffset or 0, yoffset or 0
  love.graphics.draw(
    self.texture,
    self.quad,
    math.floor((self.x - xoffset) * self.xsize),
    math.floor((self.y - yoffset) * self.ysize)
  )
end

-- Constructor.
function unitsprite:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  -- Initialization.
  return o
end

return unitsprite
