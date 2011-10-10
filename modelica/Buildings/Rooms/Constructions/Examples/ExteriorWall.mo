within Buildings.Rooms.Constructions.Examples;
model ExteriorWall "Test model for an exterior wall without a window"
  import Buildings;
  extends Modelica.Icons.Example;

  Buildings.Rooms.Constructions.Construction conExt[1](
    A={10*3},
    layers={extConMat},
    til={Buildings.HeatTransfer.Types.Tilt.Wall})
    "Construction of an exterior wall without a window"
    annotation (Placement(transformation(extent={{0,-64},{60,-4}})));
  Buildings.Rooms.BaseClasses.ExteriorBoundaryConditions bouConExt(
    nCon=1,
    linearizeRadiation = false,
    absIR={0.5},
    azi={0},
    AOpa={1},
    absSol={0.5},
    lat=0.73268921998722,
    conMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature,
    til={Buildings.HeatTransfer.Types.Tilt.Wall})
    "Exterior boundary conditions for constructions without a window"
    annotation (Placement(transformation(extent={{76,-80},{116,-40}})));
  Buildings.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-120,10},{-100,30}})));
  Buildings.HeatTransfer.Convection.Interior con[
                              1](A={3*10}, til={Buildings.HeatTransfer.Types.Tilt.Wall})
    "Model for heat convection"
    annotation (Placement(transformation(extent={{-20,10},{-40,30}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector theCol(m=1)
    "Thermal collector to link a vector of models to a single model"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,20})));
  BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam=
        "Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")
    annotation (Placement(transformation(extent={{100,60},{120,80}})));
  Modelica.Blocks.Sources.Constant TRoo(k=273.15 + 20) "Room air temperature"
    annotation (Placement(transformation(extent={{-180,10},{-160,30}})));
  HeatTransfer.Data.OpaqueConstructions.Insulation100Concrete200 extConMat
    "Record for material layers"
    annotation (Placement(transformation(extent={{-160,60},{-140,80}})));

equation
  connect(prescribedTemperature.port, theCol.port_b) annotation (Line(
      points={{-100,20},{-90,20},{-90,20},{-80,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(theCol.port_a, con.fluid) annotation (Line(
      points={{-60,20},{-50,20},{-50,20},{-40,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(weaDat.weaBus, bouConExt.weaBus) annotation (Line(
      points={{120,70},{140,70},{140,-58.6},{110.867,-58.6}},
      color={255,204,51},
      thickness=0.5,
      smooth=Smooth.None));
  connect(TRoo.y, prescribedTemperature.T) annotation (Line(
      points={{-159,20},{-122,20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(con.solid, conExt.opa_b) annotation (Line(
      points={{-20,20},{60.2,20},{60.2,-14}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(bouConExt.opa_a, conExt.opa_a) annotation (Line(
      points={{76,-46.6667},{44,-46.6667},{44,-46},{-1.66533e-15,-46},{
          -1.66533e-15,-14}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (
    __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Rooms/Constructions/Examples/ExteriorWall.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-200,-100},{200,
            100}}), graphics),
    Documentation(info="<html>
This model tests the exterior construction without windows.
</html>"));
end ExteriorWall;