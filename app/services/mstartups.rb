require 'open-uri'

class Mstartups < ServiceBase
  attr_accessor :mstartups_rss

  def initialize
    @mstartups_rss = "http://1001startups.fr/feed/"
  end

  def run
    parsing_mstartups(@mstartups_rss)
  end

  private

  def parsing_mstartups(mstartups_rss_url)
    xml_file = open(mstartups_rss_url)
    xml_doc = Nokogiri::XML(xml_file)

    xml_doc.search('item').each do |article|

      # Journalist Parsing
      full_name = article.xpath('dc:creator').text
      full_name.split(" ")

      journalist_data = {
        first_name: full_name.split(" ")[0],
        last_name: full_name.split(" ")[1],
        company: "1001 Startups"
      }

      journalist = Journalist.where(journalist_data).first_or_create

      # Keyword Parsing
      article.xpath('category').each do |k|
        keyword = Keyword.where(name: k.text).first_or_create
        kjist = journalist.keyword_counts.find_or_create_by(keyword: keyword)
        kjist.count += 1
        kjist.save
      end

      # Article Parsing
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
