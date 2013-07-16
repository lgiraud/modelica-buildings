within Buildings.Fluid.SolarCollectors.Types;
type NumberSelection = enumeration(
    Number "Number of panels",
    Area "Total panel area") "Enumeration of options for how users will specify the number of solar 
  collectors in a system"
  annotation(Documentation(info="<html>
  Enumeration used to define the different methods of defining solar thermal
  system size.</html>"));