const fs = require('fs');
const path = require('path');

function replaceStringsInFolder(folderPath, mapping) {
    fs.readdir(folderPath, (err, files) => {
        if (err) {
            console.error("Error reading directory:", err);
            return;
        }

        files.forEach(file => {
            const oldFilePath = path.join(folderPath, file);
            fs.stat(oldFilePath, (err, stats) => {
                if (err) {
                    console.error("Error getting file stats:", err);
                    return;
                }

                if (stats.isDirectory()) {
                    if (!mapping.ignoredFolders.includes(file)) {
                        const newFolderName = replaceStrings(file, mapping.mappings);
                        if (newFolderName !== file) {
                            const newFolderPath = path.join(folderPath, newFolderName);
                            fs.rename(oldFilePath, newFolderPath, (err) => {
                                if (err) {
                                    console.error(`Error renaming folder ${oldFilePath} to ${newFolderPath}:`, err);
                                    return;
                                }
                                console.log(`✅ Renamed folder: ${oldFilePath} => ${newFolderPath}`);
                                replaceStringsInFolder(newFolderPath, mapping);
                            });
                        } else {
                            replaceStringsInFolder(oldFilePath, mapping);
                        }
                    }
                } else if (stats.isFile()) {
                    if (!mapping.ignoredFiles.includes(file)) {
                        replaceStringsInFile(oldFilePath, mapping.mappings, () => {
                            const newFileName = replaceStrings(file, mapping.mappings);
                            if (newFileName !== file) {
                                const newFilePath = path.join(folderPath, newFileName);
                                fs.rename(oldFilePath, newFilePath, (err) => {
                                    if (err) {
                                        console.error(`Error renaming file ${oldFilePath} to ${newFilePath}:`, err);
                                        return;
                                    }
                                    console.log(`✅ Renamed file: ${oldFilePath} => ${newFilePath}`);
                                });
                            }
                        });
                    }
                }
            });
        });
    });
}

function replaceStringsInFile(filePath, mapping, callback) {
    fs.readFile(filePath, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file:", err);
            return;
        }

        let replacedData = data;
        let replacementsCount = 0;
        for (const search in mapping) {
            if (mapping.hasOwnProperty(search)) {
                const replacement = mapping[search];
                if (!replacement) {
                    console.warn(`⚠️ Warning: Replacement value for "${search}" is empty.`);
                } else {
                    const regex = new RegExp(search, 'g');
                    const occurrences = (replacedData.match(regex) || []).length;
                    if (occurrences > 0) {
                        replacedData = replacedData.replace(regex, replacement);
                        replacementsCount += occurrences;
                    }
                }
            }
        }

        fs.writeFile(filePath, replacedData, 'utf8', (err) => {
            if (err) {
                console.error("❌ Error writing to file:", err);
                return;
            }
            if (replacementsCount > 0) {
                console.log(`✅ Replaced ${replacementsCount} values in ${filePath}`);
            }
            callback();
        });
    });
}

function replaceStrings(str, mapping) {
    let replacedStr = str;
    for (const search in mapping) {
        if (mapping.hasOwnProperty(search)) {
            const replacement = mapping[search];
            if (!replacement) {
                console.warn(`⚠️ Warning: Replacement value for "${search}" is empty.`);
            } else {
                replacedStr = replacedStr.replace(new RegExp(search, 'g'), replacement);
            }
        }
    }
    return replacedStr;
}

const folderPath = '.';
const mappingFilePath = 'skeletonrc.json';

fs.readFile(mappingFilePath, 'utf8', (err, data) => {
    if (err) {
        console.error("❌ Error reading mapping file:", err);
        return;
    }

    try {
        const mapping = JSON.parse(data);
        replaceStringsInFolder(folderPath, mapping);
    } catch (err) {
        console.error("❌ Error parsing mapping file:", err);
    }
    console.log("\x1b[33m%s\x1b[0m", `\n💛 Stay Frank!`);
});
