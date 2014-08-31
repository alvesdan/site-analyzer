class AnalysesController < ApplicationController
  respond_to :html, :json

  before_action :validate_html, only: [:show]

  def create
    analysis.save
    respond_with analysis, location: analysis_path(analysis)
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: html_document.to_h }
    end if stale?(analysis)
  end

  protected

  def analysis
    @analysis ||= params[:id] ? Analysis.find_by(shortened_url: params[:id]) : Analysis.find_or_create_by(url: analysis_params[:url])
  end
  helper_method :analysis

  def analysis_params
    return {} unless params[:analysis]
    params.require(:analysis).permit(:url)
  end

  def html_body
    @html_body ||= Rails.cache.fetch("#{analysis.id}-body", expires_in: 1.hour) do
      HTTParty.get(analysis.url).body
    end
  end

  def html_document
    return @html_document if @html_document
    @html_document ||= SiteAnalyzer::HTML.new(analysis.url, html_body)
  end
  helper_method :html_document

  def validate_html
    return if html_body =~ /html/ && html_body =~ /<\/html>/
    flash[:error] = "Couldn't read \"#{analysis.url}\""
    analysis.destroy
    redirect_to root_path
  end
end
