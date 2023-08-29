import * as jieba from '@node-rs/jieba';
import * as fs from 'fs';
jieba.loadDict(Buffer.from(fs.readFileSync('./jieba-dictionary.txt').buffer));
export class JiebaService {
  async setStopwords() {
    const stopwords: string[] = [];
    const data = fs.readFileSync('./stopwords.txt', {
      encoding: 'utf-8',
    });
    const array = data.toString().split('\n');
    for (const word of array) {
      stopwords.push(word.replace(/\s*/g, ''));
    }

    return stopwords;
  }

  async cutWord(text: string) {
    const stopwords = await this.setStopwords();

    const usefulWords: string[] = [];
    const textArray = jieba.cut(text);
    for (const text of textArray) {
      if (
        !stopwords.includes(text) &&
        !['\n', '\t', ' ', '\uf06c', '\uf06e'].includes(text) &&
        !parseInt(text) &&
        text.length > 1
      ) {
        usefulWords.push(text);
      }
    }
    const resultArray: { keyword: string; count: number }[] = [];
    usefulWords.forEach((usefulWord) => {
      const existWord = resultArray.filter((value) => {
        return usefulWord === value.keyword;
      });
      if (existWord[0]) {
        resultArray[resultArray.indexOf(existWord[0])].count += 1;
      } else {
        resultArray.push({ keyword: usefulWord, count: 1 });
      }
    });
    return resultArray.sort((a, b) => {
      return b.count - a.count;
    });
  }
}
