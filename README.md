
<h2>Como correr el proyecto en su totalidad</h2>

<ul>
    <li>Descargar XAMPP Control Panel cuya version se tiene es la V3.3.0</li>
    <li>Descargar el codigo como tipo zip</li>
</ul>

<h3>Una vez instalado se debe seguir los siguientes pasos</h3>
<ol>
 <li>Abrimos XAMPP y en la parte superior debe aparacer APACHE Y MYSQL.</li>
 <li>En APACHE nos vamos al apartado que dice config</li>
 <li>La primera opcion nos dice Apache(httpd.conf) y se abrira un bloc de notas en el cual buscaremos ServerName localhost y Listen </li>
 <li>Cambiamos esos valores por</li>
    
    ServerName localhost:8080
    Listen 8080

 <li>Guardamos y le damos a correr Apache y MYSQL</li>
<li>Nos dirigimos al navegador y buscamos </li>

http://localhost:8080/phpmyadmin/

 
 <li>Creamos una base de datos de nombre pet_shop_db  e importamos la base de datos que se encuentra en la carpeta database</li>
 <li>Una vez importada la base de datos debemos irnos al path de XAMPP que estara en el disco C por defecto C:\xampp</li>
 <li>Buscamos la carpeta htdocs y pegamos el proyecto que hemos descargado del .zip  C:\xampp\htdocs</li>
  <li>Con ello ya debemos poder abrir sin ningun problema el proyecto en la url: http://localhost:8080/pet_shop/ y http://localhost:8080/pet_shop/admin/login.php para administrador</li>
 
</ol>

<h4> Acceso para Admin</h4>
<p>admin</p>
<p>admin123</p>






