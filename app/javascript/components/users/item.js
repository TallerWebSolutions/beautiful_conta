import React, { Component } from 'react';

class UserItemComponent extends Component{
    render(){
        return(
            <li onClick={ () => this.props.selectUser(this.props.user) } className={ this.props.mainState.user === this.props.user ? 'active': ''} >
                <span className='user-name'>{this.props.user.name}</span>
                <span className='user-email'>{this.props.user.email}</span>
            </li>
        )
    }
}

export default UserItemComponent;