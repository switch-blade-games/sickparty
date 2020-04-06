var i=0;
        
        var SHOTset=SHOOTERnum;
        
        var SLICE=360/SHOOTERnum;
        
        var SETspe=SHOOTERspe;


with(dragon_body)
    if(SHOOTER=true)
    if not(x=0)
    if not(y=0)
    {
    
        
        
            repeat(SHOTset){
            
                var SHOTson=instance_create(x,y,fent_pill);
                
                SHOTson.direction=image_angle+(SLICE*i)
                SHOTson.speed=SETspe
                
                i+=1
            }
}
