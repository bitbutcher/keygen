module.exports = 

  column: (index, rows...) -> 
    if rows.length and index < rows[0].length then (row[index] for row in rows) else []

  columns: (rows...) -> (@column(index, rows...) for val, index in rows[0])
