import os
import string
from  dotenv  import  load_dotenv 
import boto3

load_dotenv()   
def uploadFile(fileName:string):
    s3Url=os.getenv('AWS_S3_URL')

    s3 = boto3.client("s3")
    s3.upload_file(
        Filename="./myImg.png",
        Bucket="i-note-you-s3",
        Key='cloudwords/{fileName}'.format(fileName = fileName+'.png'),
        ExtraArgs={'ContentType': 'image/png'}
    )
    return '{0}/cloudwords/{1}'.format(s3Url,fileName+'.png')
