class Config:
    SECRET_KEY='rhkjhrkjhgxytfuowdshoichvsiygrfuhruighuirgfukrsrygfegru'
    
class DevelopmentConfig(Config):
    DEBUG           = True
    MYSQL_HOST      ='localhost'
    MYSQL_USER      ='root'
    MYSQL_PASSWORD  ='mysql'
    MYSQL_DB        ='netxwebhub'
 
config={
    'development': DevelopmentConfig
}