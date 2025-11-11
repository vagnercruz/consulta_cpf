require_relative 'consulta_cpf'

puts "=== Consulta de CPF ==="
print "Digite o CPF: "
cpf = gets.chomp

ConsultaCPF.consultar(cpf)
