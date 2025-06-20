import { useEffect, useState, useCallback, useRef } from "react";
import { useNavigate } from "react-router-dom";
import axios from "../api/axios";
import { Send, Trash2, Bot, User } from "lucide-react";

export default function Chatbot() {
  const [message, setMessage] = useState("");
  const [history, setHistory] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState(null);
  const [showConfirmDelete, setShowConfirmDelete] = useState(false);
  const [showEmail, setShowEmail] = useState(false);
  const messagesEndRef = useRef(null);
  const navigate = useNavigate();

  const user = JSON.parse(localStorage.getItem("user"));
  const user_id = user?.id || null;

  const sendMessage = async () => {
    if (!message.trim()) return;
    setIsLoading(true);
    setError(null);
    try {
      const response = await axios.post("/chat", {
        userId: user_id,
        question: message.trim(),
      });
      const data = response.data;
      if (data.answer) {
        setHistory((prev) => [
          ...prev,
          { sender: "user", message: message.trim() },
          { sender: "bot", message: data.answer },
        ]);
      } else {
        setError("Jawaban tidak tersedia.");
      }
    } catch (error) {
      console.error("Error sending message:", error);
      setError("Terjadi kesalahan saat mengirim pesan.");
    } finally {
      setIsLoading(false);
      setMessage("");
    }
  };

  const fetchHistory = useCallback(async () => {
    try {
      const today = new Date().toISOString().split("T")[0];
      const res = await axios.get(`/chat/history/${user_id}/${today}`);
      const historyData = res.data
        .map((item) => [
          { sender: "user", message: item.user_message },
          { sender: "bot", message: item.answer },
        ])
        .flat();
      setHistory(historyData);
    } catch (err) {
      console.error("Gagal load riwayat:", err);
      setError("Terjadi kesalahan saat memuat riwayat.");
    }
  }, [user_id]);

  const handleClearHistory = async () => {
    try {
      await axios.delete("/chat/history", {
        data: { userId: user_id },
      });
      setHistory([]);
    } catch (error) {
      console.error("Error deleting history:", error);
      setError("Terjadi kesalahan saat menghapus riwayat.");
    } finally {
      setShowConfirmDelete(false);
    }
  };

  useEffect(() => {
    fetchHistory();
  }, [fetchHistory]);

  useEffect(() => {
    if (messagesEndRef.current) {
      messagesEndRef.current.scrollIntoView({ behavior: "smooth" });
    }
  }, [history]);

  return (
    <div className="min-h-screen bg-[#f7fafc] flex flex-col items-center py-6 px-4">
      {/* Sticky Header */}
      <div className="w-full max-w-2xl sticky top-0 z-20 bg-white pt-2">
        <div className="flex items-center justify-between border-b pb-2 border-green-200 px-1">
          <div className="flex items-center gap-3">
            <button
              onClick={() => navigate("/")}
              title="Kembali"
              className="hover:scale-110 transition-transform duration-300 flex items-center justify-center rounded-full p-1 bg-green-100 text-green-600"
              style={{ width: 36, height: 36 }}
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
                strokeWidth={2}
                className="w-6 h-6"
              >
                <path strokeLinecap="round" strokeLinejoin="round" d="M15 19l-7-7 7-7" />
              </svg>
            </button>

            <div
              onClick={() => setShowEmail(!showEmail)}
              className="flex items-center gap-2 cursor-pointer"
            >
              <div className="w-9 h-9 rounded-full bg-green-100 text-green-600 flex items-center justify-center text-lg font-bold">
                {user?.name?.charAt(0).toUpperCase() || "U"}
              </div>
              <div className="flex flex-col">
                <span className="text-lg font-semibold text-green-600">
                 Hi, {user?.name || "Pengguna"}
                </span>
                {showEmail && (
                  <span className="text-sm text-gray-600">{user?.email}</span>
                )}
              </div>
            </div>
          </div>

          <div className="flex items-center gap-3">
            <button
              onClick={() => setShowConfirmDelete(true)}
              className="text-sm text-red-500 hover:text-red-600 flex items-center gap-1 underline underline-offset-4"
            >
              <Trash2 className="w-4 h-4" /> Hapus Riwayat
            </button>
            <button
              onClick={() => {
                localStorage.removeItem("user");
                window.location.href = "/";
              }}
              className="flex items-center gap-2 bg-blue-500 hover:bg-blue-600 text-white px-3 py-1 rounded-full text-sm shadow transition"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                className="w-4 h-4"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a2 2 0 002 2h3a2 2 0 002-2V7a2 2 0 00-2-2h-3a2 2 0 00-2 2v1"
                />
              </svg>
              Logout
            </button>
          </div>
        </div>
      </div>

      {/* Modal konfirmasi hapus */}
      {showConfirmDelete && (
        <div className="fixed inset-0 bg-black bg-opacity-30 flex justify-center items-center z-50">
          <div className="bg-white rounded-lg shadow-lg p-6 max-w-sm w-full text-center">
            <p className="mb-4 text-lg font-medium text-gray-700">
              Apakah Anda yakin ingin menghapus riwayat chat?
            </p>
            <div className="flex justify-center gap-4">
              <button
                onClick={handleClearHistory}
                className="bg-red-500 hover:bg-red-600 text-white px-5 py-2 rounded-md transition"
              >
                Hapus
              </button>
              <button
                onClick={() => setShowConfirmDelete(false)}
                className="bg-gray-300 hover:bg-gray-400 text-gray-700 px-5 py-2 rounded-md transition"
              >
                Batal
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Kontainer Chat */}
      <div className="flex-1 w-full max-w-2xl bg-white rounded-2xl shadow-md px-6 pt-4 overflow-y-auto mb-4 h-[65vh] scroll-smooth">
        <div className="space-y-4">
          {history.map((item, i) => (
            <div key={i} className={`flex ${item.sender === "user" ? "justify-end" : "justify-start"}`}>
              <div className={`flex items-end gap-2 ${item.sender === "user" ? "flex-row-reverse" : ""}`}>
                <div className={`p-2 rounded-full ${item.sender === "user" ? "bg-green-500 text-white" : "bg-gray-100 text-green-600"}`}>
                  {item.sender === "user" ? <User className="w-4 h-4" /> : <Bot className="w-4 h-4" />}
                </div>
                <div className={`px-4 py-2 rounded-2xl text-sm leading-relaxed shadow-sm max-w-xs animate-fadeIn ${item.sender === "user" ? "bg-green-500 text-white rounded-br-none" : "bg-gray-100 text-gray-800 rounded-bl-none"}`}>
                  {item.message}
                </div>
              </div>
            </div>
          ))}
          <div ref={messagesEndRef} />
        </div>
      </div>

      {error && <div className="text-red-600 text-sm mb-2 max-w-2xl">{error}</div>}

      {/* Sticky Input Chat */}
      <div className="w-full max-w-2xl sticky bottom-0 z-10 bg-white py-2 flex items-center gap-2 px-1">
        <input
          type="text"
          placeholder="Tulis pertanyaanmu di sini"
          className="flex-1 px-4 py-3 rounded-full border border-gray-300 shadow-sm focus:outline-none focus:ring-2 focus:ring-green-400 text-sm transition"
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          onKeyDown={(e) => e.key === "Enter" && sendMessage()}
        />
        <button
          onClick={sendMessage}
          disabled={isLoading}
          className="bg-green-500 hover:bg-green-600 text-white p-3 rounded-full shadow-md transition"
        >
          {isLoading ? <span>...</span> : <Send className="w-5 h-5" />}
        </button>
      </div>
    </div>
  );
}
