local quads = {}
for y = 0, 80, 16 do
  for x = 0, 160, 16 do
    table.insert(quads, love.graphics.newQuad( x, y, 16, 16, 176, 96 ))
  end
end

return {
  plain = love.graphics.newImage('share/harvett_platformer_blocks_background_plain.png'),
  tiles = quads
}
