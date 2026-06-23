return {
  texture = love.graphics.newImage('share/grafxkid_old_hero.png'),
  idle = {
    love.graphics.newQuad(16, 16, 16, 16, 128, 112),
    love.graphics.newQuad(32, 16, 16, 16, 128, 112),
    love.graphics.newQuad(48, 16, 16, 16, 128, 112),
    love.graphics.newQuad(64, 16, 16, 16, 128, 112)
  },
  movement = {
    love.graphics.newQuad(16, 32, 16, 16, 128, 112),
    love.graphics.newQuad(32, 32, 16, 16, 128, 112),
    love.graphics.newQuad(48, 32, 16, 16, 128, 112),
    love.graphics.newQuad(64, 32, 16, 16, 128, 112),
    love.graphics.newQuad(80, 32, 16, 16, 128, 112),
    love.graphics.newQuad(96, 32, 16, 16, 128, 112),
  },
  jump = {
    love.graphics.newQuad(16, 48, 16, 16, 128, 112),
    love.graphics.newQuad(32, 48, 16, 16, 128, 112),
  }
}
