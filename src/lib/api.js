

let token = "";

if(token==""){
 //   generarToken();
}


function consumirApi(){

    const url = "https://www.universal-tutorial.com/api/states/Colombia";
    const options = {
        method: 'GET',
        headers: {
            'Authorization': 'Bearer ' + token,
            'Accept': 'application/json '
        }
    };
    fetch(url,options)
    .then(response => response.json())
    .then(response => {
        for(let index = 0; index < response.length;index++){
            insertDepartament(response[index].state_name)
        }})
        .catch(err =>{
            generarToken()
            
        });
}
    
function insertDepartament(departament){
    const selectElement = document.getElementById('departaments')
    let insertDepartament = '<option>' + departament +'</option>'
    selectElement.insertAdjacentHTML("beforeend",insertDepartament)
} 

 function generarToken(){
    const optionsToken = {
        method: 'GET',
        headers: {
            'api-token': '_GHun2S5qtWsA_cO2AEcBanxvCWEQ5v4q8niBoD1iskbB27yLf5NCX4rXGy_c4XcrNU',
            'Accept': 'application/json',
            'user-email': 'ANDRETO851@GMAIL.com',
        }

        
    };
    const urlToken = "https://www.universal-tutorial.com/api/getaccesstoken";
    fetch(urlToken,optionsToken)
        .then(res => res.json())
        .then(res => {
            token = res.auth_token
            consumirApi()
            })
        .catch(err => console.error(err));
}