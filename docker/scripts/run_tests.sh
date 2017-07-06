#/bin/bash
nuSettingsFile=/pandora/LArReco/scripts/uboone/PandoraSettings_MicroBooNE_Neutrino.xml
cosmicSettingsFile=/pandora/LArReco/scripts/uboone/PandoraSettings_MicroBooNE_Cosmic.xml
cheatSettingsFile=/pandora/LArReco/scripts/development/PandoraSettings_Cheat.xml

# Set the geometry file.
geometryFile=/pandora/data/Geometry_MicroBooNE.pndr
alteredGeometryPath="$(echo $geometryFile | sed -e 's/[\/&]/\\&/g')"

sed -i "s/<GeometryFileName>.*<\/GeometryFileName>/<GeometryFileName>${alteredGeometryPath}<\/GeometryFileName>/g" ${nuSettingsFile}
sed -i "s/<GeometryFileName>.*<\/GeometryFileName>/<GeometryFileName>${alteredGeometryPath}<\/GeometryFileName>/g" ${cosmicSettingsFile}
sed -i "s/<GeometryFileName>.*<\/GeometryFileName>/<GeometryFileName>${alteredGeometryPath}<\/GeometryFileName>/g" ${cheatSettingsFile}

# Disable monitoring.
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${nuSettingsFile}
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${cosmicSettingsFile}
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${cheatSettingsFile}

# Set any SVM files.
svmFile=/pandora/data/PandoraSvm_MicroBooNE_mcc7.xml
alteredSvmPath="$(echo $svmFile | sed -e 's/[\/&]/\\&/g')"

sed -i "s/<SvmFileName>.*<\/SvmFileName>/<SvmFileName>${alteredSvmPath}<\/SvmFileName>/g" ${nuSettingsFile}
sed -i "s/<SvmFileName>.*<\/SvmFileName>/<SvmFileName>${alteredSvmPath}<\/SvmFileName>/g" ${cosmicSettingsFile}
sed -i "s/<SvmFileName>.*<\/SvmFileName>/<SvmFileName>${alteredSvmPath}<\/SvmFileName>/g" ${cheatSettingsFile}

# Run nu samples with neutrino script.
for f in /pandora/data/samples/nu/*.pndr
do
    echo $f
    alteredSamplePath="$(echo $f | sed -e 's/[\/&]/\\&/g')"

    sed -i "s/<EventFileName>.*<\/EventFileName>/<EventFileName>${alteredSamplePath}<\/EventFileName>/g" ${nuSettingsFile}
    /pandora/LArReco/bin/PandoraInterface -i $nuSettingsFile -d /pandora/LArReco/detectors/uboone.xml -n 20 > /dev/null
done

# Run cosmic samples with cosmic and cheat scripts.
for f in /pandora/data/samples/cosmic/*.pndr
do
    echo $f
    alteredSamplePath="$(echo $f | sed -e 's/[\/&]/\\&/g')"

    sed -i "s/<EventFileName>.*<\/EventFileName>/<EventFileName>${alteredSamplePath}<\/EventFileName>/g" ${cosmicSettingsFile}
    sed -i "s/<EventFileName>.*<\/EventFileName>/<EventFileName>${alteredSamplePath}<\/EventFileName>/g" ${cheatSettingsFile}
    /pandora/LArReco/bin/PandoraInterface -i $cosmicSettingsFile -d /pandora/LArReco/detectors/uboone.xml -n 20 > /dev/null
    /pandora/LArReco/bin/PandoraInterface -i $cheatSettingsFile -d /pandora/LArReco/detectors/uboone.xml -n 20 > /dev/null
done
