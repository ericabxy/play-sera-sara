return {
  texture = love.graphics.newImage('share/nyntunkocom55_simplesara.png'),
  idle = {
    love.graphics.newQuad(0, 0, 16, 16, 96, 32),
    love.graphics.newQuad(0, 16, 16, 16, 96, 32),
  },
  runjump = {
    love.graphics.newQuad(16, 0, 16, 16, 96, 32),
    love.graphics.newQuad(16, 16, 16, 16, 96, 32),
  },
  runatk = {
    love.graphics.newQuad(32, 0, 16, 16, 96, 32),
    love.graphics.newQuad(32, 16, 16, 16, 96, 32),
  }
}
