class Api::V1::Admin::DashboardController < Api::V1::AdminController

    def index
        render json: {
            clients: {
                total: User.clients.count,
                cnpj: SmallCompany.count,
                devices: {
                    android: User.clients.android.count,
                    ios: User.clients.ios.count,
                    web: User.clients.web.count,
                }
            },
            overview: {},
            plans: {
                premium: SmallCompany.premiums.count,
                basic: SmallCompany.basics.count
            },
            messages: {
                total: Message.all.count,
                professional: 0,
                primeiro: 0,
                linda: 0
            }
        }, status: 200
    end
end
