import { useState } from "react";
import axios from "../api/axios";
import { Link } from "react-router-dom";
import { FaEnvelope } from "react-icons/fa";

export default function ForgotPassword() {
  const [email, setEmail] = useState("");
  const [msg, setMsg] = useState("");
  const [err, setErr] = useState("");

  const submit = async (e) => {
    e.preventDefault();
    setMsg(""); setErr("");
    try {
      const res = await axios.post("/forgot-password", { email });
      setMsg(res.data.message || "Jika email terdaftar, instruksi telah dikirim.");
    } catch (error) {
      setErr(error.response?.data?.error || "Terjadi kesalahan.");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-green-50 p-4">
      <form onSubmit={submit} className="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md">
        <h2 className="text-2xl text-center font-bold text-green-600 mb-4">Lupa Password</h2>
        <p className="text-gray-600 text-sm mb-4">Masukkan email untuk menerima link reset</p>
        {msg && <div className="text-green-600 mb-4">{msg}</div>}
        {err && <div className="text-red-500 mb-4">{err}</div>}
        <div className="relative mb-4">
          <FaEnvelope className="absolute top-3 left-3 text-gray-400" />
          <input
            type="email"
            placeholder="Email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
            className="w-full pl-10 p-3 border rounded focus:ring-2 focus:ring-green-400"
          />
        </div>
        <button className="w-full py-3 bg-green-600 text-white rounded hover:bg-green-700">Kirim Link Reset</button>
        <div className="text-center text-sm mt-4">
          Kembali ke <Link to="/login" className="text-green-600 font-semibold">Login</Link>
        </div>
      </form>
    </div>
  );
}
