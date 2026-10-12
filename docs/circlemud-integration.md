# CircleMUD Integration Contract

CircleMUD remains the gameplay-engine reference. Integration code must be isolated from client presentation.

## Adapter responsibilities
- map rooms and exits
- translate commands
- translate combat and character events
- preserve stable IDs
- expose compatibility tests

Upstream code should be imported as a clearly identified upstream component. New project code belongs in adapter/ and services/.