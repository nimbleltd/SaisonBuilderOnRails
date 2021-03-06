class RecipeIngredient < ActiveRecord::Base
  attr_accessible :usage, :quantity, :duration, :ingredient, :recipe, :ingredient_id

  belongs_to :recipe
  belongs_to :ingredient

  NULL_ATTRS = %w( usage duration )
  before_save :nil_if_blank

  def display_usage
    usage.titleize
  end

  def render_line_item(type, ingr_record)
    measure = quantity_unit type
    line_item = "<div class='label_block recipe_align'>#{self.quantity} #{measure} <b>#{ingr_record.name.titleize}</b></div>"
    line_item += add_usage self                     unless self.usage.nil?
    line_item += add_duration self unless self.duration.nil?
    line_item += add_yeast_codes ingr_record        unless ingr_record.yeast_code_wl.nil?
    line_item
  end

  def add_usage(ingredient)
    "Add during: #{ingredient.usage.capitalize}"
  end

  def add_duration(ingredient)
    usage_indicator = self.usage == 'boil' ? '@ ' : nil
    ", #{usage_indicator}#{ingredient.duration}"
  end

  def add_yeast_codes(record)
    yeast_codes =  ". WL: WLP#{record.yeast_code_wl}"
    yeast_codes += ", Wy: #{record.yeast_code_wyeast}" unless record.yeast_code_wyeast.nil?
    yeast_codes
  end

  def quantity_unit(type)
    if ['2', '4', '6'].include? type then 'oz'
    elsif type == '3' then 'pk'
    else 'lbs'
    end
  end

  protected

  def nil_if_blank
    NULL_ATTRS.each { |attr| self[attr] = nil if self[attr].blank? }
  end

end
