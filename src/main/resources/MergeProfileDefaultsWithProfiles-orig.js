function mergeProfileDefaultsWithProfiles(profilesFile){
    const json = JSON.parse(profilesFile);
    const profileDefaults = {"profile": json["profileDefaults"]};
    const profiles = { "profile": json["profile"] };

    let result = {};
    result["profile"] = [];
    result["profileDefaults"] = json["profileDefaults"];

    if(json["profileDefaults"] == null || json["profile"] == null){
        return profilesFile;
    }

    for(const pf of profiles.profile){
        let pfres = {};
        Object.keys(profileDefaults.profile)
        .forEach(key => pfres[key] = profileDefaults.profile[key]);
        Object.keys(pf)
        .forEach(key => pfres[key] = pf[key]);

        if(pf["valueOverrides"] == null){
            result.profile.push(pfres);
            break;
        }

        pfres["valueOverrides"] = pf.valueOverrides
            .concat(profileDefaults.profile.valueOverrides
                    .filter((value) => pf.valueOverrides
                        .find((value2) => value2.key != value.key)));

        result.profile.push(pfres);
    }

    return JSON.stringify(result, null, 4);
}