local platformer_blocks_background = require('gfx.platformer_blocks_background')
local unitcharmap = require('src.unitcharmap')

local background = unitcharmap:new{
  texture = platformer_blocks_background.plain,
  quads = {
    ['q'] = platformer_blocks_background.tiles[1],
    ['w'] = platformer_blocks_background.tiles[2],
    ['e'] = platformer_blocks_background.tiles[3],
    ['.'] = platformer_blocks_background.tiles[12],
    ['^'] = platformer_blocks_background.tiles[24],
    ['"'] = platformer_blocks_background.tiles[35],
    ['/'] = platformer_blocks_background.tiles[34],
    ['\\'] = platformer_blocks_background.tiles[36],
    ['`'] = platformer_blocks_background.tiles[45],
    ['\''] = platformer_blocks_background.tiles[47],
    ['b'] = platformer_blocks_background.tiles[56],
    ['n'] = platformer_blocks_background.tiles[57],
    ['m'] = platformer_blocks_background.tiles[58],
  }
}

function background:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return background
