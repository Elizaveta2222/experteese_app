class WorkController < ApplicationController
  require 'json'
  include WorkImage
  include WorkHelper

  skip_before_action :verify_authenticity_token

  def index
    @images_count = Image.all.count
    @selected_theme = "Select theme to leave your answer"
    @selected_image_name = 'Зеленая книга'
    @values_qty = Value.all.count
    @current_locale = I18n.locale
    @themes = Theme.all.pluck(:name)
    @default_image_name = 'assets/pictures/книга.jpg'

    session[:selected_theme_id] = @selected_theme
  end

  def choose_theme
    @themes = Theme.all.pluck(:name)
    logger.info "In WorkController#choose_theme @themes = #{@themes}"
    respond_to :js
  end

  def display_theme
    logger.info "In work#display_theme"
    @image_data = {}
    I18n.locale = session[:current_locale]

    current_user_id = current_user.id
    if params[:theme] == "-----"
      theme = "-----"
      theme_id = 1
      values_qty = Value.all.count.round
      data = { index: 0, name: 'Зеленая книга', values_qty: values_qty,
               file: 'assets/pictures/книга.jpg', image_id: 1,
               current_user_id: current_user_id, user_valued: false,
               common_ave_value: 0, value: 0, theme_id: theme_id }
    else
      theme = params[:theme]
      theme_id = Theme.find_theme_id(theme)
      data = show_image(theme_id, 0)
    end
    session[:selected_theme_id] = theme_id

    image_data(theme, data)
  end

  def results
    @selected_theme_id = session[:selected_theme_id]
    
    current_user_id = current_user.id
    res_composite_diag = Image.joins(:value)
      .select("images.name as name, images.created_at, images.file, values.value as user_value, values.created_at as mark_date, images.ave_value")
      .where("values.user_id = :user_id AND value <= images.ave_value + 25 AND value >= images.ave_value - 25", { user_id: current_user_id } )
      .order("value DESC")

    composite_results_size = res_composite_diag.size
    
    @composite_results = res_composite_diag.take(composite_results_size)
  end
end
