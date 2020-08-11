# Reference {#sec:devel_sw_diagnostics_reference level=sec status=ready}

In this section, we will describe the various arguments that the diagnostics
tool accepts. Use them to configure the diagnostics tool to fit your needs.

<minitoc/>


## Usage

You can run a diagnostics test using the command:

```bash
dts diagnostics run -H/--machine ![ROBOT] -G/--group ![EXPERIMENT] -d/--duration ![SECONDS] [OPTIONS]
```


## Options

The following table describes the **options** available to the diagnostics
tool.

<col3 figure-id="tab:devel_sw_diagnostics_dts_diag_run_options" class="labels-row1" figure-caption="Options available to the command `dts diagnostics run`">
    <span>Argument&nbsp;&nbsp;&nbsp;</span>
    <span>Type</span>
    <span>Description</span>
    
    <span>
        <code>-H</code><br/>
        <code>--machine</code>
    </span>
    <span>`-`</span>
    <span>Machine where the diagnostics tool will run. This can be any machine with a network connection to the target machine.</span>
    
    <span>
        <code>-T</code><br/>
        <code>--target</code>
    </span>
    <span>localhost</span>
    <span>Machine target of the diagnostics. This is the machine about which the log is created.</span>
    
    <span>
        <code>--type</code>
    </span>
    <span>auto</span>
    <span>Specify a device type (e.g., duckiebot, watchtower). Use <code>--help</code> to see the list of allowed values.</span>
    
    <span>
        <code>--app-id</code>
    </span>
    <span>`-`</span>
    <span>ID of the API App used to authenticate the push to the server. Must have access to the 'data/set' API endpoint</span>
    
    <span>
        <code>--app-secret</code>
    </span>
    <span>`-`</span>
    <span>Secret of the API App used to authenticate the push to the server</span>
    
    <span>
        <code>-D</code><br/>
        <code>--database</code>
    </span>
    <span>`-`</span>
    <span>Name of the logging database. Must be an existing database.</span>
    
    <span>
        <code>-G</code><br/>
        <code>--group</code>
    </span>
    <span>`-`</span>
    <span>Name of the experiment (e.g., new_fan)</span>
    
    <span>
        <code>-S</code><br/>
        <code>--subgroup</code>
    </span>
    <span>"default"</span>
    <span>Name of the test within the experiment (e.g., fan_model_X)</span>
    
    <span>
        <code>-D</code><br/>
        <code>--duration</code>
    </span>
    <span>`-`</span>
    <span>Length of the analysis in seconds, (-1: indefinite)</span>
    
    <span>
        <code>-F</code><br/>
        <code>--filter</code>
    </span>
    <span>"*"</span>
    <span>Specify regexes used to filter the monitored containers</span>
    
    <span>
        <code>-m</code><br/>
        <code>--notes</code>
    </span>
    <span>"empty"</span>
    <span>Custom notes to attach to the log</span>
    
    <span>
        <code>--no-pull</code>
    </span>
    <span>False</span>
    <span>Whether we do not try to pull the diagnostics image before running the experiment</span>
    
    <span>
        <code>--debug</code>
    </span>
    <span>False</span>
    <span>Run in debug mode</span>
    
    <span>
        <code>--vv</code><br/>
        <code>--verbose</code>
    </span>
    <span>False</span>
    <span>Run in debug mode</span>
</col3>