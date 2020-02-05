import axios from 'axios'; 
const csrfToken = document.querySelector('[name=csrf-token]').content
axios.defaults.headers.common['X-CSRF-TOKEN'] = csrfToken
export default {

    async getDashboard(){
        const consult = await axios.get('/api/v1/admin/dashboard' )
        .then( response => response )
        .catch( err => console.log('error getDashboard ', err))
        if(consult){
            return consult.data
        }
    },
    async createUser(body){
        const consult = await axios.post('/api/v1/admin/users', body )
        .then( response => response )
        .catch( err => console.log('error createUser ', err))
        if(consult){
            return consult.data
        }
    },

    async updateUser(body){
        const consult = await axios.put(`/api/v1/admin/users/${body.user.id}`, body)
        .then( response => response )
        .catch( err => console.log('error updateUser ', err))
        if(consult){
            return consult.data
        }
    },

    async getUsers(){
        const consult = await axios.get('/api/v1/admin/users')
        .then(response => response)
        .catch( err => console.log('err getUsers ', err))

        if(consult){
            return consult.data
        }
    },
    async getClients(){
        const consult = await axios.get('/api/v1/admin/clients')
        .then(response => response)
        .catch( err => console.log('err getClients ', err))

        if(consult){
            return consult.data
        } 
    },
    async createClients(body){
        const consult = await axios.post('/api/v1/admin/clients', body )
        .then( response => response )
        .catch( err => console.log('error createClients ', err))
        if(consult){
            return consult.data
        }
    },
    async getMessages(){
        const consult = await axios.get('/api/v1/admin/messages')
        .then(response => response)
        .catch( err => console.log('err getMessages ', err))

        if(consult){
            return consult.data
        } 
    },
    async getContents(){
        const consult = await axios.get('/api/v1/admin/contents')
        .then(response => response)
        .catch( err => console.log('err getContents ', err))

        if(consult){
            return consult.data
        } 
    },
    async createContent(body){
        const consult = await axios.post('/api/v1/admin/contents', body )
        .then( response => response )
        .catch( err => console.log('error createContent ', err))
        if(consult){
            return consult.data
        }
    },

    async updateContent(body){
        const consult = await axios.put(`/api/v1/admin/contents/${body.content.id}`, body)
        .then( response => response )
        .catch( err => console.log('error updateContent ', err))
        if(consult){
            return consult.data
        }
    },
    async replyMessage(body){
        const consult = await axios.post('/api/v1/admin/messages', body )
        .then( response => response )
        .catch( err => console.log('error replyMessage ', err))
        if(consult){
            return consult.data
        }
    }
}