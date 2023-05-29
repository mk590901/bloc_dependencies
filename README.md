# bloc_dependences

**BLoCs in the context of the set of same widgets**

## Introduction

When using **BLoC** in *flutter applications*, should pay attention to one feature of this pattern. In a flutter environment, the **BLoC** is associated usially with a concrete widget. Changing the state of **BLoC** under the influence of event, we influence one or another graphic element of this widget. However, it must be borne in mind that the impact of the event on the *BLoC's* state works like a broadcast. In other words, if there are several widgets in the application with the same **BLoC**, then when an event is sent, all widgets will receive notification of a change in state or its attributes. There is no targeting and must be implemented in a special way. Each widget must have a unique identifier, which should be allow the widget to correctly respond to a state change.

Below is an application in which some of the related problems are solved. Short brief:

## Application

The app is a 3x5 grid view. The first three lines are text items, the fourth and fifth lines are buttons. Relevant widgets: **TextTileWidget**, **IconTileWidget** and **IconTilePlusWidget**. Each such widget corresponds to three _BLoCs_: **SelectionBloc**, **ButtonBloc** and **ButtonPlusBloc**.

- The logic of **SelectionBloc** is described by the state machine selection state machine:
>>>>>
- The state machine button state machine is built into **ButtonBloc** and **ButtonPlusBloc**:
>>>>>

## Example A
The **_first 9 elements_** in the grid view are text widgets. The widget constructor contains an identifier - an integer and a list of identifiers of widgets in which the background should be changed when widget is clicked. For example constructor:

```
const TextTileWidget(
    id: 5
    IDs: [1, 3, 7, 9],
    textInside: 'Item',
    tileColor: Colors.deepOrangeAccent,
    textColor: Colors.white),
```

says that when **Touch Down** is done on the widget with id=5, the SelectionBloc will transfer to the selected state. In this case, the background of widgets 1, 3, 7 and 9 should be changed. On **_Touch Up_** acton, the **_SelectionBloc_** will go into the unselected state and background of widgets 1, 3, 7 and 9 should be restored.
All manipulations with data are described in the **_TextTileWidget_** class:
1) **_Touch down_** initiates sending of _event_ **_Select_**. This _event_ should ensure that the **_BLoC_** state changes to **_selected_**.
2) **_Touch up_** initiates sending of event **_Unselect_**. This event should ensure that the **_BLoC_** state changes to **_unselected_**.

The parameters of event are id of widget and a list of ids of widgets whose background should be changed.
The implemented transition mechanism of state machines ensures the transfer of parameters from event to state. In the buid of widget method, it is checked whether an update of widget is needed. If needed, then the color of **_Container_** attribute is changed - item, which is attached to the grid view.

## Example B
The fourth line of grid view is the three **_PLAY/STOP_** buttons detailed in the **_bloc_button_** project. Widget is **_IconTileWidget_**, BLoC is **_ButtonBloc_**. Widget is used as is and simply illustrates the broadcast property of BLoC. You press any button, the general state machine changes its state and all buttons go from the **stop** state to the **play** state and back.
## Example C
Demonstrates the independent operation of 3 buttons. I.e. each of them can change its state regardless of the state of the other button, despite the fact that **BLoC** has the same state for all. Each widget has its own **uuid** and can firstly check the source of event that is sent by **_touch up_**, secondly the currentState variable, and thirdly, it can change the **BLoC** state in relation to **_currentState_** before sending the of _event_. I.e. each button acts according to its own logic as if each button has its **_independent state machine_**.