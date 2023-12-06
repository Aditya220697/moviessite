require 'nokogiri'
require 'open-uri'

namespace :movie_scraper do
    task :Scrap , [:arg1] => :environment do |args|
            site_link = args[:arg1]        
            doc = Nokogiri::HTML(URI.open(site_link))

            doc.css('.site-content .entries .blog-entry .blog-entry-inner').each do |element|  
                more_link= element.css('.thumbnail a').attr('href').value if(element.css('.thumbnail a').attr('href')).present?
                
                next if more_link.nil?
                inner_doc = Nokogiri::HTML(URI.open(more_link)) 
                title = inner_doc.css('.entry-title').text.strip if(inner_doc.css('.entry-title')).present?
                short_title = inner_doc.css('.imdbwp__title').text.strip if(inner_doc.css('.imdbwp__title')).present?
                rating = inner_doc.css('.imdbwp__rating').text.strip if(inner_doc.css('.imdbwp__rating')).present?
                thumbnail = inner_doc.css('.imdbwp__img').attr('src').value if(inner_doc.css('.imdbwp__img').attr('src')).present?
                imdb_link = inner_doc.css('.imdbwp__link').attr('href').value if(inner_doc.css('.imdbwp__link').attr('href')).present?
                genre = inner_doc.css('.imdbwp__meta').children[2].text.strip if(inner_doc.css('.imdbwp__meta').children[2]).present? 
                date = inner_doc.css('.imdbwp__meta').children[4].text.strip if(inner_doc.css('.imdbwp__meta').children[4]).present?
                short_description = inner_doc.css('.imdbwp__teaser').text.strip if(inner_doc.css('.imdbwp__teaser')).present?
                director = inner_doc.css('.imdbwp__footer').children[2].text.strip if(inner_doc.css('.imdbwp__footer').children[2]).present?
                creator = inner_doc.css('.imdbwp__footer').children[6].text.strip if(inner_doc.css('.imdbwp__footer').children[6]).present?
                actors = inner_doc.css('.imdbwp__footer').children[10].text.strip if (inner_doc.css('.imdbwp__footer').children[10]).present?
                story = inner_doc.css('.featured__copy').text.strip if(inner_doc.css('.featured__copy')).present?
                mobile_hd_download_link = inner_doc.css('.maxbutton-3').attr('href').value if (inner_doc.css('.maxbutton-3').attr('href')).present?
                medium_hd_download_link = inner_doc.css('.maxbutton-4').attr('href').value if (inner_doc.css('.maxbutton-4').attr('href')).present?
                full_hd_download_link = inner_doc.css('.maxbutton-5').attr('href').value if (inner_doc.css('.maxbutton-5').attr('href')).present?
                trailer_link = inner_doc.css('iframe').attr('src').value if(inner_doc.css('iframe').attr('src')).present?
                
            
            data_hash = {
                title: title,
                short_title: short_title,
                rating: rating,
                thumbnail: thumbnail,
                imdb_link: imdb_link,
                genre: genre,
                date: date,
                short_description: short_description,
                director: director,
                creator: creator,
                actors: actors,
                story: story,
                mobile_hd_download_link: mobile_hd_download_link,
                medium_hd_download_link: medium_hd_download_link,
                full_hd_download_link: full_hd_download_link,
                trailer_link: trailer_link
            }
            detail = Movie.where(short_title: short_title).first_or_initialize
            detail.update(data_hash)
            puts "done "
        end
    end
    task drama: :environment do
        (1..20).each do |i|
          link = if i > 1
                   "https://allmovieshub.bar/drama/page/#{i}/"
                 else
                   "https://allmovieshub.bar/drama/"
                 end
          Rake::Task['movie_scraper:Scrap'].invoke(link)
          puts "Drama genre Scraped"
        end
    end
end
