require 'net/http'
require 'net/https'
require 'json'

module IssueListener

  class Hooks < Redmine::Hook::ViewListener

    def controller_issues_edit_after_save(context={})

      data = {
          issueid: context[:issue][:id],
          userid: context[:issue][:author_id],
          datetime: context[:issue][:updated_on].to_time.strftime("%Y-%d-%m %H:%M:%S"),
      }

      send_post_req(data)

    end

    def send_post_req(data)

      # type values for post request
      host = ''
      port = ''
      path = ''
      # later comment return
      return

      body ={data: data}.to_json
      request = Net::HTTP::Post.new(path, initheader = {'Content-Type' => 'application/json'})
      request.body = body
      response = Net::HTTP.new(host, port).start { |http| http.request(request) }
      puts "Response #{response.code} #{response.message}: #{response.body}"


    end

  end

end
