from flask  import Flask, make_response, redirect, render_template, request, session, url_for, template_rendered, flash
from datetime import datetime
from flask_mysqldb import MySQL
from config import config
from werkzeug.security import generate_password_hash
from models.ModelUser import ModelUser
from models.entities.User import User
from flask_login import LoginManager, login_required, login_user, logout_user
from config import Config
from flask_mail import Mail, Message

app = Flask(__name__)

#conexion a sql
db = MySQL(app)
# Configuración de la instancia Mail

mail = Mail(app)

login_Manager_app= LoginManager(app)
login_Manager_app.init_app(app)

@login_Manager_app.user_loader
def load_user(id):
    # Aquí debes cargar y devolver un objeto de usuario basado en user_id.
    # Asegúrate de devolver None si el usuario no existe.
    # Ejemplo:
    return ModelUser.getById(db, id)

# Context processor
@app.context_processor
def date_now():
    return {
        'now': datetime.utcnow()
    }
    
    
@app.context_processor
def time_now():
    current_time = datetime.utcnow()
    formatted_time = current_time.strftime("%d:%m:%y %H:%M:%S")
    return {
        'hora': formatted_time
    }

# Endpoints
@app.route('/')
def index():
    horas=time_now()
    print("hola", horas["hora"])
    return render_template('home.html')


@app.route('/setcookie', methods = ['POST', 'GET'])
def setcookie():
   if request.method == 'POST':
        user = request.form['nm']
   
        resp = make_response(render_template('readcookie.html'))
        resp.set_cookie('userID', user)
        
        return resp

@app.route('/getcookie')
def getcookie():
   name = request.cookies.get('userID')
   return '<h1>welcome '+name+'</h1>'

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
                # Crear y enviar el correo electrónico
        msg = Message('Hola', recipients=[emailu])  # Asunto y destinatario
        msg.html = render_template('UserMail.html', nombre=nameu)  # Cuerpo del correo basado en una plantilla

        # Enviar el correo electrónico
        try:
            mail.send(msg)  # mail es la instancia de Flask-Mail configurada en tu aplicación
            flash('Se ha creado el usuario correctamente y se ha enviado un correo de confirmación.', 'success')
        except Exception as e:
            flash(f'Error al enviar el correo de confirmación: {str(e)}', 'danger')

            #flash('Se a creado el usuario correctamente')
            #return redirect(url_for('index'))
    else:
        return render_template('sign-up.html')
    return render_template('sign-up.html')

@app.route('/logout')
@login_required
def logout():
    logout_user()  # Cierra la sesión del usuario actual
    return redirect(url_for('index'))  # Redirige a la vista de inicio de sesión




@app.route('/password')
def password():
    return render_template('Password.html')

@app.route('/log_in', methods=['GET', 'POST'])
def log_in():
    if request.method == 'POST':
        usuario = User(0, None, request.form['emailu'], request.form['passwordu'], None)

        usuarioAut = ModelUser.login(db, usuario)
        if usuarioAut is not None:
            if usuarioAut.passwordu:
                login_user(usuarioAut)
                if usuarioAut.perfilu == 'C':      
                    # Consulta al carrito para obtener los productos
                    selCarrito = db.connection.cursor()
                    selCarrito.execute("SELECT * FROM carrito WHERE idusuario=%s", (usuarioAut.id,))
                    carrito_data = selCarrito.fetchall()
                    selCarrito.close()
                    
                    # Almacena los productos del carrito en la variable de sesión
                    
                     # Impresiones para depuración
                    print("Datos del carrito:", carrito_data)
                    print("Contenido de la sesión antes:", session)

                    # Almacena los productos del carrito en la variable de sesión
                    session['carrito'] = carrito_data
                    
                    print("Contenido de la sesión después:", session)
                    productos = obtener_productos()
                    return render_template('usuario.html', productos=productos) 
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
    
    
def obtener_productos():
    cursor = db.connection.cursor()
    cursor.execute("SELECT * FROM producto_1")
    productos = cursor.fetchall()
    cursor.close()
    return productos



@app.route('/catalogo')
def catalogo():    
    productos = obtener_productos()
    return render_template('catalogo.html', productos=productos)

@app.route('/addtocar/<int:idproducto>/<int:precio>', methods=['GET'])
def addtocar(idproducto, precio):
    horas=time_now()
    try:
        if '_user_id' in session:
            selCarrito = db.connection.cursor()
            selCarrito.execute("SELECT * FROM carrito WHERE idproducto=%s AND idusuario=%s", (idproducto, session['_user_id'],))
            carrito = selCarrito.fetchone()
            selCarrito.close()
            print(session["_user_id"])
            print("Cosas del carrito:", carrito )

            if carrito is not None:
                idcarrito = carrito['idcarrito']
                cantidad = carrito['cantidad'] + 1
                importe = cantidad * precio
                upCarrito = db.connection.cursor()
                upCarrito.execute("UPDATE carrito SET cantidad=%s, importe=%s WHERE idcarrito=%s", (cantidad, importe, idcarrito))
            else:
                cantidad = 1
                importe = precio
                regCarrito = db.connection.cursor()
                regCarrito.execute("INSERT INTO carrito (idproducto, idusuario, cantidad, fechaad, importe) VALUES (%s,%s,%s,%s,%s)", (idproducto, session['_user_id'], cantidad, horas["hora"], importe))
                regCarrito.close()
            
            print("si entro pero no supe adonde s fue")
            db.connection.commit()
            session['Carrito'] += 1
            print("Usuario no encontrado")
            flash('El producto se ha añadido a tu carrito')
        else:
            print("NO se encontro usuario")
            flash('Usuario no autenticado')
    except Exception as e:
        flash(f"Error al procesar la solicitud: {str(e)}")
    finally:
        return redirect(url_for('catalogo'))
    


@app.route('/sCarrito')
def sCarrito():
    selCarrito = db.connection.cursor()
    selCarrito.execute("SELECT * FROM carrito INNER JOIN producto_1 ON carrito.idproducto = producto_1.idproducto WHERE idusuario=%s",(session['_user_id'],))
    c = selCarrito.fetchall()
    for o in c:
        print(f"Un producto {o[6]},-------")
    selCarrito.close()
    return render_template('carrito.html', productos=c)

@app.route('/dCarrito/<int:idcarrito>/<int:cantidad>', methods=['GET'])
def dCarrito(idcarrito,cantidad):
    delCarrito =   db.connection.cursor()
    delCarrito.execute("DELETE FROM carrito WHERE idcarrito=%s",(idcarrito,))
    db.connection.commit()
    session['Carrito'] -= cantidad
    flash('Articulo eliminado')
    return redirect(url_for('sCarrito'))

@app.route('/uCarrito', methods=['POST'])
def uCarrito():
    NumProductos = request.form['NumProductos']
    n = 1
    total_carrito = 0

    while n < int(NumProductos):
        idcarrito = request.form['idcarrito{}'.format(n)]
        precio = request.form['precio{}'.format(n)]
        cantidad = request.form['cantidad{}'.format(n)]
        importe = float(precio) * int(cantidad)

        upCarrito = db.connection.cursor()
        upCarrito.execute("UPDATE carrito SET cantidad=%s, importe=%s WHERE idcarrito=%s", (5, importe, idcarrito))
        db.connection.commit()

        total_carrito += int(cantidad)
        n += 1

    session['Carrito'] = total_carrito
    flash('Carrito actualizado')
    return redirect(url_for('sCarrito'))

@app.route('/iVenta', methods=['POST'])
def iVenta():
    try:
        FormaPagoV = request.form['FormaPagoV']
        TotalV = request.form['TotalV']
        DireccionV = request.form['DireccionV']
        FechaPagoV = datetime.now()

        with db.connection.cursor() as regVenta:
            regVenta.execute("INSERT INTO venta (direccion, formapago, totaldecompra, idusuario, fechapago) VALUES (%s,%s,%s,%s,%s)",
                             (DireccionV, FormaPagoV, TotalV, session['_user_id'], FechaPagoV))
            db.connection.commit()

            IdVenta = regVenta.lastrowid

        with db.connection.cursor() as upCarrito:
            upCarrito.execute("UPDATE carrito SET idventa=%s WHERE idusuario=%s AND idventa IS NULL", (IdVenta, session['_user_id']))
            db.connection.commit()

        session['Carrito'] = 0

        # Resto del código para enviar el correo electrónico...

        flash('Gracias por su compra!')
        return redirect(url_for('catalogo'))

    except Exception as e:
        flash(f"Error al procesar la compra: {str(e)}")
        return redirect(url_for('catalogo'))


app.route('/informacion')
@app.route('/informacion/<string:nombre>')
@app.route('/informacion/<string:nombre>/<string:apellido>')
def informacion(nombre = None, apellido= None):
    texto=""
    if nombre !=None and apellido!=None:
        texto = f"<h1>de {nombre}, {apellido}</h1>"
        
    
    return f"<h1>Informacion {texto}</h1>"


@app.route('/sUsuario', methods=['GET', 'POST'])
def sUsuario():
    SelUsuario = db.connection.cursor()
    SelUsuario.execute("SELECT * FROM usuario")
    u = SelUsuario .fetchall()
    return render_template('usuarios.html', usuario = u)

@app.route('/uUsuario/<string:id>', methods=['GET', 'POST'])
def uUsuario(id):
    if request.method=='POST':
        nameu = request.form['nameu']
        emailu= request.form['emailu']
        passwordu=request.form['passwordu']
        claveCifrada=generate_password_hash(passwordu)
        perfilu=request.form['perfilu']
        # Imprime los datos para verificar que se están recibiendo correctamente
        print("Nameu:", nameu)
        print("Emailu:", emailu)
        print("Passwordu:", passwordu)
        print("Perfilu:", perfilu)
        
        UpUsuario = db.connection.cursor()
        UpUsuario.execute("UPDATE usuario SET nameu=%s, emailu=%s, passwordu=%s, perfilu=%s WHERE id=%s",(nameu, emailu,claveCifrada, perfilu, id))
        db.connection.commit()
        flash('Usuario Actualizado')
        return redirect(url_for('sUsuario'))
    else:
        return redirect(request.url)
    
    
@app.route('/dUsuario/<string:id>', methods=['POST', 'GET'])
def dUsuario(id):
    if request.method == 'POST':
        try:
            DelUsuario = db.connection.cursor()
            DelUsuario.execute("DELETE FROM usuario WHERE id=%s", (id,))
            db.connection.commit()
            flash('Usuario Eliminado')
            return redirect(url_for('sUsuario'))
        except Exception as e:
            print("Error al eliminar el usuario:", str(e))
            flash('Error al eliminar el usuario')
    return redirect(url_for('sUsuario'))

    
""" 
@app.route('/dUsuario/<string:id>', methods=['GET', 'POST'])
def dUsuario(id):
    if request.method=='POST':
        DelUsuario=db.connection.cursor()
        DelUsuario.execute("DELETE FROM usuario WHERE id=%s", (id,))
        flash('Usuario Eliminado')
        return redirect(url_for('sUsuario'))
    else:
        return redirect(request.url)
    
"""


"""
@app.route('/sCategoria', methods=['GET', 'POST'])
def sUsuario():
    SelCategorias = db.connection.cursor()
    SelCategorias.execute("SELECT * FROM categoria")
    u = SelCategorias .fetchall()
    return render_template('categorias.html', categorias = u)
   """ 


"""
@app.route('/iUsuario', methods=['GET', 'POST'])
def iUsuario():
    if request.method =='POST':
        regUsuario = db.connection.cursor()
        nameu= request.form['nameu']
        emailu= request.form['emailu']
        passwordu= request.form['passwordu']
        passwordCifrada=generate_password_hash(passwordu)
        perfilu=request.form['perfilu']
        #Consulta sql
    
        regUsuario.execute("INSERT INTO usuario (nameu, emailu, passwordu, perfilu) VALUES (%s, %s, %s, %s)", (nameu,emailu, passwordCifrada, perfilu ))
        db.connection.commit()
        flash('Se a creado el usuario correctamente')
        return redirect(url_for('sUsuario'))
    else:
        flash('No se pudo crear el Usuario')
        return redirect(url_for(request.url))
"""   
   
@app.route('/iUsuario', methods=['GET', 'POST'])
def iUsuario():
    if request.method == 'POST':
        regUsuario = db.connection.cursor()
        nameu = request.form['nameu']
        emailu = request.form['emailu']
        passwordu = request.form['passwordu']
        passwordCifrada = generate_password_hash(passwordu)
        perfilu = request.form['perfilu']

        try:
            # Consulta sql
            regUsuario.execute("INSERT INTO usuario (nameu, emailu, passwordu, perfilu) VALUES (%s, %s, %s, %s)", (nameu, emailu, passwordCifrada, perfilu))
            db.connection.commit()
            flash('Se ha creado el usuario correctamente')
            return redirect(url_for('sUsuario'))
        except Exception as e:
            flash('No se pudo crear el Usuario: ' + str(e))

    return render_template('sign-up.html')



@app.route('/sProductos', methods=['GET', 'POST'])
def sProductos():
    SelUsuario = db.connection.cursor()
    SelUsuario.execute("SELECT * FROM preferenciasu")
    p = SelUsuario .fetchall()
    return render_template('productos.html',  productos = p)


if __name__=="__main__":
    app.config.from_object(config['development'])
    mail = Mail(app)
    app.run(debug = True)
    



