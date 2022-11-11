const bcrypt = require('bcryptjs');
const helpers = {}

helpers.codificarcontrasenia = async (contrasenia) => {
    const salt = await bcrypt.genSalt(10);
    const hash = await bcrypt.hash(contrasenia, salt);
    return hash;
};

helpers.verificarcontraseña = async (contrasenia, contraseniaGuardada) => {
    try {
        return await bcrypt.compare(contrasenia, contraseniaGuardada);
    } catch (e) {
        console.log(e);
    }
}

module.exports = helpers;