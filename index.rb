require 'roda'
require 'dotenv'
load './myneta_api/my_neta.rb'
Dotenv.load

# Main landing page class
class Index < Roda

  plugin :render
  plugin :static, ['/assets/images/'], root: '.'
  plugin :static, ['/.well-known/acme-challenge/'], root: '.'
  plugin :assets, css: 'main.scss', js: ['bideo.min.js', 'main.js', 'googleanalytics.js']
  compile_assets unless ENV['RACK_ENV'] == 'development'

  route do |r|
    r.assets

    r.root do
      @title = "Hello World!"
      @external_links = {
        Resume: '/Resume_NishantShah.pdf',
        LinkedIn: 'https://www.linkedin.com/in/nishantshah94',
        GitHub: 'https://github.com/nini1294'
      }
      @projects = {
        Procedural_Generation: '/procedural',
        MyNeta_API: '/my_neta/',
        CarML: 'https://github.com/ece4813-movie-recommendation/Movie-Recommendation-Project',
				Smartmirror: '/smartmirror'
      }
      @name = 'Nishant Shah'
      @info = 'I\'m a software developer at Oracle in Pleasanton, California.'
			@partial = 'info'
      render 'index'
    end

		r.on 'smartmirror' do
			@name = 'ESGT Smart Mirror Project'
			@info = ''
      @title = "Smart Mirror"
			@partial = 'smartmirror'
			@links = {
        Project_Website: 'https://esgtproject.github.io/',
        Project_GitHub: 'https://github.com/ESGTProject/',
				Frontend_Code: 'https://github.com/ESGTProject/frontend'
      }
			render 'index'
		end

    r.on 'procedural' do
      @name = 'Procedural Generation'
      @title = 'Procedural Generation'
      render 'procedural_generation'
    end

    r.on 'my_neta' do
      r.run MyNeta
    end
  end
end
