import string

from urllib3 import Retry
import s3
import pandas as pd
from wordcloud import WordCloud , STOPWORDS 
import jieba
from matplotlib import pyplot as plt       #繪圖，數據可視化
import matplotlib
from PIL import Image                      #圖片處理
import numpy as np                         #矩陣運算
from collections import Counter
import sys,os
os.chdir(sys.path[0])
from pylab import mpl
mpl.rcParams['font.sans-serif'] = ['Microsoft YaHei']  
mpl.rcParams['axes.unicode_minus'] = False



input_path='test.txt'
stopwords_path='stopwords.txt'


# # 設定停用詞
print('start read stopwords data.')
stopwords = []
with open(stopwords_path, 'r', encoding='utf-8') as f:
    for line in f:
        if len(line)>0:
            stopwords.append(line.strip())
print(len(stopwords))
#分詞
def tokenizer(s):
    words = []
    cut = jieba.cut(s)
    for word in cut:
        if word not in stopwords:
            if (word not in ['\n','\t',' ','\uf06c','\uf06e']):
                words.append(word)
    return words

def createCloudWord(text:string,fileName:string):
    # text = open(input_path,mode='r',encoding='utf-8').read()
    print(text)
    words=list(tokenizer(text))
    tongji = Counter(words).most_common(10)
    tongji.reverse()
    d = {key: value for (key, value) in tongji} 
    print(d)

    label = list(d.keys())
    y = list(d.values())
    idx = np.arange(len(y))
    new_data = {'word':label,'times':y}
    print(new_data)
    df = pd.DataFrame.from_dict(new_data)

    #長條圖
    # fig = plt.figure(figsize=(9,6))
    # ax = plt.subplot(111)
    # ax.spines['top'].set_visible(False)
    # ax.spines['right'].set_visible(False)
    # ret = ax.barh(df['word'],df['times'],color='#99ccff')
    # ret[9].set_color('#404040')
    # ax.xaxis.grid(linestyle='--',linewidth=0.5)
    # for pY,pX in enumerate(df.times):
    #     if(pY==9):
    #         ax.annotate("{:,}".format(pX),xy=(pX+0.1,pY),fontstyle='oblique',va='center',fontweight='bold')
    #     ax.annotate("{:,}".format(pX),xy=(pX+0.1,pY),fontstyle='oblique',va='center')
    # for pos in ['top','right','left','bottom']:
    #     ax.spines[pos].set_linewidth(0.5)
    #     ax.spines[pos].set_color('gray')
    # ax.set_xlim(0,df.times.max()*1.2)
    # plt.suptitle('筆記詞頻圖', fontsize=18)
    # plt.title('I Note You', fontsize=12,)
    # plt.xlabel('出現次數',labelpad = 3)
    # plt.savefig('輸出詞頻圖示')



    #製造文字雲
    img = Image.open(r'./tree.jpg')
    img_array= np.array(img)

    wc = WordCloud(
        background_color='black',
        mask=img_array,
        font_path="msyh.ttc",
        stopwords=stopwords,
        height=600,
        width=400
    )
    cut = jieba.cut(text)
    string = ' '.join(cut)
    wc.generate_from_text(string)
    wc.to_file('myImg.png')
    # return s3.uploadFile(fileName)
    return d

