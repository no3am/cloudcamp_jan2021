import urllib.request
import requests
import js2py
from datetime import datetime

url = 'http://localhost:5000'
page = urllib.request.urlopen(url)
assert page.code == 200
page_content = requests.get(url).content.decode("utf-8")
print(page_content)
js = page_content.split("<script>")[1].strip().replace("</script>", "").replace('document.getElementById("date").innerHTML =', "return ")
web_page_date_string = js2py.eval_js(js)
current_date = datetime.today().strftime("%-m/%-d/%Y")
assert web_page_date_string == current_date
print("Webapp is healthy !")