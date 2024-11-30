local M = {}

-- Funzione per compilare il codice C/C++
function M.compile()
	-- Ottieni il nome del file corrente
	local input_file = vim.fn.expand("%:p") -- Percorso completo del file corrente

	-- Chiedi all'utente il nome del file di output, suggerendo il nome senza estensione
	local output_file = vim.fn.input("Nome del file di output: ", input_file:match("(.+)%..+"))

	-- Se l'utente non fornisce un nome di output, usa il nome del file senza estensione
	if output_file == "" then
		output_file = input_file:match("(.+)%..+") -- Nome del file senza estensione
	end

	-- Identifica automaticamente il compilatore in base all'estensione del file
	local compiler
	local file_extension = input_file:match("^.+%.(.+)$"):lower() -- Ottieni l'estensione del file

	if file_extension == "c" then
		compiler = "gcc"
	elseif file_extension == "cpp" or file_extension == "cc" or file_extension == "cxx" then
		compiler = "g++"
	else
		print("Tipo di file non supportato per la compilazione.")
		return
	end

	-- Verifica se il compilatore è disponibile
	if vim.fn.executable(compiler) == 0 then
		print("Compilatore " .. compiler .. " non trovato. Installalo prima di procedere.")
		return
	end

	-- Esegui il comando di compilazione
	vim.cmd(string.format(":!%s %s -o %s", compiler, input_file, output_file))

	-- Controlla se la compilazione ha avuto successo
	local success = vim.fn.filereadable(output_file) == 1
	if success then
		print("Compilazione completata con successo!")
	else
		print("Errore nella compilazione.")
	end
end

-- Funzione per eseguire il programma compilato
function M.run()
	-- Chiedi all'utente il nome del file eseguibile (default "a.out" o nome dell'output della compilazione)
	local exec_file = vim.fn.input("Nome del file eseguibile: ", "a.out")

	-- Verifica se il file eseguibile esiste
	if vim.fn.filereadable(exec_file) == 0 then
		print("File eseguibile non trovato.")
		return
	end

	-- Esegui il programma in una nuova finestra terminale
	vim.cmd("split | terminal ./" .. exec_file)
end

return M
