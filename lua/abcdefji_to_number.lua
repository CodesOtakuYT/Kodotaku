local function convert(text)
        local n = 0
        local byte = string.byte
        local a_byte = byte('a')
        local factor = 1

        for i = #text, 1, -1 do
                local digit = byte(text, i, i) - a_byte + 1
                -- supports abcdefghi
                assert(digit < 10 and digit > 0)
                n = n + digit*factor
                factor = factor * 10
        end

        return n
end

print(convert("faded")) --> 61454
