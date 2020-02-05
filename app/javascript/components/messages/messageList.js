import React, { Component } from 'react';

class MessageListComponent extends Component{
    constructor(props){
        super(props);
        const { user } = props;
        this.state = {
            user, messages: user.messages
        }
    }

    static getDerivedStateFromProps(props, state){
        let newState = {};
        if(props.user && props.user !== state.user ) newState = { ...newState, user: props.user, messages: props.user.messages }
        return newState;
    }

    renderMessages(){
        return this.state.messages.map( message => (
            <div key={message.id} className={`message-item ${!message.reply_from && 'customer-message'}`}>
                {!!message.original_json && <div className='message-tooltip'>{message.original_json}</div>}
                {message.text}
            </div>
        ))
    }
    render(){
        return(
            <div className='component-blank'>
                <div className="header-user">

                </div>
                <div className="message-list">
                    {this.renderMessages()}
                </div>
            </div>
        )
    }
}

export default MessageListComponent;