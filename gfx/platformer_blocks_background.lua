local quads = {}
for y = 0, 64, 16 do
  for x = 0, 176, 16 do
    table.insert(quads, love.graphics.newQuad( x, y, 16, 16, 192, 80 ))
  end
end

return {
  plain = love.graphics.newImage('share/harvett_platformer_blocks_background_plain.png'),
  --underground
  castle = love.graphics.newImage('share/harvett_platformer_blocks_background_castle.png'),
  tiles = quads
}
