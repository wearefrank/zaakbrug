function mergeProfileDefaultsWithProfiles(profilesFile){
    const json = JSON.parse(profilesFile);
    const profileDefaults = json["profileDefaults"];
    const profiles = json["profile"];

    let result = {};
    result["profile"] = [];
    result["profileDefaults"] = profileDefaults;

    if(profileDefaults == null || profiles == null || Object.keys(profileDefaults).length === 0){
        return profilesFile;
    }

    for(const pf of profiles){
        let pfres = {};
        Object.keys(profileDefaults)
        .forEach(key => pfres[key] = profileDefaults[key]);
        Object.keys(pf)
        .forEach(key => pfres[key] = pf[key]);

        if(pf["valueOverrides"] == null || profileDefaults["valueOverrides"] == null){
            result.profile.push(pfres);
            continue;
        }

        pfres["valueOverrides"] = (profileDefaults.valueOverrides)
            .map(({ key, value }) => ({
                key,
                value: pf.valueOverrides.find(obj => obj.key === key)?.value ?? value
            }));

        result.profile.push(pfres);
    }

    return JSON.stringify(result, null, 4);
}