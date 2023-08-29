import imp
from flask import Flask
import flask
from requests import request
from cloudword import createCloudWord

app = Flask(__name__)

stores = [
    {
        'name':'hello'
    }
]
text = '專題DEMO_筆記稿 課程名稱：資訊安全&網路詐騙'
@app.route('/cloudword/<string:fileName>',methods=[ 'POST'])
def main(fileName):
    data = flask.request.get_json()   
    return createCloudWord(data['content'],fileName)
    
app.run(port=5000)