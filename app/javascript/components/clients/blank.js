import React, { Component } from 'react';

class BlankComponent extends Component{
    render(){
        return(
            <div className='component-blank'>
                <span className='linda-icon'>&#xe900;</span>
                <span className='componenet-description'>Selecione um cliente ao lado ou crie um novo para começar</span>
            </div>
        )
    }
}

export default BlankComponent;