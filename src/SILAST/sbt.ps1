# if a local sbt-lanuch.jar exists, use that one
$sbt_jar = "sbt-launch.jar";
$sbt_path = "$(Get-Item .)\$sbt_jar";

$sd = Split-Path (Get-Variable MyInvocation -Scope 0).Value.MyCommand.Path;

if(Test-Path $sbt_path){
    #already assigned
} elseif((Test-Path Variable:\SBT_LAUNCH_JAR) -and (Test-Path $SBT_LAUNCH_JAR)) {
    $sbt_path = $SBT_LAUNCH_JAR;
} elseif((Test-Path "$sd\$sbt_jar")) {
    $sbt_path = "$sd\$sbt_jar";
} elseif((Test-Path Env:\SBT_LAUNCH_JAR) -and  (Test-Path "$(Env:\SBT_LAUNCH_JAR)")) {
    $sbt_path = $Env:SBT_LAUNCH_JAR;
} # else, just hope that sbt_launch.jar is in PATH
java -Xmx512M -Xss512M -jar $sbt_path $args