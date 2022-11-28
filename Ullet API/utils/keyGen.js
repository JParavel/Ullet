const chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

export default function genKey(length){

    let key = ""
    for(let i = 0; i < length; i++){
        const index = Math.floor(Math.random()*chars.length);
        const char = chars.at(index);
        key += char;
    }

    return key;

}