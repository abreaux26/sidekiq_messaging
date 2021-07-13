class MessagingWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default , :retry => 1
  # prepend ClientConnectable

  # sidekiq_options queue: :default

  # def perform(client_id)
  def perform
    threads = StaffMessage.start_of_thread

    threads.each do |thread|
      response = thread.response

      until response.blank?
        response.thread = thread if response.thread.blank?
        response.save!

        response = response.response
      end
    end
  end
end
