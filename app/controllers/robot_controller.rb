class RobotController < BasicsController

    def show
        @robot = Robot.first || Robot.create
    end

    def update
        @robot = Robot.first
        if @robot.update(robot_params)
            redirect_to robot_path, notice: 'Dados do Robô atualizado com sucesso!'
        else
            redirect_to robot_path, notice: 'Houve um erro na sua solicitação. Tente novamente.'
        end
    end

    private
    def robot_params
        params.require(:robot).permit(:robot_type, :apikey, :service_url, :version, :skill_id, :skill_name, :assistant_id, :assistant_name, :assistant_url)
    end
end
