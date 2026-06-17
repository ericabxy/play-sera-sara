local platformer_blocks_background = require('gfx.platformer_blocks_background')
local unitcharmap = require('src.unitcharmap')

local background = unitcharmap:new{
  texture = platformer_blocks_background.plain,
  quads = {
    ['q'] = platformer_blocks_background.tiles[1],
    ['w'] = platformer_blocks_background.tiles[2],
    ['e'] = platformer_blocks_background.tiles[3],
    ['~'] = platformer_blocks_background.tiles[6],
    ['c'] = platformer_blocks_background.tiles[7],
    ['C'] = platformer_blocks_background.tiles[8],
    [':'] = platformer_blocks_background.tiles[9],
    ['.'] = platformer_blocks_background.tiles[12],
    ['W'] = platformer_blocks_background.tiles[17],
    ['{'] = platformer_blocks_background.tiles[18],
    ['}'] = platformer_blocks_background.tiles[19],
    ['|'] = platformer_blocks_background.tiles[20],
    ['^'] = platformer_blocks_background.tiles[24],
    ['d'] = platformer_blocks_background.tiles[29],
    ['B'] = platformer_blocks_background.tiles[30],
    ['"'] = platformer_blocks_background.tiles[35],
    ['/'] = platformer_blocks_background.tiles[34],
    ['\\'] = platformer_blocks_background.tiles[36],
    ['D'] = platformer_blocks_background.tiles[40],
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
