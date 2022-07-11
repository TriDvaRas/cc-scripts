-- ! requires json parser! pastebin get 4nRg9CHU json
os.loadAPI("json")
local str = http.get("http://castlots.org/generator-anekdotov-online/generate.php").readAll()
local obj = json.decode(str)
local value = obj.va
local monitor = peripheral.wrap("top")
monitor.write(value)
