import React from "react";
import PropTypes from "prop-types";

import M from 'materialize-css';


import Form from './contents/form';
import Blank from './contents/blank';
import ContentItem from './contents/item';
import API from '../services/API';

class Contents extends React.Component {

  constructor(props){
    super(props);
    this.state = {}
  }

  async componentDidMount(){
    let { contents } = await API.getContents() || {};
    if(contents) this.setState({contents})
  }

  renderContent(){
    switch (this.state.selected) {
      case "content":
        return <Form submitForm={this.submitForm} content={this.state.content} />
      case "form":
        return <Form submitForm={this.submitForm} newForm />
      default:
        return <Blank />
    }
  }

  selectContent = (content) => {
    this.setState({content, selected: 'content'})
  }

  async submitForm(state){
    if(state.id){
      const update = await API.updateContent({ content: state })
      if(update) M.toast({html: "Conteúdo atualizado com sucesso!"})
    } else {
      const user = await API.createContent({ content: state})
      if(user) location.reload()
    }
  }

  renderList(){
   return (this.state.contents || []).map( (content) => {
      return(
        <ContentItem selectContent={this.selectContent} key={content.id} content={content} mainState={this.state} />
      )
    })
  }

  render () {
    return (
      <React.Fragment>
        <div className="row tool-content">
          <div className="col s12 m4 left-control">
            <a href="#" onClick={(event)=> { event.preventDefault(); this.setState({content: {}, selected: 'form'}) } } className="btn-default">
              Criar novo conteúdo
            </a>
            <ul className='left-list'>
              {this.renderList()}
            </ul>
          </div>
          <div className="col s12 m8 right-control">
            <div className="card">
              <div className="card-content">
                {this.renderContent()}
              </div>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}

export default Contents;
