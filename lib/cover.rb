require 'rubygems'
require 'rmagick'

class OverlayGenerator
  BACKGROUND_PATH = "./img/background.png"

  attr_reader :text, :annotation, :logo
  private :text, :annotation, :logo

  def initialize(text, logo_path)
    @text = text
    @annotation = Magick::Draw.new.tap do |text|
      text.font = "Library/Fonts/somethingwild-Regular.otf"
      text.pointsize = 90
      # text.font_weight = Magick::BoldWeight
      text.fill = "black"
      text.gravity = Magick::CenterGravity
    end

    @logo = Magick::Image.read(logo_path).first
  end

  def perform
    draw_text
    append_picture
    save_image
  end

  def user_assist
    puts "Enter the text for the overlay"
    text_overlay = gets.chomp
    puts "Enter the logo path"
    logo_overlay = gets.chomp
  end

  private

  def draw_text
    annotation.annotate(background, 0, 0, 0, 60, text)
  end

  def append_picture 
    background.composite!(logo, 420, 20, Magick::OverCompositeOp)
  end

  def save_image
    background.write("./img/generated/generated_image.jpg")
  end

  def background
    @background ||= Magick::Image.read(BACKGROUND_PATH).first
  end
end
