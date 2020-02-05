import React, { Component } from 'react';

class ShowComponent extends Component{
    render(){
        console.log('user ==> ', this.props.user)
        return(
            <>mostrar</>
        )
    }
}

export default ShowComponent;