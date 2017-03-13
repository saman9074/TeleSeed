antieng = {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then -- Ignore mods,owner,admins
    return
  end
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]['settings']['lock_eng'] then
    if data[tostring(msg.to.id)]['settings']['lock_eng'] == 'yes' then
      if antieng[msg.from.id] == true then 
        return
      end
      send_large_msg("chat#id".. msg.to.id , "English is not allowed here")
      local name = user_print_name(msg.from)
      savelog(msg.to.id, name.." ["..msg.from.id.."] kicked (English was locked) ")
      chat_del_user('chat#id'..msg.to.id,'user#id'..msg.from.id,ok_cb,false)
		  antieng[msg.from.id] = true
      return
    end
  end
  return
end
local function cron()
  antieng = {} -- Clear antiarabic table 
end
return {
    patterns = {
    "(a)",
	"(o)",
	"(l)",
	"(A)",
	"(O)",
	"(L)",
	"(M)",
	"(e)",
	"(E)",
	"(i)",
	"(I)",
	"(u)",
	"(U)",
	"(m)",
	"(B)",
	"(b)",
	"(T)",
 	"(t)",
	"(J)",
	"(j)",	
	"(K)",
	"(F)",
	"(f)",
	"(N)",
	"(n)",
	"(z)",
	"(Z)",
	"(X)",		
	"(x)",
	"(Y)"		
    },
  run = run,
	cron = cron
}
end
