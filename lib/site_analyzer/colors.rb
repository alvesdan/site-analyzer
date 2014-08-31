module SiteAnalyzer
  module Colors
    def order_colors(colors)
      colors.sort_by { |color| rgb_to_hue(*hex_to_rgb(color)) }
    end

    private

    def hex_to_rgb(hex)
      hex = hex.to_s.split('').map { |c| "#{c}"*3 }.join('') if hex.length < 6
      /(?<r>..)(?<g>..)(?<b>..)/ =~ hex
      [r,g,b].map { |cs| cs.to_i(16) }
    end

    def rgb_to_hue(r,g,b)
      r_ = r / 255.0
      g_ = g / 255.0
      b_ = b / 255.0
      c_min = [r_,g_,b_].min
      c_max = [r_,g_,b_].max
      delta = (c_max - c_min).to_f

      hue = 60 * ((g_ - b_)/delta % 6) if c_max == r_
      hue = 60 * ((b_ - r_)/delta + 2) if c_max == g_
      hue = 60 * ((r_ - g_)/delta + 4) if c_max == b_
      return hue.nan? ? 0 : hue
    end
  end
end
