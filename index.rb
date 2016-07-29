require 'roda'
require 'dotenv'
load './myneta_api/my_neta.rb'
Dotenv.load

# Main landing page class
class Index < Roda

  plugin :render
  plugin :static, ['/assets/images/'], root: '.'
  plugin :assets, css: 'main.scss', js: ['bideo.js', 'main.js']
  compile_assets unless ENV['RACK_ENV'] == 'development'

  route do |r|
    r.assets

    r.root do
      @title = "Hello World!"
      @links = { Resume: '/Resume_NishantShah.pdf', LinkedIn: 'https://www.linkedin.com/in/nishantshah94',
        GitHub: 'https://github.com/nini1294'}
      @projects = { MyNeta_API: '/my_neta/', CarML: 'https://github.com/ece4813-movie-recommendation/Movie-Recommendation-Project' }
      @name = 'Nishant Shah'
      @info = 'I\'m a fourth year Computer Engineering major at the Georgia Institute of Technology.<br>'
      render 'index'
    end

    r.on 'my_neta' do
      r.run MyNeta
    end
  end
end
