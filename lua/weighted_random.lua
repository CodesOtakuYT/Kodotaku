-- Takes a dictionnary of chances or weights, and then returns a random item from them where Dict(key=Item, value=Chance)
-- Algorithm source: https://stackoverflow.com/questions/1761626/weighted-random-numbers

local function weighted_random(weights)
        local sum = 0        
        
        for k, v in pairs(weights) do
                sum = sum + v                
        end     
        
        local rnd = math.random(0, sum)
        for k, v in pairs(weights) do
                if rnd < v then
                        return k
                end     
                rnd = rnd - v  
        end
        error("Something went wrong!")
end

local ItemRarity = { 
        Item1 = 25,
        Item2 = 50,
        Item3 = 10,
}       

local item = weighted_random(ItemRarity)
print("The item selected is", item)
