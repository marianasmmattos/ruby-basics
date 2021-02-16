def welcome
    puts "Bem-vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "Começaremos o jogo então, #{nome}"
    nome
end

def escolhe_palavra_secreta
    puts "Escolhendo palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra escolhida com #{palavra_secreta.size} caracteres... Boa sorte"
    palavra_secreta
end