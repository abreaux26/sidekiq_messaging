class GlobalClientMessagingWorker
  include Sidekiq::Worker

  def perform
    Client.active.pluck(:database_key).each do |database_key|
      MessagingWorker.perform_async(database_key)
    end
  end
end
