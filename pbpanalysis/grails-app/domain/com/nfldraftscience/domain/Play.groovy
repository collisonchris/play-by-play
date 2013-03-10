package com.nfldraftscience.domain

class Play {
    static belongsTo = [drive: Drive]
    
    String down;
    String yardsToGo;
    int playNumber;
    int yardsGained;
    String notes;
    
}
