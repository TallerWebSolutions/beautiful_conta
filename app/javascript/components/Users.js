import React from "react";
import PropTypes from "prop-types";

import M from 'materialize-css';


import Form from './users/form';
import Blank from './users/blank';
import Show from './users/show';
import UserItem from './users/item';
import API from '../services/API';

class Users extends React.Component {

  constructor(props){
    super(props);
    this.state = {}
  }

  async componentDidMount(){
    let consult = await API.getUsers();
    if(consult) this.setState({users: consult.users})
  }

  renderContent(){
    switch (this.state.selected) {
      case "user":
        return <Form submitForm={this.submitForm} user={this.state.user} />
      case "form":
        return <Form submitForm={this.submitForm} newForm />
      default:
        return <Blank />
    }
  }

  selectUser = (user) => {
    this.setState({user, selected: 'user'})
  }

  async submitForm(state){
    if(state.id){
      const update = await API.updateUser({ user: state })
      if(update) M.toast({html: "Usuário atualizado com sucesso!"})
    } else {
      const user = await API.createUser({ user: state})
      if(user) location.reload()
    }
  }

  renderList(){
   return (this.state.users || []).map( (user) => {
      return(
        <UserItem selectUser={this.selectUser} key={user.id} user={user} mainState={this.state} />
      )
    })
  }

  render () {
    return (
      <React.Fragment>
        <div className="row tool-content">
          <div className="col s12 m4 left-control">
            <a href="#" onClick={(event)=> { event.preventDefault(); this.setState({user: {}, selected: 'form'}) } } className="btn-default">
              Criar novo usuário
            </a>
            <ul className='left-list'>
              {this.renderList()}
            </ul>
          </div>
          <div className="col s12 m8 right-control">
            <div className="card">
              <div className="card-content">
                {this.renderContent()}
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Users
