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

  private

  def extract_locale_from_subdomain
    parsed_locale = request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def set_locale
    I18n.locale = extract_locale_from_subdomain || I18n.default_locale
  end

  def generate_host_vars
    @no_lang_host = request.host
    if request.subdomains.length > 0
      @no_lang_host = request.host.split('.').reject { |a| a == request.subdomains.first }.join('.')
    end

    @no_lang_host = "#{@no_lang_host}:#{request.port}" unless request.port == 80
    @full_host = "#{I18n.t('prefix')}.#{@no_lang_host}:#{request.port}" unless request.port == 80
  end

  def get_other_locales
    @other_locales = I18n.available_locales.reject { |l| l == I18n.locale }
  end

  def get_page_title
    @page_title = I18n.t("#{controller_name}.#{action_name}.title")
  end

end
