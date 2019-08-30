class ZCL_ZGW_BILL_INFO_DPC_EXT definition
  public
  inheriting from ZCL_ZGW_BILL_INFO_DPC
  create public .

public section.
protected section.

  methods BILLHEADERSET_GET_ENTITYSET
    redefinition .
  methods BILLHEADERSET_GET_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZGW_BILL_INFO_DPC_EXT IMPLEMENTATION.


  METHOD billheaderset_get_entity.
    READ TABLE it_key_tab INTO DATA(ls_key_tab) WITH KEY name = 'Vbeln'.
    DATA: iv_vbeln TYPE vbeln_vf.
    IF sy-subrc = 0.
      iv_vbeln = ls_key_tab-value.
    ENDIF.
    SELECT SINGLE * INTO er_entity FROM vbrk WHERE vbeln = iv_vbeln.
  ENDMETHOD.


  method BILLHEADERSET_GET_ENTITYSET.
select * up to 10 rows from vbrk into CORRESPONDING FIELDS OF table et_entitySet.
  endmethod.
ENDCLASS.
