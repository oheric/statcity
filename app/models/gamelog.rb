require 'nokogiri'
require 'open-uri'

class GameLogScraper
	include Mongoid::Document

	attr_reader :url, :data, :selector

	def initialize(url)
		@url = url
	end

	def get_class_items(selector)
		doc.css(selector)
	end

	def data
		@doc ||= Nokogiri::HTML(open(url))
	end


end