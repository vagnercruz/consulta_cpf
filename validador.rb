require 'cpf_cnpj'

class ValidadorCPF
  def self.validar(cpf)
    if CPF.valid?(cpf)
      puts "O CPF #{cpf} é válido."
      true
    else
      puts "O CPF #{cpf} é inválido."
      false
    end
  end
end
