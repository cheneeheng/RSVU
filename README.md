# RSVU
Challenge repo.

--
Notes:

* Votenet takes in x,y,z,h as input.
  +x is right, +y is forward, and +z is up.
* After preprocessing, h is floor height and z = z-h
* After postprocessing the output from votenet is flipped.
  +x is right, +y is down, and +z is forward.
* All of the coordinates are w.r.t. the camera/depth origin.


