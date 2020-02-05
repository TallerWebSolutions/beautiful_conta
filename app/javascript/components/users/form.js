import React, { Component } from 'react';
import M from 'materialize-css';

class FormComponent extends Component{
    state = {
        name: '',
        last_name: '',
        email: '',
        phone: '',
        password: '',
        password_confirmation: ''
    }

    constructor(props){
        super(props);
        if(props.user){
            this.state = {
                ...props.user
            }
        }
    }

    static getDerivedStateFromProps(props, state) {
        let newState = state;
        if(props.user && state &&  props.user.id !== state.id ) newState = { ...newState, ...props.user}
        if(props.user === undefined && state.id ){
            newState = { 
                id: undefined,
                name: '',
                last_name: '',
                email: '',
                phone: '',
                password: '',
                password_confirmation: ''
            }

        } 
        return newState;
    }

    submitForm(event){
        event.preventDefault();
        if(this.state.password !== this.state.password_confirmation || this.state.password.length < 6){
            M.toast({html: 'A senha e a confirmação precisam ser iguais!'})
        } else if(this.state.email || this.state.phone){
            this.props.submitForm(this.state)
        } else if(!this.state.email && !this.state.phone){
            M.toast({html: 'Você precisa preencher e-mail ou um telefone'})
        }
    }

    render(){
        return(
            <>
            <form onSubmit={(event) => this.submitForm(event)}>
                <div className='row'>
                    <div className='right'>
                        <button type='submit' className='btn btn-primary'>Salvar</button>
                    </div>
                </div>
                <div className='row'>
                <input 
                    name='user[id]' 
                    className=''
                    type='hidden'
                    required='required'
                    value={this.state.id}
                />
                    <div className='col s12 m6'>
                        <label htmlFor='user[name]'>Nome</label>
                        <input 
                            name='user[name]' 
                            className=''
                            required='required'
                            placeholder='Digite o nome do Usuário' 
                            value={this.state.name || ''}
                            onChange={(event) => this.setState({name: event.target.value})}
                        />
                    </div>
                    <div className='col s12 m6'>
                        <label htmlFor='user[last_name]'>Sobrenome</label>
                        <input 
                            name='user[last_name]' 
                            className='' 
                            placeholder='Digite o sobrenome do Usuário' 
                            required='required'
                            value={this.state.last_name || ''}
                            onChange={(event) => this.setState({last_name: event.target.value})}
                        />
                    </div>
                    <div className='col s12 m6'>
                        <label htmlFor='user[email]'>E-mail</label>
                        <input 
                            name='user[email]' 
                            className=''
                            type='email'
                            placeholder='Digite o e-mail do Usuário' 
                            value={this.state.email || ''}
                            onChange={(event) => this.setState({email: event.target.value})}
                        />
                    </div>
                    <div className='col s12 m6'>
                        <label htmlFor='user[phone]'>Telefone</label>
                        <input 
                            name='user[phone]' 
                            className='' 
                            type='tel'
                            placeholder='Digite o telefone do Usuário' 
                            value={this.state.phone || ''}
                            onChange={(event) => this.setState({phone: event.target.value})}
                        />
                    </div>
                </div>
                <div className='row'>
                    <div className='col s12 m6'>
                        <label htmlFor='user[password]'>Senha</label>
                        <input 
                            name='user[password]' 
                            className='' 
                            type='password'
                            placeholder='Digite uma senha para o Usuário' 
                            required='required'
                            value={this.state.password}
                            onChange={(event) => this.setState({password: event.target.value})}
                        />
                    </div>
                    <div className='col s12 m6'>
                        <label htmlFor='user[password_confirmation]'>Confirmação</label>
                        <input 
                            name='user[password_confirmation]' 
                            className='' 
                            type='password'
                            placeholder='Confirme a senha para o Usuário' 
                            required='required'
                            value={this.state.password_confirmation}
                            onChange={(event) => this.setState({password_confirmation: event.target.value})}
                        />
                    </div>
                </div>
            </form>
            </>
        )
    }
}

export default FormComponent;