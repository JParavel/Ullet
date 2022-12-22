import { Link } from "react-router-dom";
import LoginForm from "./LoginForm";

function Login() {
  return (
    <section className="login">
      <Link to="/home">Home</Link>
      <h1>¡Inicia sesión en Ullet!</h1>
      <LoginForm />
    </section>
  );
}

export default Login;
