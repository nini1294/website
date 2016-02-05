require 'roda'

# Main landing page class
class Index < Roda

  plugin :render
  plugin :static, ['/css']
  plugin :assets, css:'main.css'

  route do |r|
    r.assets

    r.root do
      @links = { Resume: '#', LinkedIn: 'https://www.linkedin.com/in/nishantshah94',
        Github: 'https://github.com/nini1294' }
      @name = 'Nishant Shah'
      render('index')
    end
  end
end
