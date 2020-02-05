import React from "react"
import PropTypes from "prop-types";
import { Bar } from 'react-chartjs-2';

import API from '../services/API';

class Dashboard extends React.Component {
  state = {
    dashboard: {
      clients:{},
      plans:{},
      messages: {}
    }
  }
  async componentDidMount(){
    const dashboard = await API.getDashboard();
    this.setState({dashboard}) 
  }

  clientDevicesData(){
    const { clients: { devices } } = this.state.dashboard;
    const { android, ios, web } = devices || {};
    return {
      labels: ['android', 'ios', 'web'],
      data: [android, ios, web]
    }
  }

  render () {
    console.log('dashboard ==> ', this.state)
    return (
      <React.Fragment>
        <div className="dashboard-content">
            <div className="row">
              <div className="col s12 m6">
                <div className='card dashboard-clientes'> 
                  <div className="card-content">
                    <div className="card-title">
                      Clientes
                    </div>
                    <div className="row">
                      <div className="col s6">
                        <div className="row">
                          <div className="col s12 m8 offset-m2 dashboard-data">
                            <span className="dashboard-total">{this.state.dashboard.clients.total || 0}</span>
                            <span className="dashboard-description">total</span>
                          </div>
                        </div>
                        <div className="row">
                          <div className="col s12 m8 offset-m2 dashboard-data">
                            <span className="dashboard-total">{this.state.dashboard.clients.cnpj || 0}</span>
                            <span className="dashboard-description">com CNPJ</span>
                          </div>
                        </div>
                      </div>
                      <div className="col s6">
                        <Bar 
                          data={this.clientDevicesData()}                          
                          options={{ maintainAspectRatio: false, borderWidth: 0 }}
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className="col s12 m6">
                <div className='card dashboard-overview'>
                  <div className="card-content">
                    <div className="card-title">
                      Overview
                    </div>

                    <div className="row">
                      <div className="col s12"></div>
                    </div>
                    <div className="row">
                      <div className="col s12"></div>
                    </div>
                    <div className="row">
                      <div className="col s12"></div>
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <div className="row">
              <div className="col s12 m6">
                <div className='card dashboard-planos'>
                  <div className="card-content">
                    <div className="card-title">Planos</div>

                    <div className="data-plans">
                      <div className="row">
                        <div className="col s12 m8 offset-m2 dashboard-data">
                          <span className="dashboard-total">{this.state.dashboard.plans.premium || 0}</span>
                          <span className="dashboard-description">clientes premium</span>
                        </div>
                      </div>
                      <div className="row">
                        <div className="col s12 m8 offset-m2 dashboard-data">
                          <span className="dashboard-total">{this.state.dashboard.plans.basic || 0}</span>
                          <span className="dashboard-description">clientes básicos</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className="col s12 m6">
                <div className='card dashboard-mensagens'>
                  <div className="card-content">
                    <div className="card-title">
                      Mensagens
                    </div>

                    <div className="row">
                        <div className="col s6 dashboard-data">
                          <span className="dashboard-total">{this.state.dashboard.messages.total || 0}</span>
                          <span className="dashboard-description">total de atendimentos</span>
                        </div>
                        <div className="col s6"></div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </div>

      </React.Fragment>
    );
  }
}

export default Dashboard
