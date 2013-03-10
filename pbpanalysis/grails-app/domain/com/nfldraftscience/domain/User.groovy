package com.nfldraftscience.domain

class User {
    static hasMany = [games: Game]
    
    String username;
    
}
