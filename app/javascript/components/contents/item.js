import React, { Component } from 'react';

class ContentItemComponent extends Component{
    render(){
        return(
            <li onClick={ () => this.props.selectContent(this.props.content) } className={ this.props.mainState.content === this.props.content ? 'active': ''} >
                <span className='user-name'>{this.props.content.title}</span>
                {/* <span className='user-email'>{this.props.content.email}</span> */}
            </li>
        )
    }
}

export default ContentItemComponent;