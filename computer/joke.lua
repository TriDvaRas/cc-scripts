
local monitor = peripheral.wrap("top")


local str = http.post("http://castlots.org/generator-anekdotov-online/generate.php", '{}',
    {
        ["accept"] = "application/json, text/javascript, */*; q=0.01",
        ["accept-language"] = "ru-RU,ru;q=0.9,en-US;q=0.8,en;q=0.7,uk;q=0.6,ja;q=0.5",
        ["sec-fetch-dest"] = "empty",
        ["sec-fetch-mode"] = "cors",
        ["sec-fetch-site"] = "same-origin",
        ["x-requested-with"] = "XMLHttpRequest",
        ["cookie"] = "_ga=GA1.2.495309840.1600029536; _gid=GA1.2.487757344.1600029536; _ym_d=1600029536; _ym_uid=1600029536819948754; _ym_isad=1; _gat=1; _ym_visorc_29162025=w; _ym_visorc_26812653=b"
    }).readAll()
print(str)
local obj = textutils.unserializeJSON(str)
local value = obj.va
print(value)
monitor.write(value)
