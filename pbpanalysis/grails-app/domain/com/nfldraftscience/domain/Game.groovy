package com.nfldraftscience.domain

class Game {
    static hasMany = [drives: Drive]
    
    Date date;
    String opponent;
    
}
