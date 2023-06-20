// Tugas UAS TVG Genap 2022/2023
// Nama: Aufa Nasywa Rahman 
// NIM:  21/475255/TK/52454

#include "colors.inc"

global_settings{ assumed_gamma 1.8 max_trace_level 12 }

camera{ 
        location  <20,40,28>  
        angle 40 
        look_at   <0,2,0>
      } 
      
// Lighting
// Desc: two lighting source with one shadowless        
light_source { <-140,200, 300> rgb <1.0, 1.0, 0.95> * 1.5 }
light_source { < 140,200,-300> rgb <0.9, 0.9, 1.00> * 0.9 shadowless }

// Carpet
// Desc: base pigment that act as a carpet 
#declare Carpet_Texture =
    texture {
        pigment {
            gradient x
            color_map {
                [0.0, rgb <0.01, 0.59, 0.81>]
                [0.5, rgb <0.01, 0.59, 0.81>]
                [0.5, rgb <0.98, 0.98, 0.87>]
                [1.0, rgb <0.98, 0.98, 0.87>]
            }
            warp {
                turbulence 0.05 octaves 2
            }
        }
        normal {
            quilted 0.6 scale 0.025 warp {
                turbulence 0.05 octaves 2
            }
        }
        scale 5
        translate <0, -50, 0>
    }

#declare Carpet =
    cylinder {
        0, y*-1, 50
        texture { Carpet_Texture }
    }

object { Carpet }

// Donut
// Desc: Strawberry flavored Donut with some sprinkles
#declare Donut =
union {
    difference {
        torus {
            2.5, 1.25
            rotate -180*x
            pigment { rgb <0.96, 0.76, 0.38> } 
            finish {
                ambient 0.3
                diffuse 0.7
                specular 0.5
                reflection 0.3
                brilliance 1.5
            }
            texture {
                pigment {
                    bozo turbulence 0.5 scale 0.1
                    color_map {
                        [0.0, rgb <0.42, 0.97, 0.88>*1.2] 
                        [0.5, rgb <0.76, 0.38, 0.54>*1.2]
                        [1.0, rgb <0.42, 0.97, 0.88>*0.9]
                    }
                }
                normal {
                    wrinkles 0.1 scale 0.2
                }
            }
        }
        
    }
} 

object { Donut translate <1.25, 0.5, 0.4> } 

// Plate
// Desc: Plate to put Donut      
#declare Plate =
union {
    difference {
        cylinder { <0, -0.5, 0>, <0, 0.2, 0>, 7 }
        cylinder { <0, 0, 0>, <0, 0.25, 0>, 5.5 }
    }
    texture {
        pigment {
            rgb <0.95, 0.95, 0.95>
        }
        finish {
            ambient 0.2
            diffuse 0.8
            reflection 0.1
        }
    }
}

object { Plate translate <1.5, 0.5, 0> }   


// Lollipop
// Desc: Lollipop contains of candy and its stick
#declare Stick_Texture =
    texture {
        pigment {
            rgb <1, 1, 1>
        }
        finish {
            ambient 0.2
            diffuse 0.8
        }
    }


#declare Stick =
    cylinder { <0, 0, 0>, <0, 10, 0>, 0.2 texture { Stick_Texture } translate <0, -5, 0> }

#declare Candy =
    merge {
        disc { <0, 8, 0>, <1, 0, 0>, 3 pigment { rgb <1, 1, 1> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 2.75 pigment { rgb <1, 0.5, 0.8> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 2.5 pigment { rgb <1, 1, 1> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 2.25 pigment { rgb <1, 0.5, 0.8> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 2 pigment { rgb <1, 1, 1> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 1.75 pigment { rgb <1, 0.5, 0.8> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 1.5 pigment { rgb <1, 1, 1> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 1.25 pigment { rgb <1, 0.5, 0.8> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 1 pigment { rgb <1, 1, 1> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 0.75 pigment { rgb <1, 0.5, 0.8> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 0.5 pigment { rgb <1, 1, 1> } finish {
            ambient 0.2
            diffuse 0.8
        } }
        disc { <0, 8, 0>, <1, 0, 0>, 0.25 pigment { rgb <1, 0.5, 0.8> } finish {
            ambient 0.2
            diffuse 0.8
        } }
    }


#declare Lollipop =
    union {
        object { Stick }
        object { Candy }
    }

object { Lollipop rotate x*-90 rotate z*90 translate <-10, 0.5, 2> }

// Cup on top of Plate
// Desc: Cup of coffe and small plate below it
#declare Cup =
union {
   difference {
      cylinder { <0,1.2,0>, <0,3.5,0>, 2 } 
      cylinder { <0,1,0>, <0,3.8,0>, 1.8 }
   }


   difference { 
      cylinder { <0,1.4,0>, <0,3,0>, 1.8 }
      torus { 3.6, 0.2 translate y*3 }
      cylinder { <0,2.8,0>, <0,3.3,0>, 1.6 }
      pigment { Brown*0.8 filter 0.5 }
      finish { phong 0.7 reflection 0.15 }
      normal { bumps 0.05 scale 1 }
   }

   pigment { White }
   
   finish { 
            ambient 0.2
            diffuse 0.8
            reflection 0.1
          }
}


#declare CupPlate =
union {
    difference {
        cylinder { <0, -0.5, 0>, <0, 0.2, 0>, 3 }
        cylinder { <0, 0, 0>, <0, 0.25, 0>, 2.5 }
    }
    texture {
        pigment {
            rgb <1, 1, 1>
        }
        finish {
            ambient 0.2
            diffuse 0.8
            reflection 0.1
        }
    } 
}

object { Cup translate <-3, 0.2, -9> }
object { CupPlate translate <-3.8, 0, -10> }

#declare Photo =
    union {
        box {
            <5, 0, -10>
            <0, 5, -9.8>
            
            texture {   
                pigment {
                    image_map {
                        jpeg "bg-image.jpg" 
                        map_type 0
                        once        
                    }
                    scale <5, 5, 1>              
                }         
            }
        }
    }                                                  
    
object { Photo }