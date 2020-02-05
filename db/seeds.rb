admin = User.where(user_type: "Admin").try(:first)
User.create(
    email: "seu@email.com.br",
    phone: "+55 (11) 99999-9999",
    password: "linda123456",
    user_type: "Admin"
) if admin.blank?

robot = Robot.first 
Robot.create(
    robot_type: "watson",
    apikey: "Y2BWSktzbxC6ouU-rHjviy8MBt3GKm27mOK129J6fohP",
    service_url: "https://gateway.watsonplatform.net/assistant/api",
    version: "2020-01-01",
    skill_name: "Chat Linda",
    skill_id: "baa5f491-319f-46b1-8a93-6d73fcf82e4c",
    assistant_name: "Linda",
    assistant_id: "6c683355-c40c-456e-aacf-1209e977d5fb",
    assistant_url: "https://gateway.watsonplatform.net/assistant/api/v2/assistants/6c683355-c40c-456e-aacf-1209e977d5fb/sessions"
) if robot.blank?