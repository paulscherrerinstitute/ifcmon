# Purpose
The module IFCMON can be used for hardware monitoring for the
IOxOS IFC_1210 IOC.


# Examples
Add the snipplets below to your startup.script.

## Example for default usage

```
require "ifcmon"
```

## Example with optional macros
Example where optional macros are used to specify TMEM generic
memory map status to be read from different device, here `CPUSHMEM`
with a custom additional offset `TMEMOFFS`.

```
require "ifcmon",'SCAN="5 second",
TMEMINPUT=CPUSHMEM,
TMEMOFFS=524288,
NO_TMEM=#'
```

# References
Link to CodeBeamer Project at PSI:
[1] https://codebeamer.psi.ch/cb/project/104

Link to Codebeamer SVN Repository, Generic Memormy Map Rules for FPGA Firwmare Developers (protected):
[2] https://codebeamer.psi.ch/cb/scm/file/179696//IFC/IFC1210_generic/Firmware/Documentation/IFC1210_TOSCA-II_USER_and_SUSER_Implementation_Rules.pdf/history

