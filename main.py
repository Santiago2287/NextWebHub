from flask  import Flask, redirect, render_template, request, url_for, template_rendered, flash
from datetime import datetime
from flask_mysqldb import MySQL
from config import config
from werkzeug.security import generate_password_hash
from models.ModelUser import ModelUser
from models.entities.User import User
from flask_login import LoginManager, login_user, logout_user


app = Flask(__name__)

db = MySQL(app)
login_Manager_app= LoginManager(app)
login_Manager_app.init_app(app)

@login_Manager_app.user_loader
def load_user(user_id):
    # Aquí debes cargar y devolver un objeto de usuario basado en user_id.
    # Asegúrate de devolver None si el usuario no existe.
    # Ejemplo:
    return User.query.get(int(user_id))

# Context processor
@app.context_processor
def date_now():
    return {
        'now': datetime.utcnow()
    }
# Endpoints
@app.route('/')
def index():
    return render_template('home.html')

@app.route('/about-the-proyect')
def about():
    return render_template('about.html')

@app.route('/sign_up', methods=['GET', 'POST'])
def sign_up():
    if request.method =='POST':
        regUsuario = db.connection.cursor()
        nameu= request.form['nameu']
        emailu= request.form['emailu']
        passwordu= request.form['passwordu']
        passwordCifrada=generate_password_hash(passwordu)
        #Consulta sql
    
        regUsuario.execute("INSERT INTO usuario (nameu, emailu, passwordu) VALUES (%s, %s, %s)", (nameu,emailu, passwordCifrada ))
        db.connection.commit()
        flash('Se a creado el usuario correctamente')
        return redirect(url_for('index'))
    else:
        return render_template('sign-up.html')
    return render_template('sign-up.html')


@app.route('/log_in', methods=['GET','POST'])
def log_in():
    if request.method=='POST':
        usuario = User(0, None, request.form['emailu'], request.form['passwordu'], None)
        usuarioAut = ModelUser.login(db, usuario)
        if usuarioAut is not None:             
            if usuarioAut.passwordu:
                login_user(usuarioAut)
                if usuarioAut.perfilu == 'C':
                    return render_template('about.html')
                else: 
                    return render_template('admin.html')
            else:
                flash('Usuario o contraseña incorrecta')
                return redirect(request.url)
            
        else:
            flash('El usuario no existe')
            return redirect(request.url)
    else:
        return render_template('log-in.html')

@app.route('/password')
def password():
    return render_template('Password.html')



app.route('/informacion')
@app.route('/informacion/<string:nombre>')
@app.route('/informacion/<string:nombre>/<string:apellido>')
def informacion(nombre = None, apellido= None):
    texto=""
    if nombre !=None and apellido!=None:
        texto = f"<h1>de {nombre}, {apellido}</h1>"
        
    
    return f"<h1>Informacion {texto}</h1>"



if __name__=="__main__":
    app.config.from_object(config['development'])
    app.run(debug = True)
    



