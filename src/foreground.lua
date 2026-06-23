local platformer_blocks_foreground = require('gfx.platformer_blocks_foreground')
local unitcharmap = require('src.unitcharmap')

local foreground = unitcharmap:new{
  texture = platformer_blocks_foreground.plain,
  quads = {
    ['G'] = platformer_blocks_foreground.tiles[1],
    ['B'] = platformer_blocks_foreground.tiles[2],
    ['<'] = platformer_blocks_foreground.tiles[7],
    ['>'] = platformer_blocks_foreground.tiles[8],
    ['5'] = platformer_blocks_foreground.tiles[9],
    ['1'] = platformer_blocks_foreground.tiles[10],  -- Upper horizontal pipe.
    ['#'] = platformer_blocks_foreground.tiles[11],
    ['?'] = platformer_blocks_foreground.tiles[12],
    ['o'] = platformer_blocks_foreground.tiles[15],
    ['*'] = platformer_blocks_foreground.tiles[12],
    [':'] = platformer_blocks_foreground.tiles[20],
    ['.'] = platformer_blocks_foreground.tiles[25],
    ['['] = platformer_blocks_foreground.tiles[29],
    [']'] = platformer_blocks_foreground.tiles[30],
    ['4'] = platformer_blocks_foreground.tiles[31],
    ['0'] = platformer_blocks_foreground.tiles[32],  -- Lower horizontal pipe.
    ['|'] = platformer_blocks_foreground.tiles[42],
    ['Q'] = platformer_blocks_foreground.tiles[51],  -- Upper-left vertical corner pipe.
    ['M'] = platformer_blocks_foreground.tiles[52],  -- Upper-right vertical corner pipe.
    ['P'] = platformer_blocks_foreground.tiles[53],  -- Upper-left horizontal corner pipe.
    ['L'] = platformer_blocks_foreground.tiles[54],  -- Upper-right horizontal corner pipe.
    ['I'] = platformer_blocks_foreground.tiles[73],  -- Lower-left vertical corner pipe.
    ['E'] = platformer_blocks_foreground.tiles[74],  -- Lower-right vertical corner pipe.
    ['H'] = platformer_blocks_foreground.tiles[75],  -- Lower-left horizontal corner pipe.
    ['D'] = platformer_blocks_foreground.tiles[76],  -- Lower-right horizontal corner pipe.
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
