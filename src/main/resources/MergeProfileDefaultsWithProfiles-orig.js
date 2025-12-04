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
        let pfresNewReference = JSON.parse(JSON.stringify(pfres));
        recursiveMerge(pfresNewReference, pf);

//        Object.entries(pf).filter(([key, value]) => typeof value === 'object' && !Array.isArray(value) && value !== null).forEach(([key, value]) =>
//        {
//            if (profileDefaults[key] && profileDefaults[key] == null) {
//                pfres[key] = {
//                    ...value,
//                }
//            }
//        });

//        if(pf["valueOverrides"] == null || profileDefaults["valueOverrides"] == null){
//            result.profile.push(pfres);
//            continue;
//        }
//
//        pfres["valueOverrides"] = [
//            ...pf.valueOverrides,
//            ...profileDefaults.valueOverrides.filter(({key}) => !pf.valueOverrides.some(obj => obj.key === key)
//            )
//        ];

        result.profile.push(pfresNewReference);
    }

    return JSON.stringify(result, null, 4);
}

function recursiveMerge(currentObject, overwrite) {

    const keys = Object.keys(overwrite);

    for (const key of keys) {
        const value = overwrite[key];        
        if (currentObject.hasOwnProperty(key)) {
            let currentProp = currentObject[key];
            if(typeof value === 'object' && !Array.isArray(value) && value !== null &&
               typeof currentProp == 'object' && !Array.isArray(currentProp) && currentProp !== null) {
                recursiveMerge(currentProp, value);
                continue; 
            } else if(Array.isArray(value) && Array.isArray(currentProp)) {
                value.forEach(obj => {
                    let matchingItem = currentProp.find(curObj => curObj.key === obj.key);
                    if (matchingItem) {
                        recursiveMerge(matchingItem, obj);
                    } else {
                        currentProp.push(obj);
                    }
                });
                continue;
            }
        } 
        currentObject[key] = value;
    }
}