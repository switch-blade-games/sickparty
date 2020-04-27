//argument0 = RATEnoise 0.05
//argument1 = BASErate 0.05
//argument2 = FADEmax 2

rateNOISE=argument0

FADErate=BASEnoise+random(rateNOISE)-random(rateNOISE)
FADEmax=argument2


FADE=random(FADEmax)-random(FADEmax)
