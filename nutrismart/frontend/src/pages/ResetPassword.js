import { useState } from "react";
import { useNavigate, useParams } from "react-router-dom";
import axios from "../api/axios";
import { FaEye, FaEyeSlash } from "react-icons/fa";

export default function ResetPassword() {
  const [form, setForm] = useState({ pass: "", confirm: "" });
  const [show, setShow] = useState(false);
  const [msg, setMsg] = useState("");
  const [err, setErr] = useState("");
  const { token } = useParams();
  const nav = useNavigate();

  const submit = async e => {
    e.preventDefault();
    if (form.pass !== form.confirm) return setErr("Konfirmasi password tidak cocok");
    try {
      const res = await axios.post(`/reset-password/${token}`, { password: form.pass });
      setMsg(res.data.message || "Password berhasil diubah!");
      setTimeout(() => nav("/login"), 2000);
    } catch (e) {
      setErr(e.response?.data?.error || "Gagal reset password.");
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-green-50 p-4">
      <form onSubmit={submit} className="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md">
        <h2 className="text-2xl font-bold text-center text-green-600 mb-4">Reset Password</h2>
        {msg && <p className="text-green-600 mb-4">{msg}</p>}
        {err && <p className="text-red-500 mb-4">{err}</p>}
        <div className="relative mb-4">
          <input
            type={show ? "text" : "password"}
            placeholder="Password baru"
            value={form.pass}
            onChange={e => setForm({ ...form, pass: e.target.value })}
            required
            className="w-full p-3 border rounded focus:ring-2 focus:ring-green-400"
          />
          <div onClick={() => setShow(!show)} className="absolute right-4 top-3 cursor-pointer text-gray-600">
            {show ? <FaEyeSlash /> : <FaEye />}
          </div>
        </div>
        <input
          type={show ? "text" : "password"}
          placeholder="Konfirmasi password"
          value={form.confirm}
          onChange={e => setForm({ ...form, confirm: e.target.value })}
          required
          className="w-full p-3 border rounded focus:ring-2 focus:ring-green-400 mb-4"
        />
        <button className="w-full py-3 bg-green-600 text-white rounded hover:bg-green-700">Reset</button>
      </form>
    </div>
  );
}
