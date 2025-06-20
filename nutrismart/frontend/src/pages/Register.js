import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";
import axios from "../api/axios";
import { FaEye, FaEyeSlash } from "react-icons/fa";

export default function Register() {
  const [form, setForm] = useState({ name: "", email: "", password: "", confirm: "" });
  const [show, setShow] = useState(false);
  const [err, setErr] = useState("");
  const navigate = useNavigate();

  const submit = async (e) => {
    e.preventDefault();
    if (form.password !== form.confirm) return setErr("Password dan konfirmasi tidak sama");
    try {
      await axios.post("/register", { name: form.name, email: form.email, password: form.password });
      navigate("/login");
    } catch (error) {
      setErr(error.response?.data?.error || "Pendaftaran gagal");
    }
  };

  
  return (
    <div className="min-h-screen flex items-center justify-center bg-green-50 p-4">
      <form onSubmit={submit} className="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md">
        <h2 className="text-3xl text-center text-green-600 font-bold mb-6">Daftar</h2>
        {err && <div className="text-red-500 mb-4">{err}</div>}
        <input
          type="text"
          placeholder="Nama"
          className="w-full mb-4 p-3 border border-gray-300 rounded focus:outline-none focus:border-green-500"
          value={form.name}
          onChange={(e) => setForm({ ...form, name: e.target.value })}
          required
        />
        <input
          type="email"
          placeholder="Email"
          className="w-full mb-4 p-3 border border-gray-300 rounded focus:outline-none focus:border-green-500"
          value={form.email}
          onChange={(e) => setForm({ ...form, email: e.target.value })}
          required
        />
        <div className="relative mb-4">
          <input
            type={show ? "text" : "password"}
            placeholder="Password"
            className="w-full mb-4 p-3 border border-gray-300 rounded focus:outline-none focus:border-green-500"
            value={form.password}
            onChange={(e) => setForm({ ...form, password: e.target.value })}
            required
          />
          <div className="absolute top-3 right-4 cursor-pointer text-gray-600" onClick={() => setShow(!show)}>
            {show ? <FaEyeSlash /> : <FaEye />}
          </div>
        </div>
        <input
          type={show ? "text" : "password"}
          placeholder="Konfirmasi Password"
          className="w-full mb-4 p-3 border border-gray-300 rounded focus:outline-none focus:border-green-500"
          value={form.confirm}
          onChange={(e) => setForm({ ...form, confirm: e.target.value })}
          required
        />
        <button className="w-full py-3 bg-green-600 text-white rounded hover:bg-green-700">Daftar</button>
        <div className="text-center text-sm mt-4">
          Sudah punya akun? <Link to="/login" className="text-green-600 font-semibold">Login</Link>
        </div>
      </form>
    </div>
  );
}
