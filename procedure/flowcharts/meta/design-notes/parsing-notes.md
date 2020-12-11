# Work package visualisations with logic gates

Work package visualisations should show all routes in the applicable procedure and all steps tied to those routes. In this respect they should be identical to the procedure visualisation. Routes that are not currently traversible should be indicated as such as per the procedure visualisation.

## Changes to the display of business steps from the procedure visualisation 

Business steps can be in one of two current states:

* Not yet actualised

* Actualised one or more times

These states should be indicated visually.

Business steps can be in one of three potential states:

* Not actualisable
* Caused to be actualised
* Allowed to be actualised

These states should also be indicated visually.

Any combination of current state and potential state is possible.

Actualisable business steps are those with an input of TRUE when all logical processing is taken into account. Logical rules are documented elsewhere. If the path includes a decision step, the future actualisation is allowed. If the path does not include a decision step, the future actualisation is caused.

Actualised steps emit a TRUE. Unactualised steps emit a NULL.

## Changes to the display of routes from the procedure visualisation

Routes can be in one of three states:

* NULL

* TRUE
* FALSE

These states should be indicated visually.
