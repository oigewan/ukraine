class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def get_translated_strings
    set_locale
    generate_host_vars
    get_other_locales
    get_page_title
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
