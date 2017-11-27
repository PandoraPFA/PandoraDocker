#/bin/bash
export FW_SEARCH_PATH=/pandora/LArReco/settings:/pandora/data/:$FW_SEARCH_PATH

settingsFile=/pandora/LArReco/settings/PandoraSettings_Master_MicroBooNE.xml
cheatSettingsFile=/pandora/LArReco/settings/development/PandoraSettings_Cheat.xml
geometryFile=/pandora/LArReco/geometry/PandoraGeometry_MicroBooNE.xml

# Disable monitoring.
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${settingsFile}
sed -i "s/<IsMonitoringEnabled>.*<\/IsMonitoringEnabled>/<IsMonitoringEnabled>false<\/IsMonitoringEnabled>/g" ${cheatSettingsFile}

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
