local headers = {}
headers["x-access-token"] = "token"
headers["Content-Type"] = "application/x-www-form-urlencoded"

local path = {'GET', '/', headers}

request = function()
  -- Return the request object with the current URL path
    return wrk.format(path[1], path[2], path[3])
end