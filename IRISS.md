# IRISS-specific Matlab Code

### Inverse Kinematics
Given a point `p = [px py pz]` (in \[mm\] in the {IRISS} frame), the inverse kinematics of the IRISS are given by:

```matlab
t1 = -rad2deg(atan2(py, pz));
t2 = -rad2deg(atan2(px, sqrt(py^2 + pz^2)));
d3 = sqrt(px^2 + py^2 + pz^2);
```

where `t1` and `t2` are in \[°\] and `d3` is in [mm]. 
