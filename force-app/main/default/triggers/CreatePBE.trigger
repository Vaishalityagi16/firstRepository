trigger CreatePBE on Product2 (after insert) {
    if(Trigger.isinsert && Trigger.isAfter){
        CreatePBE.NewPB(Trigger.New);
    }
}