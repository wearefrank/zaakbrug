function mergeProfileDefaultsWithProfiles(profileDefaults, profiles) {

    profileDefaults = JSON.parse(profileDefaults || '{}');
    profiles = JSON.parse(profiles || '[]');
    
    let result = {};
    result["profile"] = [];
    result["profileDefaults"] = profileDefaults;

    if(profiles.length === 0 || Object.keys(profileDefaults).length === 0){
        const returnData = {};
        if(profiles.length > 0){
            returnData["profile"] = profiles;
        }
        if(Object.keys(profileDefaults).length > 0){
            returnData["profileDefaults"] = profileDefaults;
        }
        return JSON.stringify(returnData, null, 4);
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