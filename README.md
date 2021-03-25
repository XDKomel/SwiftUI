# SwiftUIRotationEffect
This is a written on SwiftUI implementation of the rotation effect.

## How to
Just write a modifier <code>.rotationAnimation()</code> and specify such parameters as <code>isRotating</code> and <code>period</code>.  
  
#### What is what
<code>isRotating</code> defines whether the object is rotating now.  
<code>period</code> is the time your view takes to perform a complete turn.  
  
You can easily set any values you want and the model will be correclty updating.

#### Cases of <code>period</code>
<b>Positive values:</b> Spins clockwise  
<b>Negative values:</b> Spins counterclockwise  
<b>0:</b> Stops spinning  

#### Here is some examples of changing the <code>period</code> and <code>isRotating</code>
![RPReplay_Final1616709745-2](https://user-images.githubusercontent.com/35888414/112550521-8e986c80-8dd0-11eb-81c5-80803f4f7f59.gif)
