import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "../api/axios";
import { FaEye, FaEyeSlash } from "react-icons/fa";

export default function Login() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [show, setShow] = useState(false);
  const [err, setErr] = useState("");
  const navigate = useNavigate();

  const submit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post("/login", { email, password });
      localStorage.setItem("user", JSON.stringify(res.data.user));
      const role = res.data.user.role;
        if (role === "admin") {
           navigate("/admin/keywords");
        } else {
           navigate("/chatbot");
        }
    } catch (error) {
      setErr(error.response?.data?.error || "Login gagal");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-green-50 p-4">
      <form onSubmit={submit} className="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md">
        <h2 className="text-3xl text-center text-green-600 font-bold mb-6">Login</h2>
        {err && <div className="text-red-500 mb-4">{err}</div>}
        <input
          type="email"
          placeholder="Email"
          className="w-full mb-4 p-3 border border-gray-300 rounded focus:outline-none focus:border-green-500"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <div className="relative mb-4">
          <input
            type={show ? "text" : "password"}
            placeholder="Password"
            className="w-full p-3 border border-gray-300 rounded focus:outline-none focus:border-green-500"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />
          <div className="absolute top-3 right-4 cursor-pointer text-gray-600" onClick={() => setShow(!show)}>
            {show ? <FaEyeSlash /> : <FaEye />}
          </div>
        </div>
        <button className="w-full py-3 bg-green-600 text-white rounded mb-4 hover:bg-green-700">Login</button>
        <div className="text-right mb-2">
          <Link to="/forgot-password" className="text-green-600 hover:underline text-sm">Lupa Password?</Link>
        </div>
        <div className="text-center text-sm">
          Belum punya akun? <Link to="/register" className="text-green-600 font-semibold">Daftar</Link>
        </div>
      </form>
    </div>
  );
}
