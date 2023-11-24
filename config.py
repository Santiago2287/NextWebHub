from flask import Flask
from flask_mail import Mail, Message

class Config:
    SECRET_KEY='rhkjhrkjhgxytfuowdshoichvsiygrfuhruighuirgfukrsrygfegru'
    MAIL_SERVER = 'smtp.gmail.com'
    MAIL_PORT = 587
    MAIL_USE_TLS = True
    MAIL_USE_SSL = False
    MAIL_USERNAME = 'santiago.robles1665@alumnos.udg.mx'
    MAIL_PASSWORD = 'hxpxvifukekgkzgw'
    MAIL_DEFAULT_SENDER = 'santiago.robles1665@alumnos.udg.mx'
    MAIL_ASCII_ATTACHMENTS = True
    
    app = Flask(__name__)  # Instancia de Flask
    mail = Mail(app)  # Instancia de Flask-Mail

    
class DevelopmentConfig(Config):
    DEBUG           = True
    MYSQL_HOST      ='localhost'
    MYSQL_USER      ='root'
    MYSQL_PASSWORD  =''
    MYSQL_DB        ='netxwebhub'
 
config={
    'development': DevelopmentConfig
}