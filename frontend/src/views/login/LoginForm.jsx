function LoginForm() {
  return (
    <form className="login-form">
      <label>
        User Name
        <input type="text" />
      </label>
      <label>
        Password
        <input type="password" />
      </label>
      <button type="submit">LogIn</button>
    </form>
  );
}

export default LoginForm;
