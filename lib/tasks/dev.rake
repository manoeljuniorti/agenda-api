namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts 'Cadastrando os tipos de contatos...'
    kinds = %w(Família Amigo Comercial)
    kinds.each do |kind|
      Kind.create!(description: kind)
    end
    puts 'Tipos de contatos cadastrados com sucesso!!!'

    puts 'Cadastrando contatos...'
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 75.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts 'Contatos cadastrados com sucesso!!!'
  end
end
