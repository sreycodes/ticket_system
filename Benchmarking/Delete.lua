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

local path = {'DELETE', '/tickets/', headers}
local num = 8000

request = function()

  url_path = path[2] .. tostring(math.random(num))
  
  -- Return the request object with the current URL path
  return wrk.format(path[1], url_path, path[3], body)
end