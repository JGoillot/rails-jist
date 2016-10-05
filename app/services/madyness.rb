require 'open-uri'

class Madyness < ServiceBase
  attr_accessor :madyness_rss

  def initialize
    @madyness_rss = "https://www.maddyness.com/feed/"
  end

  def run
    parsing_madyness(@madyness_rss)
  end

  private

  def parsing_madyness(madyness_rss_url)
    xml_file = open(madyness_rss_url)
    xml_doc = Nokogiri::XML(xml_file)

    xml_doc.search('item').each do |article|


      full_name = article.xpath('dc:creator').text
      full_name.split(" ")

      journalist_data = {
        first_name: full_name.split(" ")[0],
        last_name: full_name.split(" ")[1],
        company: "Madyness"
      }

      Journalist.create(journalist_data)
    end

  end
end
