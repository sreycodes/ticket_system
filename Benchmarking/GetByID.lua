local headers = {}
headers["x-access-token"] = "token"
headers["Content-Type"] = "application/x-www-form-urlencoded"

local path = {'GET', '/tickets?id=', headers}
local num = 8000

request = function()
  
  url_path = path[2] .. tostring(math.random(num))

  -- Return the request object with the current URL path
  return wrk.format(path[1], url_path, path[3])
end