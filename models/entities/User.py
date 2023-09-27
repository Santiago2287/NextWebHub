from werkzeug.security import check_password_hash
from flask_login import UserMixin

class User(UserMixin):
    def __init__(self, id,nameu, emailu, passwordu, perfilu):
        self.id=id
        self.nameu=nameu
        self.emailu=emailu
        self.passwordu=passwordu
        self.perfilu=perfilu
        
    @classmethod
    def validar_clave(self, claveCifrada, passwordu):
        return check_password_hash(claveCifrada, passwordu)