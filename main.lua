
function love.load()
  player = {}
  player.x = 0
  player.bullets = {}
  player.cooldown = 20
  player.shoot = function()
  if player.cooldown <= 0 then
    player.cooldown = 20
    bullet = {}
    bullet.x = player.x + 35
    bullet.y = 400
    table.insert(player.bullets, bullet)
  end
end


--   y = 0
end

function love.update(dt)
player.cooldown = player.cooldown -1
if love.keyboard.isDown("right") then
  player.x = player.x + 1
elseif love.keyboard.isDown("left") then
  player.x = player.x - 1
  --	elseif love.keyboard.isDown("up") then
    --		y = y - 1
    --	elseif love.keyboard.isDown("down") then
      --		y = y + 1
    end
    if love.keyboard.isDown(" ") then
      player.shoot()
    end
    for i,v in ipairs(player.bullets) do
      if v.y < -10 then
        table.remove(player.bullets, i)
      end
      v.y = v.y - 10
    end
  end

  function love.draw()
    love.graphics.setColor(100, 0, 190)
    love.graphics.rectangle("fill", player.x, 400, 80, 20)
    speed = .11 + player.x - .33
    for _,v in pairs(player.bullets) do
      love.graphics.setColor(255, 165, 0)
      love.graphics.rectangle("fill", v.x, v.y, 10, 10)
    end
  end
