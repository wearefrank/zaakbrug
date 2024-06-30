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

        pfres["valueOverrides"] = [
            ...pf.valueOverrides,
            ...profileDefaults.valueOverrides.filter(({key}) => !pf.valueOverrides.some(obj => obj.key === key)
            )
        ];

        result.profile.push(pfres);
    }

    return JSON.stringify(result, null, 4);
}