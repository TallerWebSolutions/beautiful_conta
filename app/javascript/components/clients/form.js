import React, { Component } from 'react';
import axios from 'axios';
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
        let new_state = state;
        if(props.user && state &&  props.user.id !== state.id ) new_state = { ...new_state, ...props.user}
        if(props.user === undefined && state.id ){
            new_state = { 
                id: undefined,
                name: '',
                last_name: '',
                email: '',
                phone: '',
                password: '',
                password_confirmation: ''
            }

        } 
        return new_state;
    }

    submitForm(event){
        event.preventDefault();
        if(this.state.password !== this.state.password_confirmation || this.state.password && this.state.password.length < 6){
            M.toast({html: 'A senha e a confirmação precisam ser iguais!'})
        } else if(this.state.email || this.state.phone){
            this.props.submitForm(this.state)
        } else if(!this.state.email && !this.state.phone){
            M.toast({html: 'Você precisa preencher e-mail ou um telefone'})
        }
    }

    async _setZipcode({target: { value }}){
        const numberPattern = /\d+/g;
        const originalValue = value.match(numberPattern).join('');
        let zipcode= originalValue;

        if(originalValue.length >= 6 && originalValue.length <= 8){
            zipcode = `${zipcode.slice(0,5)}-${zipcode.slice(5)}`
            if (originalValue.length == 8){
                const { data: consult } = await axios.get(`https://viacep.com.br/ws/${originalValue}/json`, { headers: '',  withCredentials: false })
                const { logradouro, bairro, localidade, uf } = consult;
                this.setState({ address: logradouro, neighborhood: bairro, city: localidade, state: uf })
            }
        } else if (originalValue.length > 8){
            return false
        } 
        this.setState({zipcode})
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
                            name='client[id]' 
                            className=''
                            type='hidden'
                            required='required'
                            value={this.state.id}
                        />
                            <div className='col s12'>
                                <label htmlFor='client[name]'>Nome</label>
                                <input 
                                    name='client[name]' 
                                    className=''
                                    required='required'
                                    placeholder='Digite o nome do Usuário' 
                                    value={this.state.name || ''}
                                    onChange={(event) => this.setState({name: event.target.value})}
                                />
                            </div>
                            <div className='col s12 m6'>
                                <label htmlFor='client[email]'>E-mail</label>
                                <input 
                                    name='client[email]' 
                                    className=''
                                    type='email'
                                    placeholder='Digite o e-mail do Usuário' 
                                    value={this.state.email || ''}
                                    onChange={(event) => this.setState({email: event.target.value})}
                                />
                            </div>
                            <div className='col s12 m6'>
                                <label htmlFor='client[phone]'>Telefone</label>
                                <input 
                                    name='client[phone]' 
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
                                <label htmlFor='client[password]'>Senha</label>
                                <input 
                                    name='client[password]' 
                                    className='' 
                                    type='password'
                                    placeholder='Digite uma senha para o Usuário' 
                                    required={!!this.props.user ? '' : 'required' }
                                    value={this.state.password}
                                    onChange={(event) => this.setState({password: event.target.value})}
                                />
                            </div>
                            <div className='col s12 m6'>
                                <label htmlFor='client[password_confirmation]'>Confirmação</label>
                                <input 
                                    name='client[password_confirmation]' 
                                    className='' 
                                    type='password'
                                    placeholder='Confirme a senha para o Usuário' 
                                    required={!!this.props.user ? '' : 'required' }
                                    value={this.state.password_confirmation}
                                    onChange={(event) => this.setState({password_confirmation: event.target.value})}
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col s12 m6">
                                <label htmlFor="client[cep]">CEP</label>
                                <input 
                                    name='client[zipcode]' 
                                    className='' 
                                    type='tel'
                                    placeholder='00000-000' 
                                    value={this.state.zipcode}
                                    onChange={(event) => this._setZipcode(event)}
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col s12">
                                <label htmlFor="client[address]">Endereço</label>
                                <input 
                                    name='client[address]' 
                                    className='' 
                                    placeholder='Digite o endereço completo' 
                                    value={this.state.address}
                                    onChange={(event) => this.setState({address: event.target.value})}
                                />
                            </div>
                        </div>
                        <div className="row">
                            <div className="col s12 m6">
                                <label htmlFor="client[number]">Número</label>
                                <input 
                                    name='client[number]' 
                                    className='' 
                                    placeholder='' 
                                    value={this.state.number}
                                    onChange={(event) => this.setState({number: event.target.value})}
                                />
                            </div>
                            <div className="col s12 m6">
                                <label htmlFor="client[state]">Estado</label>
                                <input 
                                    name='client[state]' 
                                    className='' 
                                    placeholder='Estado' 
                                    value={this.state.state || ''}
                                    onChange={(event) => this.setState({state: event.target.value})}
                                />
                            </div>
                        </div>

                        <div className="row">
                            <div className="col s12">
                                <label htmlFor="client[city]">Cidade</label>
                                <input 
                                    name='client[city]' 
                                    className='' 
                                    placeholder='Digite o nome da cidade' 
                                    value={this.state.city || ''}
                                    onChange={(event) => this.setState({city: event.target.value})}
                                />
                            </div>
                        </div>

                        <div className="row">
                            <div className="col s12">
                                <label htmlFor="client[neighborhood]">Bairro</label>
                                <input 
                                    name='client[neighborhood]' 
                                    className='' 
                                    placeholder='Digite o nome do bairro' 
                                    value={this.state.neighborhood}
                                    onChange={(event) => this.setState({neighborhood: event.target.value})}
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