--- Class to manage the "jump" ability.
-- @module src.jump
local jump = {
  button_held = false,
  on_ground = false,
}

function jump:is_held()
  return self.button_held
end

function jump:is_jumping()
  return not self.on_ground
end

-- Constructor.
function jump:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return jump
