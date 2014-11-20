class HomeController < ApplicationController
  before_action do |controller|
    host = request.host.split('.')
    lang = host.shift
    @prefix = ''
    @lang_name = ''

    case lang
      when 'ua'
        @prefix = 'ua'
        @lang_name = 'Український'
        session[:language] = 'ua'
        session[:battle_title] = 'Бій за Савур-Могилу'
      else
        @prefix = 'www'
        @lang_name = 'English'
        session[:language] = 'en'
        session[:battle_title] = 'Battle of Savur-Mohyla'
    end

    @root_server = host.join('.')
    @root_server += ':' + request.port.to_s if request.port
    @lang_root = @prefix + '.' + @root_server
    @lang_full_path = @lang_root + request.path
  end

  def index
  end

  def battle
    @heros_of_ukraine_link = 'http://ukrgeroes.narod.ru/GordiychukIV.htm'
    @bbc_timeline_link = 'http://www.bbc.com/news/world-europe-27308526'
    @malaysian_airlines_link = 'http://www.bbc.com/news/world-europe-27308526'
    @rebels_link = 'http://en.wikipedia.org/wiki/Malaysia_Airlines_Flight_17'
    @google_maps_link = 'https://www.google.com/maps/place/Hora+Savur+Mohyla,+Donetsk+Oblast,+Ukraine/@47.9218612,38.7405979,3a,75y,270h,90t/data=!3m5!1e1!3m3!1szOBfm04avMcAAAQYQQYiAg!2e0!3e11!4m2!3m1!1s0x40e1aba72b61c717:0x8d6738503d0f9b09?hl=en'
    @overhead_link = 'https://www.google.com/maps/place/Hora+Savur+Mohyla,+Donetsk+Oblast,+Ukraine/@47.8934963,38.7287291,18278m/data=!3m1!1e3!4m2!3m1!1s0x40e1aba72b61c717:0x8d6738503d0f9b09?hl=en'

    render "battle_#{session[:language]}"
  end
end
