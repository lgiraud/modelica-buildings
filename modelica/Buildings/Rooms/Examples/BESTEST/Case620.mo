within Buildings.Rooms.Examples.BESTEST;
model Case620
  "Basic test with light-weight construction and dual-setpoint for heating and cooling with windows on East and West side walls. Fixme: Make object-oriented"
  extends Buildings.Rooms.Examples.BESTEST.Case600(
  roo(
    nConExtWin=2,
    datConExtWin(
      layers={matExtWal, matExtWal},
      each A=6*2.7,
      glaSys={window600, window600},
      each wWin=3,
      each hWin=2,
      each fFra=0.001,
      each til=Z_,
      azi={W_,E_}),
    nConExt=3,
    datConExt(
      layers={roofCase600,matExtWal,matExtWal},
      A={48,8*2.7,8*2.7},
      til={C_,Z_,Z_},
      azi={S_,S_,N_})));

  annotation (__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Rooms/Examples/BESTEST/Case620.mos"
        "Simulate and plot"),
        experiment(
      StopTime=3.1536e+007,
      Interval=3600,
      Tolerance=1e-006,
      Algorithm="Radau"),                  Diagram(coordinateSystem(
          preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
    experimentSetupOutput,
    Documentation(info="<html>
<p>
This model is the case 620 of the BESTEST validation suite.
Case 620 differs from case 600 in that the west and east facing walls
have a window, but there is no window in the south facing wall.
</p>
</html>",
revisions="<html>
<ul>
<li>
July 6, 2012, by Michael Wetter:<br>
Changed implementation to extend from Case 600, rather
than copying Case 600.
This better shows what is different relative to Case 600
as it avoid duplicate code.
</li>
<li>
May 12, 2012, by Kaustubh Phalak:<br>
Modified the Case 600 for implementation of Case 620.
</li>
<li>
October 6, 2011, by Michael Wetter:<br>
First implementation.
</li>
</ul>
</html>"));
end Case620;