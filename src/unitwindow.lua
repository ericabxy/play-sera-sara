--- @module src.window
-- A single view of the game world or submenus.
local window = {
  xoffset = 0,
  yoffset = 0,
}

function window:paint_objects(t)
  for _, o in ipairs(t) do
    o:paint(-self.xorigin, -self.yorigin)
  end
end

function window:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return window
