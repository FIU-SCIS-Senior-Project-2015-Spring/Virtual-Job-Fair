<h1>Dashboard</h1>
<div class="well">
    <?php 
        $this->widget
                (
            'chartjs.widgets.ChPie', 
            array(
                'width' => 600,
                'height' => 300,
                'htmlOptions' => array(),
                'drawLabels' => true,
                'datasets' => array(
                    array(
                        "value" => $stu,
                        "color" => "rgba(220,30, 70,1)",
                        "label" => "Students"
                    ),
                    array(
                        "value" => $emp,
                        "color" => "rgba(66,66,66,1)",
                        "label" => "Employers"
                    ),
                     array(
                        "value" => $admin,
                        "color" => "rgba(100,80,66,1)",
                        "label" => "Administrator"
                    ),
                ),
                'options' => array()
            )
        ); 
    ?>
  </div>  

<div>
    <?php 
        $this->widget(
            'chartjs.widgets.ChBars', 
            array(
                'width' => 600,
                'height' => 300,
                'htmlOptions' => array(),
                'labels' => array("Student","Active Student","Jobs","Active Jobs"),
                'datasets' => array(
                    array(
                        "fillColor" => "#ff01ff",
                        "strokeColor" => "rgba(220,220,220,1)",
                        "data" => array($stu2, $activestu, $jobs, $activejobs,)
                    )       
                ),
                'options' => array()
            )
        ); 
    ?>
    
</div>