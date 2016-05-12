require 'roda'
require 'dotenv'
load './myneta_api/my_neta.rb'
Dotenv.load

# Main landing page class
class Index < Roda

  plugin :render
  plugin :static, ['/css', '/js']
  plugin :assets, css:'main.scss', js:'main.js'
  compile_assets unless ENV['RACK_ENV'] == 'development'

  route do |r|
    r.assets

    r.root do
      @links = { Resume: '#', LinkedIn: 'https://www.linkedin.com/in/nishantshah94',
        Github: 'https://github.com/nini1294'}
      @projects = { MyNeta_API: '/my_neta/' }
      @name = 'Nishant Shah'
      render('index')
    end

    r.on 'my_neta' do
      r.run MyNeta
    end
  end
end
