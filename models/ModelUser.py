from models.entities.User import User

class ModelUser:
    @classmethod
    def login(self, db, usuario):
        try:
            selUsuario = db.connection.cursor()
            selUsuario.execute("SELECT * FROM usuario WHERE emailu = %s", (usuario.emailu,))

            u = selUsuario.fetchone()
            if u is not None:
                return User(u[0], u[1], u[2], User.validar_clave(u[3], usuario.passwordu,), u[4])
            else:
                return None
        except Exception as error:
            raise Exception(error)

    @classmethod
    def getById(cls, db, id):
        try:
            selUsuario = db.connection.cursor()
            selUsuario.execute("SELECT * FROM usuario WHERE id = %s", (id,))
            u = selUsuario.fetchone()
            if u is not None:
                return User(u[0], u[1], u[2], u[3], u[4])
            else:
                return None
        except Exception as ex:
            raise Exception(ex)
