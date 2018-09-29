class ZCL_PORTAL_STATIC definition
  public
  final
  create public .

*"* public components of class ZCL_PORTAL_STATIC
*"* do not include other source files here!!!
public section.

  class-methods NAVIGATE
    importing
      !IR_CONTROLLER type ref to IF_WD_COMPONENT
      !I_SYSTEM type SIMPLE optional
      !I_OBJECT_TYPE type SIMPLE
      !I_OPERATION type SIMPLE
      !IT_PARAMS type WDY_KEY_VALUE_LISTGEN .
  class-methods NAVIGATE_ABSOLUTE
    importing
      !IR_CONTROLLER type ref to IF_WD_COMPONENT
      !I_PATH type SIMPLE
      !I_MODE type SIMPLE default IF_WD_PORTAL_INTEGRATION=>CO_SHOW_INPLACE
      !I_POST type WDY_BOOLEAN optional
      !IT_PARAMS type WDY_KEY_VALUE_LISTGEN optional .
protected section.
*"* protected components of class ZCL_PORTAL_STATIC
*"* do not include other source files here!!!
private section.
*"* private components of class ZCL_PORTAL_STATIC
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_PORTAL_STATIC IMPLEMENTATION.


method navigate.

    data lr_portal type ref to if_wd_portal_integration.
    lr_portal = ir_controller->get_portal_manager( ).

    lr_portal->navigate_to_object(
      system              = i_system
      object_type         = i_object_type
      operation           = i_operation
      business_parameters = it_params ).

  endmethod.


method navigate_absolute.

    data lr_portal type ref to if_wd_portal_integration.
    lr_portal = ir_controller->get_portal_manager( ).

    lr_portal->navigate_absolute(
      navigation_target   = i_path
      navigation_mode     = if_wd_portal_integration=>co_show_external
      "window_features     = 'toolbar=no,resizable=yes,scrollbars=yes'
      business_parameters = it_params
      post_parameters     = i_post ).

  endmethod.
ENDCLASS.
