local platformer_blocks_foreground = require('gfx.platformer_blocks_foreground')
local unitcharmap = require('src.unitcharmap')

local foreground = unitcharmap:new{
  texture = platformer_blocks_foreground.plain,
  quads = {
    ['G'] = platformer_blocks_foreground.tiles[1],
    ['B'] = platformer_blocks_foreground.tiles[2],
    ['<'] = platformer_blocks_foreground.tiles[7],
    ['>'] = platformer_blocks_foreground.tiles[8],
    ['#'] = platformer_blocks_foreground.tiles[11],
    ['?'] = platformer_blocks_foreground.tiles[12],
    ['o'] = platformer_blocks_foreground.tiles[15],
    ['*'] = platformer_blocks_foreground.tiles[12],
    [':'] = platformer_blocks_foreground.tiles[20],
    ['.'] = platformer_blocks_foreground.tiles[25],
    ['['] = platformer_blocks_foreground.tiles[29],
    [']'] = platformer_blocks_foreground.tiles[30],
    ['|'] = platformer_blocks_foreground.tiles[42],
  }
}

function foreground:set_plain()
  self.texture = platformer_blocks_foreground.plain
end

function foreground:set_castle()
  self.texture = platformer_blocks_foreground.castle
end

function foreground:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return foreground
