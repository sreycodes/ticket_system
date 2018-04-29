local charset = {}  do -- [0-9a-zA-Z]
    for c = 48, 57  do table.insert(charset, string.char(c)) end
    for c = 65, 90  do table.insert(charset, string.char(c)) end
    for c = 97, 122 do table.insert(charset, string.char(c)) end
end

local function randomString(length)
    if not length or length <= 0 then return '' end
    math.randomseed(os.clock()^5)
    return randomString(length - 1) .. charset[math.random(1, #charset)]
end

local headers = {}
headers["x-access-token"] = "token"
headers["Content-Type"] = "application/x-www-form-urlencoded"

local paths = {{'GET', '/', headers},
         {'GET', '/tickets?id=', headers},
         {'POST', '/tickets/', headers},
         {'PUT', '/tickets/', headers},
         {'DELETE', '/tickets/', headers}
        }

-- Initialize the paths array iterator
local counter = 1
local num = 8000

request = function()
  -- Get the next paths array element
  url_path = paths[counter]

  if counter == 2 or counter == 4 or counter == 5 then
    URL = url_path[2] .. tostring(math.random(num))
  end

  if counter == 3 then
    num = num + 1
  end

  body = "subject=" .. randomString(20) .. "&description=" .. randomString(50) .. "&email=" .. randomString(10) .. "%40localhost"

  counter = counter + 1

  -- If the counter is longer than the paths array length then reset it
  if counter > #paths then
    counter = 1
  end

  -- Return the request object with the current URL path
  return wrk.format(url_path[1], URL, url_path[3], body)
end