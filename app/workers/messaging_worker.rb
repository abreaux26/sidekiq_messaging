class MessagingWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default , :retry => 1
  # prepend ClientConnectable

  # sidekiq_options queue: :default

  # def perform(client_id)
  def perform

    ## find all where parent_id is null
    threads = StaffMessage.start_of_thread
    #for each row
    threads.each do |thread|
      #find response row
      response = thread.response
    binding.irb
      until response.response.nil?
        #set thread id
        response.thread = thread
        response.save!

        #find next response row
        response = response.response
      end
    end
  end
end
