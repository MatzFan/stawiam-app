class EntryWorker
  include Sidekiq::Worker

  def perform(params)
    EntryServices::Creator.new(params: params.symbolize_keys).call
  end
end
