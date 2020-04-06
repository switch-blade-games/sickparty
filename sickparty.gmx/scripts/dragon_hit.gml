fent_controller_1.DRAGlife-=1

if(instance_number(dragon_head)=1)
if (dragon_head.DEAD=false)
if(fent_controller_1.DRAGlife<=0){

    dragon_head.DEAD=true
    
    
    with(fent_controller_1){
    alarm[3]=120
    MAKEhands=false
    }
}
