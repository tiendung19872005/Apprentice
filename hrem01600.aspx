﻿<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var check_init = 0;

function BodyInit()
{
    
    //if (v_language!="ENG")
    System.Translate(document);
   
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    txtCompany_pk.text= "<%=session("COMPANY_PK")%>";
	var v_language = "<%=Session("SESSION_LANG")%>";
    txtLanguage.text = v_language;
    //menu_id.text=System.Menu.GetMenuID();
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
		
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPosition.SetDataText(data);
	lstPosition.value ="ALL";	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0010', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstJob.SetDataText(data);
	lstJob.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value ="ALL";
    
}


//----------------------------------------------------
function OnSearch()
{
      dat_hrem01600_0.Call("SELECT");
}


//-------------------------------------------------------------------------------------
function OnDataReceive(obj)
{

}

function onChange_org()
{
	
}
// ------------------------------------------------------------------------------

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">

<gw:data id="dat_hrem01600_0" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid" function="st_hr_sel_hrem01600_0"> 
                    <input bind="grdEmployee" >
	                    <input bind="lstOrg_Code" />
	                    <input bind="txtEmployee" />
	                    <input bind="lstNation" />
	                    <input bind="lstPosition" />
	                    <input bind="lstJob" />
	                    <input bind="lstStatus" />
	                </input>
	                <output  bind="grdEmployee" />
                
            </dso> 
        </xml> 
</gw:data>

<!-- data control -->

<!--  -->
	<table name="Employee Informations" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
		<tr style="width:100%;height:100%" valign="top">
			<td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:12%">
					<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr>
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" align="left" border="0px">
								Employee:
							</td>
							<td colspan=12 width="12%" border="0px">
								<gw:textbox id="txtEmployee" onenterkey   ="OnSearch()" styles="width:100%"/>
							</td>
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" border="0px">
								Position:
							</td>
							<td colspan=12 width="12%" border="0px">
								<gw:list  id="lstPosition" value='01' maxlen = "100" styles='width:100%' />							
							</td>							
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" border="0px">
								Job:							
							</td>
							<td colspan=12 width="12%" border="0px">							
								<gw:list  id="lstJob" value='01' maxlen = "100" styles='width:100%' />
							</td>							
						</tr>
						<tr>
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" align="left" border="0px">
								Organization:							
							</td>
							<td colspan=12 width="12%" border="0px">							
								<gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org()" />
							</td>
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" border="0px">
								Nation:							
							</td>
							<td colspan=12 width="12%" border="0px">							
								<gw:list  id="lstNation" value='ALL' maxlen = "100" styles='width:100%'  />							
							</td>							
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" border="0px">
								Status:							
							</td>
							<td colspan=12 width="12%" border="0px">
								<gw:list  id="lstStatus" value='01' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
						<tr>
							<td colspan=2 width="2%" border="0px">
							<td colspan=12 width="12%" align="left" border="0px">
								Join Date:
							</td>
							<td colspan=13 width="13%" border="0px">
								<gw:datebox id="dtFrom_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtTo_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=1 width="1%" border="0px">
							<td colspan=12 width="12%" style="border:0" align="left">
								Left Date:
							</td>
							<td colspan=30 width="30%" style="border:0" align="left">
								<gw:datebox id="dtFrom_LeftDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtTo_LeftDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:5%;">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center"  >
							<td colspan=5 width="5%" style="border:0"   >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord"  text="" />
							</td>
							<td colspan=60 width="60%" style="border:0"> 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" img="search"     text="Search"  onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave" img="save"   text="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport(1)"/>
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid   
                                id="grdEmployee"  
                                header="Emp ID|FullNamee|Organization|Position|Job|Nation|Status|Join Date|Left Date"   
                                format="0|0|0|0|0|0|0|4|4"  
                                aligns="0|0|0|0|0|0|0|0|0"    
                                defaults="||||||||"    
                                editcol="0|0|1|1|0|1|0|0|1"  
                                widths="1500|2500|1500|1500|2500|1500|1500|1500|1500"  
                                styles="width:100%; height:100%"   acceptNullDate
                                onafteredit="On_AfterEdit()"
                                onentercell = "On_click()"
                                sorting="T"/> 
							</td>
						</tr>
				   </table> 
				</div>
			</td>
		</tr>
	</table>
</body>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtCompany_pk" styles="display:none"/>
<gw:textbox id="txtLanguage" styles="display:none"/>
<gw:textbox id="menu_id" styles="display:none"/>
</html>
