export default function KeywordTable({ data, onEdit, onDelete }) {
  return (
    <div className="overflow-auto bg-white rounded-lg shadow">
      <table className="w-full table-auto">
        <thead className="bg-green-100 text-green-700">
          <tr>
            <th className="p-2 border">#</th>
            <th className="p-2 border">Keyword</th>
            <th className="p-2 border">Jawaban</th>
            <th className="p-2 border">Aksi</th>
          </tr>
        </thead>
        <tbody>
          {data.length === 0 ? (
            <tr><td colSpan="4" className="p-4 text-center text-gray-500">Belum ada keywords</td></tr>
          ) : (
            data.map((k, i) => (
              <tr key={k.id} className="hover:bg-green-50">
                <td className="p-2 border">{i+1}</td>
                <td className="p-2 border">{k.keyword}</td>
                <td className="p-2 border">{k.answer}</td>
                <td className="p-2 border flex gap-2">
                  <button onClick={() => onEdit(k)} className="bg-yellow-500 text-white px-3 py-1 rounded">Edit</button>
                  <button onClick={() => onDelete(k.id)} className="bg-red-600 text-white px-3 py-1 rounded">Hapus</button>
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
    </div>
  );
}
