class HomeController < ApplicationController
  before_action do
    get_translated_strings
    @nav_actions = ['battle']
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
  end
end
