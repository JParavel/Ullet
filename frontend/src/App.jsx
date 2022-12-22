import Home from "./views/home/Home";
import { Routes, Route, Navigate } from "react-router-dom";
import About from "./views/about/About";
import Navbar from "./components/ui/Navbar";
import Login from "./views/login/Login";
function App() {
  return (
    <div className="App">
      <Routes>
        <Route path="/" element={<Navigate to="/home" replace />} />
        <Route element={<Navbar />}>
          <Route path="/home" element={<Home />} />
          <Route path="/about" element={<About />} />
        </Route>
        <Route path="/login" element={<Login />} />
      </Routes>
    </div>
  );
}

export default App;
