import React, { Component } from 'react';
import axios from 'axios';
import M from 'materialize-css';

class FormComponent extends Component{
    state = {
        title: '',
        description: '',
        action: '',
        argument: '',
        status: ''
    }

    constructor(props){
        super(props);
        if(props.content){
            this.state = {
                ...props.content
            }
        }
    }

    static getDerivedStateFromProps(props, state) {
        let newState = state;
        if(props.content && state &&  props.content.id !== state.id ) newState = { ...newState, ...props.content}
        if(props.content === undefined && state.id ){
            newState = { 
                id: undefined,
                title: '',
                description: '',
                action: '',
                argument: '',
                status: '',
            }

        } 
        return newState;
    }

    submitForm(event){
        event.preventDefault();
        if(this.state.title && this.state.description){
            this.props.submitForm(this.state)
        } else{
            M.toast({html: 'Você precisa preencher o título e descrição antes de enviar'})
        }
    }

    render(){
        return(
            <>
            <form onSubmit={(event) => this.submitForm(event)} className='client-form' >
                <div className='row'>
                    <div className='right'>
                        <button type='submit' className='btn btn-primary'>Salvar</button>
                    </div>
                </div>
                <div className="row">
                    <div className="col s12 m8 offset-m2">

                        <div className='row'>
                        <input 
                            name='content[id]' 
                            className=''
                            type='hidden'
                            required='required'
                            value={this.state.id}
                        />
                            <div className='col s12'>
                                <label htmlFor='content[title]'>Título</label>
                                <input 
                                    name='content[title]' 
                                    className=''
                                    required='required'
                                    placeholder='Digite o título aqui' 
                                    value={this.state.title || ''}
                                    onChange={(event) => this.setState({title: event.target.value})}
                                />
                            </div>
                            <div className='col s12'>
                                <label htmlFor='content[description]'>Conteúdo</label>
                                <textarea 
                                    name='content[description]' 
                                    className='materialize-textarea'
                                    placeholder='Digite sua descrição' 
                                    value={this.state.description || ''}
                                    onChange={(event) => this.setState({description: event.target.value})}
                                />
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            </>
        )
    }
}

export default FormComponent;