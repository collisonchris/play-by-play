package com.nfldraftscience.domain

class Drive {
    static belongsTo = [game: Game]
    static hasMany = [plays: Play]
    
    int driveNumber;
    String startingYardLine;
    boolean offTurnover;
    boolean puntFairCaught;
    
}
