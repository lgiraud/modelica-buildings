within Buildings.HeatTransfer.WindowsBeta.BaseClasses.Examples;
model GasConvection "Test problem for convection in the gas layer"
  import Buildings;
  Buildings.HeatTransfer.WindowsBeta.BaseClasses.GasConvection conVer(
    A=1,
    linearize=false,
    gas=Buildings.HeatTransfer.Data.Gases.Air(x=0.1),
    til=1.5707963267949) "Model for gas convection in vertical gap"
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Sources.Ramp TBC(
    duration=1,
    offset=283.15,
    height=20) "Boundary condition for temperature"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_a1
    "Exterior-side temperature"
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_b1(T=293.15)
    "Room-side temperature"
                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,30})));
  Modelica.Blocks.Sources.Constant u(k=1) "Shading control signal"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Buildings.HeatTransfer.WindowsBeta.BaseClasses.GasConvection conCei(
    A=1,
    linearize=false,
    gas=Buildings.HeatTransfer.Data.Gases.Air(x=0.1),
    til=0) "Model for gas convection in horizontal gap in a ceiling"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,-30})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_a2
    "Exterior-side temperature"
    annotation (Placement(transformation(extent={{-40,-20},{-20,0}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_b2(T=293.15)
    "Room-side temperature"
                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-50})));
  Buildings.HeatTransfer.WindowsBeta.BaseClasses.GasConvection conFlor(
    A=1,
    linearize=false,
    gas=Buildings.HeatTransfer.Data.Gases.Air(x=0.1),
    til=1.5707963267949)
    "Model for gas convection in horizontal gap in a floor"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-110})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T_a3
    "Exterior-side temperature"
    annotation (Placement(transformation(extent={{-40,-140},{-20,-120}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T_b3(T=293.15)
    "Room-side temperature"
                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={50,-90})));
equation
  connect(TBC.y, T_a1.T)
                        annotation (Line(
      points={{-59,30},{-42,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_a1.port, conVer.port_a)
                                annotation (Line(
      points={{-20,30},{-5.55112e-16,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(conVer.port_b, T_b1.port)
                                annotation (Line(
      points={{20,30},{40,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(u.y, conVer.u)
                      annotation (Line(
      points={{-59,70},{-10,70},{-10,38},{-1,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TBC.y, T_a2.T)
                        annotation (Line(
      points={{-59,30},{-55.5,30},{-55.5,-10},{-42,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_a2.port, conCei.port_a)
                                annotation (Line(
      points={{-20,-10},{10,-10},{10,-20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(conCei.port_b, T_b2.port)
                                annotation (Line(
      points={{10,-40},{10,-50},{40,-50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(u.y, conCei.u) annotation (Line(
      points={{-59,70},{-10,70},{-10,0},{18,0},{18,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TBC.y, T_a3.T)
                        annotation (Line(
      points={{-59,30},{-55.5,30},{-55.5,-130},{-42,-130}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(T_a3.port, conFlor.port_a)
                                annotation (Line(
      points={{-20,-130},{10,-130},{10,-120}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(conFlor.port_b, T_b3.port)
                                annotation (Line(
      points={{10,-100},{10,-90},{40,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(u.y, conFlor.u) annotation (Line(
      points={{-59,70},{-10,70},{-10,-126},{2,-126},{2,-121}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (Commands(file="GasConvection.mos" "run"),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-140},{100,
            100}}), graphics),
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-140},{100,
            100}})));
end GasConvection;