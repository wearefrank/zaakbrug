# SoapUI TestRunner
Runs tests in a SoapUI and generates a report with the test results. 

Optionally a .properties file can be provided to 
set CI specific property values. Properties should be formatted as a <key>=<value> per line. Properties will be loaded 
as 'Global' properties, which can be references within the project by `${<key>}`, `${#Global#<key>}` or `${#System#<key>}`.

Warning: Is is very strongly recommended to have the SoapUI project file at the root of the project. SoapUI uses the project 
file location as project root. Placing it in a subfolder will require all relative paths to resource within the project to 
offset back to the actual project root.

## Usage
``` yaml
- uses: wearefrank/ci-cd-templates/soapui-testrunner@1
  with:
    # Absolute path to project folder.
    #
    # Default: ${PWD}
    project-dir: '${PWD}'

    # Filename of the SoapUI project file.
    #
    # Warning: Is is very strongly recommended to have the SoapUI project file at the root of the project.
    soapui-project: 'soapui-project.xml'

    # Directory relative to project directory for writing test reports to.
    #
    # Default: <project-dir>/soapui-reports
    reports-dir: 'soapui-reports'

    # Path to optional properties file relative to the project folder. Properties should be formatted as a <key>=<value> per line.
    # Properties will be loaded as 'Global' properties, which can be references within the project by `${<key>}`, `${#Global#<key>}` or `${#System#<key>}`.
    #
    # Default: <project-dir>/soapui.ci.properties
    properties-file: 'soapui.ci.properties'

    # Command-line option arguments for SoapUI. '-f' is already provided by `reports-dir`.
    # Refer to [TestRunner Command-Line Arguments](https://www.soapui.org/docs/test-automation/running-from-command-line/functional-tests/)
    # for all the available arguments.
    #
    # Note: Many arguments, in particular report format related arguments, seem to not work.
    # Default: -a -A -j -r
    soapui-cmd-options-args: '-a -A -j -r'

    # SoapUI version.
    #
    # Default: latest
    soapui-version: 'latest'
```

## Scenario's
 [Docker Run And Wait For Healthy Container Before Running SoapUI](#docker-run-and-wait-for-healthy-container-before-running-soapui)

### Docker Run And Wait For Healthy Container Before Running SoapUI
``` yaml
- name: Checkout
  uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 #4.2.2
  with:
    token: ${{secrets.token}}

- name: Load Docker tar
  shell: bash
  run: |
    docker load --input image.tar

- name: Setup Test Environment
  id: setup-script
  shell: bash
  env:
    IMAGE_ID: ${{inputs.image-id}}
  run: |
    CONTAINER_ID=$(docker run -d $IMAGE_ID)
    echo "container-id=$CONTAINER_ID" >> $GITHUB_OUTPUT

- name: Wait Till Healthy
  uses: wearefrank/ci-cd-templates/wait-till-healthy-container@1
  with:
    image-id: ${{inputs.image-id}}

- name: SoapUI TestRunner
  uses:  wearefrank/ci-cd-templates/actions/soapui-testrunner@1
  timeout-minutes: 15
  with:
    soapui-project: 'soapui-project.xml'
    properties-file: 'soapui.ci.properties'

- name: Teardown Test Environment
  shell: bash
  env:
    CONTAINER_ID: ${{steps.setup-script.outputs.container-id}}
  run: |
    docker stop $CONTAINER_ID
    docker rm -v $CONTAINER_ID
```