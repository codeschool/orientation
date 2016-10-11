module Api
  module V1
    class SearchController < ApplicationController
      include ActionView::Helpers::TextHelper

      skip_before_action :verify_authenticity_token
      skip_before_action :authenticate_user!

      before_action :verify_slack_request

      def index
        results = format_results(Article.text_search(params[:text]).limit(5))

        render json: {
          response_type: "in_channel",
          text: "#{pluralize(results.count, 'article')} found:",
          attachments: results
        }
      end

      private

      def format_results(articles)
        articles.decorate.map do |article|
          {
            title: article.title,
            title_link: article_url(article),
            text: article.pg_search_highlight.html_safe,
            color: article.slack_color
          }
        end
      end

      def verify_slack_request
        render nothing: true, status: :unprocessable_entity unless valid_slack_token?
      end

      def valid_slack_token?
        params[:token] == "2ULHdTW5wNGVZGRoSmdX1CVS"
      end
    end
  end
end
