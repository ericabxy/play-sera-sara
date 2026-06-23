local platformer_blocks_background = require('gfx.platformer_blocks_background')
local unitcharmap = require('src.unitcharmap')

local background = unitcharmap:new{
  texture = platformer_blocks_background.plain,
  quads = {
    ['q'] = platformer_blocks_background.tiles[1],
    ['w'] = platformer_blocks_background.tiles[2],
    ['e'] = platformer_blocks_background.tiles[3],
    ['.'] = platformer_blocks_background.tiles[5],
    ['~'] = platformer_blocks_background.tiles[6],
    ['c'] = platformer_blocks_background.tiles[8],
    ['C'] = platformer_blocks_background.tiles[9],
    [':'] = platformer_blocks_background.tiles[10],
    ['W'] = platformer_blocks_background.tiles[19],
    ['{'] = platformer_blocks_background.tiles[20],
    ['}'] = platformer_blocks_background.tiles[21],
    ['|'] = platformer_blocks_background.tiles[22],
    ['^'] = platformer_blocks_background.tiles[14],
    ['d'] = platformer_blocks_background.tiles[32],
    ['B'] = platformer_blocks_background.tiles[33],
    ['"'] = platformer_blocks_background.tiles[26],
    ['/'] = platformer_blocks_background.tiles[25],
    ['\\'] = platformer_blocks_background.tiles[27],
    ['D'] = platformer_blocks_background.tiles[44],
    ['`'] = platformer_blocks_background.tiles[37],
    ['\''] = platformer_blocks_background.tiles[39],
    ['b'] = platformer_blocks_background.tiles[49],
    ['n'] = platformer_blocks_background.tiles[50],
    ['m'] = platformer_blocks_background.tiles[51],
  }
}

function background:set_plain()
  self.texture = platformer_blocks_background.plain
end

function background:set_castle()
  self.texture = platformer_blocks_background.castle
end

function background:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return background
