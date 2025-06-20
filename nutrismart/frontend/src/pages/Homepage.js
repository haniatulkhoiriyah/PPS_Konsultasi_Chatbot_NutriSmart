import { useNavigate } from "react-router-dom";
import {
  FaSignInAlt,
  FaSignOutAlt,
  FaRobot,
  FaUtensils,
  FaHeartbeat,
  FaBed,
  FaChartLine,
} from "react-icons/fa";

export default function Homepage() {
  const navigate = useNavigate();
  const user = JSON.parse(localStorage.getItem("user") || "null");

  return (
    <div className="relative min-h-screen bg-gradient-to-br from-green-50 to-white p-6 flex flex-col">
      {/* Background dekorasi */}
      <div className="absolute top-10 left-[-80px] w-64 h-64 bg-green-200 rounded-full opacity-30 animate-pulse" />
      <div className="absolute bottom-10 right-[-60px] w-48 h-48 bg-green-300 rounded-full opacity-20 animate-pulse delay-3000" />

      {/* Header */}
      <header className="flex justify-end mb-8 z-10">
        {user ? (
          <button
            className="bg-blue-600 hover:bg-blue-700 text-white px-5 py-2 rounded-full shadow flex items-center gap-2"
            onClick={() => {
              localStorage.removeItem("user");
              window.location.reload();
            }}
          >
            <FaSignOutAlt />
            Logout
          </button>
        ) : (
          <button
            className="bg-gradient-to-r from-green-600 to-green-800 hover:from-green-700 hover:to-green-900 text-white px-5 py-2 rounded-full shadow flex items-center gap-2"
            onClick={() => navigate("/login")}
          >
            <FaSignInAlt />
            Login
          </button>
        )}
      </header>

      {/* Konten utama */}
      <main className="text-center px-4 z-10 flex-1">
        <h1 className="text-5xl font-extrabold text-green-700 mb-4">NUTRISMART</h1>
        <p className="text-lg text-gray-700 mb-10">
          Konsultasi nutrisi dan pola hidup sehat disini!
        </p>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
          <Card title="Cek Kalori" icon={<FaUtensils />} />
          <Card title="Rekomendasi Makanan" icon={<FaHeartbeat />} />
          <Card
            title="Konsultasi Chatbot"
            icon={<FaRobot />}
            onClick={() => navigate("/chatbot")}
          />
          <Card title="Sleep Monitoring" icon={<FaBed />} />
          <Card title="Body Progress" icon={<FaChartLine />} />
        </div>
      </main>

      {/* Footer */}
      <footer className="text-center text-gray-500 text-xs mt-10 z-10">
        &copy; 2025 NutriSmart
      </footer>
    </div>
  );
}

function Card({ icon, title, onClick }) {
  return (
    <div
      onClick={onClick}
      role={onClick ? "button" : "article"}
      className="bg-white p-6 rounded-3xl shadow-xl hover:scale-105 transition cursor-pointer"
    >
      <div className="text-green-600 text-5xl mb-4 animate-bounce">{icon}</div>
      <h3 className="font-semibold text-lg">{title}</h3>
    </div>
  );
}
