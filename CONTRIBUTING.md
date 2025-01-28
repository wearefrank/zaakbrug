# Deliverables

This project builds the following artifacts:
* A docker image that can be used to run this application stand-alone.

# Development
## Local development with Docker Compose
Docker Compose file `compose.frank.dev.yaml` brings up an instance for local development.

It is recommended to a 'sync+restart' watch action for each configuration's 'DeploymentSpecifics' files.
This ensures that the container is automatically restarted when a change is made in it. Additionally,
it is recommended to set the 'classLoaderType' to 'ScanningDirectoryClassLoader', so that the Frank!Framework
automatically reloads the configuration when changes are made to it.

To use this Docker Compose file:
```
docker compose -f ./compose.frank.dev.yaml up --build --force-recreate --watch
```
Arguments:
- `--build` - Builds a new image from your local source.
- `--force-recreate` - Eventhough you built a new image, by default Docker reuses the already existing container. This forces Docker to recreate the container, which will then use your newly built image to build the new container from.
- `--watch` - Use the Docker Watch functionality to automatically sync, restart or rebuild the container when certain files in your local source change. Which files/folders trigger what action can be found in the Docker Compose file under the `frank` service, in the `develop.watch` section.

Access the Frank!Console by navigating to `http://localhost:8080/`.

## Local Development Docusaurus
1. Navigate to "docusaurus" subfolder.
    ```
    cd ./docusaurus
    ```

2. Install dependencies.
    ```
    npm install
    ```

3. Serve Docusaurus webserver locally.
    ```
    ./node_modules/.bin/docusaurus.cmd start
    ```
    By default it is served at `http://localhost:3000/`.

4. Basic guide on how to use Docusaurus and a styleguide can be found at `./docusaurus/docs/_README.md`.

# Dependencies
## Update Docusaurus dependencies
1. Navigate to the 'docusaurus' subfolder:
    ```
    cd ./docusaurus
    ```
2. Update dependencies:
    ```
    npm i @docusaurus/core@latest @docusaurus/preset-classic@latest @docusaurus/theme-mermaid@latest @docusaurus/module-type-aliases@latest @docusaurus/tsconfig@latest @docusaurus/types@latest
    ```
## Merge changes from 'Skeleton' project template
The 'Skeleton' project template repository will always stay up-to-date with the latest developments and best practices. It is recommended to merge changes from the Skeleton repo every one or two months.
Otherwise projects will over time become less and less compatible with the Skeleton project. This leads to extra troubleshooting work, because usually the issues you might run into are already fixed in the
Skeleton repo. Additionally, the Skeleton repo ia regularly expanded with new tools and features to make development and maintenance easier and faster.

To merge changes from the Skeleton repo, the Skeleton repo needs to be added as an upstream. Because of the way GitHub template repositories work, the project's Git history is not related to the Skeleton repo's
Git history. Because of this, it is needed to merge with the `--allow-unrelated-histories` argument. Unfortunatly this creates very ugly and hard to resolve merge conflicts, because Git can't use the commit history
to diff properly. To resolve this, it is recommended to do a rebase once instead of a merge. This will apply every single commit in the project repo on top of the Skeleton repo's Git history. After a rebase, future
merging should be as easy as merging simple PR, as for Git the project repo is now effectively a fork of the Skeleton repo with a shared Git History.

1. Add the Skeleton repo as upstream.
    ```
    git remote add upstream https://github.com/wearefrank/skeleton.git
    ```
1. Fetch from upstream.
    ```
    git fetch upstream
    ```
1. Create and switch to new branch.
    ```
    git checkout -b <branchname-for-upstream-changes>
    ```
1. Merge from upstream.
    ```
    git merge upstream/main --allow-unrelated-histories
    ```
1. Stage and commit changes.
    ```
    git add .
    git commit -m "<commit message>"
    ```
1. Create Pull Request.


# CI/CD

We use conventional commits, see https://www.conventionalcommits.org/en/v1.0.0/. Releases are created automatically by GitHub Actions, see [.github/workflows/ci.yml](.github/workflows/ci.yml) and [.github/workflows/release.yml](.github/workflows/release.yml).

Please take care to write meaningful commit messages that result in meaningful entries in [CHANGELOG.md](CHANGELOG.md). Here is an example of the commit message for a breaking change:

    chore: example of a chore that breaks

    BREAKING: This is what breaks

This commit message appears as follows in the release notes:

![changeLogScreenshot.jpg](./changeLogScreenshot.jpg)

A breaking change means that this version is not backwards compatible with the previous release. A breaking change should result in a major release (first number of semantic version is incremented). Please note the following:

* The word BREAKING should appear on the last line of the commit message.
* The word BREAKING is followed by a `:` and a description. This description appears in the release notes in a bullet that explains what is breaking.
* The commit type (e.g. chore) is still relevant for breaking changes. This information appears in the release notes in the same way as a non-breaking change.
* For non-breaking changes, omit the line with BREAKING and make a commit message like the first line shown.

# Checklist for testing CI/CD

Here is a checklist for testing the CI/CD.

* Testing goes best when you make hot fixes on the main branch. Check with the team that you are allowed to do this.
* Do a commit on main that has a commit message starting with `fix:`. The following should happen:
  * The pipeline succeeds - this checks all authorizations are in place.
  * A commit with a message starting with `chore:` has been added automatically.
  * The extra commit updates files `src/main/resources/BuildInfo.properties`, `configurations/{{ cookiecutter.configuration_name }}/BuildInfo.properties`, `publiccode.yaml` and `CHANGELOG.md`.
  * These files should have trustworthy contents - speaks for itself.
  * On GitHub, there is a tag for the new version that starts with `v`. For example if the new release is `3.2.1` then the tag should be `v3.2.1`. You can get this tag using `git fetch origin` on the command line.
  * The docker image for the release has been created on http://www.dockerhub.com. The `latest` tag should have been updated - creation time should be the current time. Depending on the type of release, the `3.2.1`, the `3.2` or the `3` tags should be the current date.
  * Check on dockerhub that tags that should not have been updated do not have the current time as creation time.
  * Run the docker image using `docker run -p 8080:8080 wearefrank/{{ cookiecutter.configuration_name }}:3.2.1`. Check the name of the docker container you started using `docker ps -a`. Login to the docker container using `docker exec -it <container name> bash`. Check that `/opt/frank/resources/BuildInfo.properties` and `/opt/frank/configurations/{{ cookiecutter.configuration_name }}/BuildInfo.properties` contain the right version and the right date.
* Check a breaking change like above. This should update the major version.
* Do a commit with \[skip ci\] in the commit message. It should not make a release and it should not push a docker image.
* Make a pull request. Check that no release is made and that no docker image is pushed.
