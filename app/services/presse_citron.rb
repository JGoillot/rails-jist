require 'open-uri'

class PresseCitron < ServiceBase
  attr_accessor :presse_citron_rss

  def initialize
    @presse_citron_rss = "http://www.presse-citron.net/feed/"
  end

  def run
    parsing_presse_citron(@presse_citron_rss)
  end

  private

  def parsing_presse_citron(presse_citron_rss_url)
    xml_file = open(presse_citron_rss_url)
    xml_doc = Nokogiri::XML(xml_file)

    xml_doc.search('item').each do |article|

      # Journalist Parsing
      full_name = article.xpath('dc:creator').text

      journalist_data = {
        first_name: full_name.split(" ")[0],
        last_name: full_name.split(" ")[1],
        company: "Presse Citron"
      }
      journalist = Journalist.where(journalist_data).first_or_create

      # Keyword Parsing
      article.xpath('category').each do |k|
        keyword = Keyword.where(name: k.text).first_or_create
        kjist = journalist.keyword_counts.find_or_create_by(keyword: keyword)
        kjist.count += 1
        kjist.save
      end

      # # Article Parsing
      article_data = {
        title: article.xpath('title').text,
        link: article.xpath('link').text,
        writed_at: article.xpath('pubDate').text,
        journalist: journalist
      }

      article = Article.find_or_create_by(article_data)


    end

  end
end
