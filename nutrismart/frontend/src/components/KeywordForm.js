import { useState, useEffect } from "react";

export default function KeywordForm({ onSave, editing, onCancel }) {
  const [form, setForm] = useState({ keyword: "", answer: "" });

  useEffect(() => {
    if (editing) setForm(editing);
    else setForm({ keyword: "", answer: "" });
  }, [editing]);

  const submit = (e) => {
    e.preventDefault();
    onSave(form);
  };

  return (
    <form onSubmit={submit} className="bg-white p-4 rounded-lg shadow mb-6">
      <div className="grid gap-4 sm:grid-cols-2">
        <input
          type="text"
          placeholder="Keyword (regex)"
          value={form.keyword}
          onChange={(e) => setForm({ ...form, keyword: e.target.value })}
          required
          className="border p-2 rounded focus:ring-2 focus:ring-green-400"
        />
        <textarea
          placeholder="Jawaban"
          rows="3"
          value={form.answer}
          onChange={(e) => setForm({ ...form, answer: e.target.value })}
          required
          className="border p-2 rounded focus:ring-2 focus:ring-green-400"
        />
      </div>
      <div className="flex justify-end gap-2 mt-4">
        {editing && <button onClick={onCancel} type="button" className="px-4 py-2 bg-gray-300 rounded">Batal</button>}
        <button type="submit" className="px-6 py-2 bg-green-600 text-white rounded">
          {editing ? "Update" : "Tambah"}
        </button>
      </div>
    </form>
  );
}
