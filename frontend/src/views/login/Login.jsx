import { Link } from "react-router-dom";

function Login() {
  return (
    <section className="login">
      <Link to="/home">Home</Link>
      <h1>¡Inicia sesión en Ullet!</h1>
    </section>
  );
}

export default Login;
