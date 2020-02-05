import React, { Component } from 'react';

class BlankComponent extends Component{
    render(){
        return(
            <div className='component-blank'>
                <span className='linda-icon'>&#xe904;</span>
                <span className='componenet-description'>Selecione uma mensagem ao lado para começar a responder</span>
            </div>
        )
    }
}

export default BlankComponent;