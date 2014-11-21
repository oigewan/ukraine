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
        session[:name] = 'Ігора Гордійчука'
        session[:battle_title] = 'Бій за Савур-Могилу'
        session[:page_title] = 'Підтримайте Ігора Гордійчука'
        session[:og_title] = 'Підтримайте Ігора Гордійчука'
        session[:og_description] = 'Полковник Гордійчук багато років віддано служив на благо Батьківщини та її народу,включаючи часи Російської окупації. Нажаль, полковник Гордійчук, під час захисту Вітчизни отримав важке поранення від розриву російського артилерійського снаряду і зараз він бореться за життя. Він та багато таких як він потребують твоєї допомоги. Не будь байдужим!!!'
      else
        @prefix = 'www'
        @lang_name = 'English'
        session[:language] = 'en'
        session[:name] = 'Ihor Hordiychuk'
        session[:battle_title] = 'Battle of Savur-Mohyla'
        session[:page_title] = 'Help Support Ihor Hordiychuk'
        session[:og_title] = 'Help Support Ihor Hordiychuk'
        session[:og_description] = "Colonel Ihor Hordiychuk has honorably served the people of Ukraine for many years, including during Russia's deplorable invasion of his homeland. Unfortunately, Col Hordiychuk was injured by shrapnel from Russian artillery, and he now fights for his life. He and many others like him need our help!"
    end

    host.unshift(lang) if host.length === 1
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
