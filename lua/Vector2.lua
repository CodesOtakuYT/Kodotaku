local Vec2 = {
	__metatable = true,
	ClassName = "Vec2"
}
local Vec2Metatable = {}
Vec2.__index = Vec2

function Vec2.new(x, y)
	local instance = {
		x = x,
		y = y,
	}
	
	return setmetatable(instance, Vec2)
end

function Vec2.zero()
	return Vec2.new(0, 0)
end

function Vec2.one()
	return Vec2.new(1, 1)
end

function Vec2:__index(index)
	local value = Vec2[index]
	if value then return value end
	error(string.format("%s is not a valid member of Vec2", index), 2)
end

function Vec2Metatable:__call(...)
	return self.new(...)
end

function Vec2:__newindex(index, value)
	error(string.format("%s cannot be assigned to", index), 2)
end

function Vec2:__tostring()
	return string.format("(%.1f, %.1f)", self.x, self.y)
end

function Vec2:__unm()
	return self:Unm()
end

function Vec2:__add(other)
	return self:Add(other)
end

function Vec2:__sub(other)
	return self:Sub(other)
end

function Vec2:__mul(other)
	return self:Mul(other)
end

function Vec2:__div(other)
	return self:Div(other)
end

function Vec2:__pow(other)
	return self:Pow(other)
end

function Vec2:__mod(other)
	return self:Mod(other)
end

function Vec2:__eq(other)
	return self:Eq(other)
end

function Vec2:Add(other)
	local new_x = self.x + other.x
	local new_y = self.y + other.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Sub(other)
	local new_x = self.x - other.x
	local new_y = self.y - other.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Mul(other)
	local new_x = self.x * other.x
	local new_y = self.y * other.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Div(other)
	if other.x == 0 or other.y == 0 then
		error("[VEC2] Cannot divide by zero")
	end
	local new_x = self.x / other.x
	local new_y = self.y / other.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Unm()
	local new_x = -self.x
	local new_y = -self.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Pow(other)
	local new_x = self.x ^ other.x
	local new_y = self.y ^ other.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Mod(other)
	local new_x = self.x % other.x
	local new_y = self.y % other.y
	return Vec2.new(new_x, new_y)
end

function Vec2:Eq(other)
	return self.x == other.x and self.y == other.y
end

return setmetatable(Vec2, Vec2Metatable)
