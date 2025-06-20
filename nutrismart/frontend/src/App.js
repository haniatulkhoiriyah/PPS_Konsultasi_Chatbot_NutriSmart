import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Homepage from "./pages/Homepage";
import Login from "./pages/Login";
import Register from "./pages/Register";
import ForgotPassword from "./pages/ForgotPassword";
import Chatbot from "./pages/Chatbot";
import AdminKeyword from "./pages/AdminKeyword";
import ResetPassword from "./pages/ResetPassword";

const Protected = ({ children }) => localStorage.getItem("user") ? children : <Navigate to="/login" />;
const AdminOnly = ({ children }) => {
  const user = JSON.parse(localStorage.getItem("user") || "{}");
  return user.role === "admin" ? children : <Navigate to="/" />;
};

export default function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Homepage />} />
        <Route path="/homepage" element={<Homepage />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/forgot-password" element={<ForgotPassword />} />
        <Route path="/chatbot" element={<Protected><Chatbot /></Protected>} />
        <Route path="/admin/keywords" element={<Protected><AdminOnly><AdminKeyword /></AdminOnly></Protected>} />
        <Route path="/reset-password/:token" element={<ResetPassword />} />
        <Route path="*" element={<Navigate to="/" />} />
      </Routes>
    </Router>
  );
}
