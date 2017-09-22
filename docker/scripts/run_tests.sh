#/bin/bash
settingsFile=/pandora/LArReco/settings/uboone/PandoraSettings_MicroBooNE.xml
cheatSettingsFile=/pandora/LArReco/settings/development/PandoraSettings_Cheat.xml
geometryFile=/pandora/LArReco/geometry/uboone.xml

# Disable monitoring.
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${settingsFile}
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${cheatSettingsFile}

# Set any SVM files.
svmFile=/pandora/data/PandoraSvm_MicroBooNE_mcc7.xml
alteredSvmPath="$(echo $svmFile | sed -e 's/[\/&]/\\&/g')"
sed -i "s/<SvmFileName>.*<\/SvmFileName>/<SvmFileName>${alteredSvmPath}<\/SvmFileName>/g" ${settingsFile}
sed -i "s/<SvmFileName>.*<\/SvmFileName>/<SvmFileName>${alteredSvmPath}<\/SvmFileName>/g" ${cheatSettingsFile}

# Run nu samples with neutrino script.
for f in /pandora/data/samples/nu/*.pndr
do
    echo $f
    /pandora/LArReco/bin/PandoraInterface -r AllHitsNu -i $settingsFile -e $f -g $geometryFile > /dev/null
done

# Run cosmic samples with cosmic and cheat scripts.
for f in /pandora/data/samples/cosmic/*.pndr
do
    echo $f
    /pandora/LArReco/bin/PandoraInterface -r Full -i $settingsFile -e $f -g $geometryFile > /dev/null
    /pandora/LArReco/bin/PandoraInterface -r Full -i $cheatSettingsFile -e $f -g $geometryFile > /dev/null
done
