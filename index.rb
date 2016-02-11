require 'roda'
require 'dotenv'
Dotenv.load

# Main landing page class
class Index < Roda

  plugin :render
  plugin :static, ['/css']
  plugin :assets, css:'main.scss'
  compile_assets unless ENV['RACK_ENV'] == 'development'

  route do |r|
    r.assets

    r.root do
      puts ENV['RACK_ENV']
      @links = { Resume: '#', LinkedIn: 'https://www.linkedin.com/in/nishantshah94',
        Github: 'https://github.com/nini1294'}
      @name = 'Nishant Shah'
      render('index')
    end
  end
end
