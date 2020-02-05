import React, { Component } from 'react';

class BlankComponent extends Component{
    render(){
        return(
            <div className='component-blank'>
                <span className='linda-icon'>&#xe903;</span>
                <span className='componenet-description'>Selecione um usuário ao lado ou crie um novo para começar</span>
            </div>
        )
    }
}

export default BlankComponent;