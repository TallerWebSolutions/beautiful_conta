class Robots::Watson
    require "ibm_watson"
    # require "ibm_watson/authenticators"
    # require "ibm_watson/assistant_v2"
    include IBMWatson

    attr_accessor :robot, :assistant

    def initialize robot
        self.robot = robot
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
            apikey: robot.apikey
        )
        self.assistant = IBMWatson::AssistantV2.new(
            version: robot.version,
            authenticator: authenticator
        )
        assistant.service_url = robot.service_url
    end

    def create_session_of_user user
        response = assistant.create_session(assistant_id: robot.assistant_id)
        
        user.update_attributes({session_id: response.result["session_id"]})
        user
    end

    def delete_session_of_user user
    end

    def send_a_message_to_robot message
        user = message.user
        user = create_session_of_user(user)

        response = assistant.message( 
            assistant_id: robot.assistant_id, 
            session_id: user.session_id, 
            input: { text: message.text }, 
            context: nil 
        )
        result = response.result
        puts result
        if result.present? && result["output"].present? && result['output']['intents'].present? && result['output']['intents'][0].present? && result['output']['intents'][0]['confidence'] > 0.85
            watson_reply = result['output']['generic'][0]
            reply = user.messages.create!(
                text: watson_reply['text'],
                status: 'enviada',
                reply_from: 'auto',
                original_json: result.to_json
            ) 
            message.update_attributes!({original_json: result.to_json, status: 'lida'})

        elsif result.present? && result["output"].present?
            message.update_attributes!({original_json: result.to_json, status: 'suporte'})
        end
    end

    private

end