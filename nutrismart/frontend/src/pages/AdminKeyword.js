import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "../api/axios";
import KeywordForm from "../components/KeywordForm";
import KeywordTable from "../components/KeywordTable";

export default function AdminKeyword() {
  const [list, setList] = useState([]);
  const [editing, setEditing] = useState(null);
  const navigate = useNavigate(); // Untuk redirect setelah logout

  // Memuat data keyword dari server
  const load = async () => {
    try {
      const res = await axios.get("/admin/keywords");
      setList(res.data);
    } catch (error) {
      console.error("Gagal memuat data keyword:", error);
    }
  };

  useEffect(() => {
    load();
  }, []);

  const save = async (item) => {
    try {
      if (editing) {
        await axios.put(`/admin/keywords/${editing.id}`, item);
      } else {
        await axios.post("/admin/keywords", item);
      }
      setEditing(null);
      load();
    } catch (error) {
      console.error("Gagal menyimpan keyword:", error);
    }
  };

  const edit = (item) => setEditing(item);

  const remove = async (id) => {
    const isConfirmed = window.confirm("Hapus keyword ini?");
    if (isConfirmed) {
      try {
        await axios.delete(`/admin/keywords/${id}`);
        load();
      } catch (error) {
        console.error("Gagal menghapus keyword:", error);
      }
    }
  };

  // Fungsi logout
  const handleLogout = () => {
    localStorage.removeItem("user");
    navigate("/login");
  };

  return (
    <div className="p-6 bg-green-50 min-h-screen">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-2xl font-bold text-green-700">
          Kelola Keywords Chatbot
        </h2>
        <button
          onClick={handleLogout}
          className="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600"
        >
          Logout
        </button>
      </div>

      <KeywordForm
        onSave={save}
        editing={editing}
        onCancel={() => setEditing(null)}
      />
      <KeywordTable data={list} onEdit={edit} onDelete={remove} />
    </div>
  );
}
