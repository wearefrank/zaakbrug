function mergeProfileDefaultsWithProfiles(profilesFile){
    const json = JSON.parse(profilesFile);
    const profileDefaults = {"profile": json["profileDefaults"]};
    const profiles = { "profile": json["profile"] };

    let result = {};
    result["profile"] = [];
    result["profileDefaults"] = json["profileDefaults"];

    if(json["profileDefaults"] == null || json["profile"] == null || Object.keys(json["profileDefaults"]).length === 0){
        return profilesFile;
    }

    for(const pf of profiles.profile){
        let pfres = {};
        Object.keys(profileDefaults.profile)
        .forEach(key => pfres[key] = profileDefaults.profile[key]);
        Object.keys(pf)
        .forEach(key => pfres[key] = pf[key]);

        if(pf["valueOverrides"] == null || profileDefaults.profile["valueOverrides"] == null){
            result.profile.push(pfres);
            continue;
        }

        pfres["valueOverrides"] = (profileDefaults.profile.valueOverrides)
            .map(({ key, value }) => ({
                key,
                value: pf.valueOverrides.find(obj => obj.key === key)?.value ?? value
            }));

        result.profile.push(pfres);
    }

    return JSON.stringify(result, null, 4);
}