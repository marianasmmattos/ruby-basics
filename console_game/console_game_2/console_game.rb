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

def quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar.upcase == "N"
end

def pede_um_chute(erros, chutes)
    puts "\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que você acertou? Você chutou #{chute}"
    chute
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    chutes = []
    pontos = 0

    while erros < 5
        chute = pede_um_chute
        chutes << chute

        letra = chute.size == 1

        if letra

        else
            acertou = chute == palavra_secreta
            if acertou
                puts "Parabéns! Acertou!"
                pontos += 100
                break
            else 
                puts "Que pena... Você errou"
                pontos -= 20
                erros += 1
        end

    end

    puts "Você ganhou #{pontos} pontos"
end

loop do
    joga nome
    if quer_jogar?
        break
    end
end

nome = welcome