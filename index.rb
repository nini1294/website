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
        Procedural_Generation: '/procgen',
        MyNeta_API: '/my_neta/',
        CarML: 'https://github.com/ece4813-movie-recommendation/Movie-Recommendation-Project',
				Smartmirror: '/smartmirror'
      }
      @name = 'Nishant Shah'
      @info = ''
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

    r.on 'procgen' do
      @name = 'Procedural Generation'
      @title = 'Procedural Generation'
      @links = {
        Crystal_Polygons: {
          title: 'Polygons',
          items: [
            '/polygons/polygons_2.png',
            '/polygons/polygons_5.png',
            '/polygons/polygons_6.png',
            '/polygons/polygons_9.png',
            '/polygons/tile_1.png',
            '/polygons/tile_2.png',
          ],
          date: '01/02/2019',
        },
        Audio_Shop: {
          title: 'Audio Based Glitching',
          items: [
            '/glitch/pompidou-glitch-overdrive.jpg',
            '/glitch/pompidou-glitch-pitch.jpg',
            '/glitch/pompidou.jpg',
            '/glitch/sun-stars-glitch.jpg',
          ],
          date: '18/05/2016',
        },
      }
      render 'procedural_generation'
    end

    r.on 'my_neta' do
      r.run MyNeta
    end
  end
end
