"# encoding: UTF-8"

def boas_vindas
    puts "Oi! Meu nome é Mariana. Qual é o seu nome?"
    puts "Obs: Digite e tecle enter para conversar comigo"
    puts "\n\n\n"

    user = gets
    puts "\n\n\n"

    puts "Legal, " + user + "Vamos jogar um jogo."
    puts "\n\n\n"

    user
end

def pede_dificuldade
    puts "Qual o nível de dificuldade que deseja? (1 = fácil, 5 = difícil)"
    dificuldade = gets.to_i
end

def define_num(dificuldade)
    case dificuldade
    when 1..3
        maximo = 20 * dificuldade
    when 4
        maximo = 100
    when 5
        maximo = 200
    else 
        puts "Insira uma dificuldade válida!"
        return
    end

    sorteado = rand(maximo) + 1

    puts "Eu vou escolher um número de 1 a #{maximo - 1} e você vai ter três chances de acertá-lo." 
    puts "Para cada chance que você errar, direi 'frio' se o número que escolhi for menor e 'quente' se for maior."
    puts "Que comecem os jogos..."
    puts "\n\n\n\n\n\n"

    sorteado
end

def pede_num(tentativa,limite_de_tentativas) 
    puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
    puts "\n\n"
    puts "Insira um número entre 1 a 200"
    tentativa = gets
    puts "\n\n\n"

    puts"Será que você acertou? Seu chute foi: " + tentativa
    puts "\n\n\n"
    tentativa.to_i
end

def acertou?(tentativa, sorteado, user) 
    gabarito = tentativa == sorteado
    gabarito_maior = sorteado > tentativa

    if gabarito
        puts "Uau! Você acertou!"
        puts "GAME OVER"
        puts "Parabéns, " + user
        return true
    end
    
    puts "Errou! Você tem mais uma chance"

    if gabarito_maior
        puts "Tá quente!"
        puts "\n\n\n"
    else
        puts "Tá frio!"
        puts "\n\n\n"
    end

    false
end

def imprime_chutes(tentativa, chutes, pede_num)
    chutes[tentativa - 1] = pede_num
    
    puts "Suas tentativas até agora"
    puts "\n\n"    
    
    for contador in 0..(tentativa-1)
        puts "Tentativa #{contador+1}: #{chutes[contador]}" # Outra forma de concatenar strings
    end

    puts "\n\n" 
end

def jogar(user, dificuldade)
    num_sorteado = define_num(dificuldade)
    pontos_iniciais = 1000
    limite_de_tentativas = 5
    chutes = []

    for tentativa in 1..limite_de_tentativas 

        chute = pede_num(tentativa, limite_de_tentativas)
        imprime_chutes(tentativa, chutes, chute)

        pontos_a_perder = (chute - num_sorteado).abs/2.0
        pontos_iniciais -= pontos_a_perder

        puts "Você tem #{pontos_iniciais} pontos em saldo"
        puts "\n\n"

        break if acertou?(chute, num_sorteado, user)

    end
end

def quer_jogar
    puts "Deseja hogar novamente? (S/N)"
    quero_jogar = gets.strip
    quero_jogar == "S"
end

user = boas_vindas
dificuldade = pede_dificuldade

loop do
    jogar(user, dificuldade)
    if !quer_jogar
        break
    end
end