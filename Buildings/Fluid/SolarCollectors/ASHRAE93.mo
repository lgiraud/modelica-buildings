within Buildings.Fluid.SolarCollectors;
model ASHRAE93 "Model of a flat plate solar thermal collector"
  extends Buildings.Fluid.SolarCollectors.BaseClasses.PartialSolarCollector(final perPar=per);
  parameter Buildings.Fluid.SolarCollectors.Data.GenericSolarCollector per
    annotation(choicesAllMatching=true);

  BaseClasses.ASHRAESolarGain solGai(
    final B0=per.B0,
    final B1=per.B1,
    final shaCoe=shaCoe,
    final til=til,
    final nSeg=nSeg,
    final y_intercept=per.y_intercept,
    use_shaCoe_in=use_shaCoe_in,
    final A_c=TotalArea_internal)
    "Identifies heat gained from the sun using standard ASHRAE93 calculations"
             annotation (Placement(transformation(extent={{-20,14},{0,34}})));

  BaseClasses.ASHRAEHeatLoss                 heaLos(
    final nSeg=nSeg,
    final slope=per.slope,
    final y_intercept=per.y_intercept,
    redeclare package Medium = Medium,
    final G_nominal=per.G_nominal,
    dT_nominal=per.dT_nominal,
    final A_c=TotalArea_internal,
    m_flow_nominal=per.mperA_flow_nominal*per.A)
    "Calculates the heat lost to the surroundings using the ASHRAE93 standard calculations"
        annotation (Placement(transformation(extent={{-20,-24},{0,-4}})));

equation
  connect(shaCoe_internal, solGai.shaCoe_in);

  connect(temSen.T, heaLos.TFlu) annotation (Line(
      points={{-8,-68},{-30,-68},{-30,-20},{-22,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weaBus.TDryBul, heaLos.TEnv) annotation (Line(
      points={{-100,96},{-88,96},{-88,-8},{-22,-8}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}}));
  connect(HDirTil.inc, solGai.incAng)    annotation (Line(
      points={{-59,26},{-54,26},{-54,20},{-22,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HDirTil.H, solGai.HDirTil)    annotation (Line(
      points={{-59,30},{-52,30},{-52,26},{-22,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HDifTilIso.HGroDifTil, solGai.HGroDifTil) annotation (Line(
      points={{-59,52},{-50,52},{-50,28.8},{-22,28.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HDifTilIso.HSkyDifTil, solGai.HSkyDifTil) annotation (Line(
      points={{-59,64},{-48,64},{-48,32},{-22,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(shaCoe_in, solGai.shaCoe_in) annotation (Line(
      points={{-120,26},{-94,26},{-94,16},{-22,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heaLos.QLos, product2.u1) annotation (Line(
      points={{1,-14},{38,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(solGai.QSol_flow, product1.u2) annotation (Line(
      points={{1,24},{38,24}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}),
            graphics),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}}),
         graphics={
        Rectangle(
          extent={{-84,100},{84,-100}},
          lineColor={27,0,55},
          fillColor={26,0,55},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,0},{-76,0},{-76,-90},{66,-90},{66,-60},{-64,-60},{-64,
              -30},{66,-30},{66,0},{-64,0},{-64,28},{66,28},{66,60},{-64,60},{
              -64,86},{78,86},{78,0},{98,0},{100,0}},
          color={0,128,255},
          thickness=1,
          smooth=Smooth.None),
        Ellipse(
          extent={{-24,26},{28,-26}},
          lineColor={255,255,0},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-6,-6},{8,8}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1,
          origin={-24,30},
          rotation=90),
        Line(
          points={{-50,0},{-30,0}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{-36,-40},{-20,-24}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{-10,0},{10,0}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1,
          origin={2,-40},
          rotation=90),
        Line(
          points={{-8,-8},{6,6}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1,
          origin={30,-30},
          rotation=90),
        Line(
          points={{32,0},{52,0}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1),
        Line(
          points={{-8,-8},{6,6}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1,
          origin={28,32},
          rotation=180),
        Line(
          points={{-10,0},{10,0}},
          color={255,255,0},
          smooth=Smooth.None,
          thickness=1,
          origin={0,40},
          rotation=90)}),
    defaultComponentName="solCol",
    Documentation(info="<html>
<h4>Overview</h4>
<p>
This component models the solar thermal collector according to the ASHRAE93
test standard.
</p>
 <h4>Notice</h4>
 <ul>
 <li>
 As mentioned in EnergyPlus 7.0.0 Engineering Reference, the SRCC incident angle modifier 
 equation coefficients are only valid for incident angles of 60 degrees or less. 
 Because these curves behave poorly for angles greater than 60 degrees 
 the model does not calculate either direct or diffuse solar radiation gains
 when the incidence angle is greater than 60 degrees.  
 </li>
 <li>
 By default, the estimated heat capacity of the collector without fluid is calculated based 
 on the dry mass and the specific heat capacity of copper.
 </li>
 </ul>
 <h4>References</h4>
 <p>
 <a href=\"http://www.energyplus.gov\">EnergyPlus 7.0.0 Engineering Reference</a>, October 13, 2011. <br/>
 </p>
 </html>", revisions="<html>
<ul>
<li>
January 4, 2013, by Peter Grant:<br/>
First implementation.
</li>
</ul>
</html>"));
end ASHRAE93;