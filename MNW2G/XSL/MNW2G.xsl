<?xml version="1.0"?>
<xsl:stylesheet xmlns:cdn="www.cedacri.it" xmlns:tpp="www.cedacrinet.it" xmlns:bhv="http://www.behav.it" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
   <xsl:output version="1.0" encoding="iso-8859-1" indent="no" method="html"/>
   <xsl:include href="../../../COMMON64/Xsl/MainATitle_INC.xsl"/>
   <xsl:template match="/">
      <html>
         <head>
               <link href="/COMMON64/styles/Standard.css" type="text/css" rel="stylesheet"/>
               <link href="/MN/COMMON/CSS/MNStyle.css" type="text/css" rel="stylesheet"/>
 
               <script src="/COMMON64/Script/jquery-1.11.3.js" type="text/javascript"></script>
               <script type="text/javascript" id="creazioneTagElementi">
                  document.createElement('tppFeuCode');
                  document.createElement('tppFeuText');
                  document.createElement('tppFeuCombo');
               </script>

               <script src="/COMMON64/Script/General.js"></script> 
               <script language="javascript" src="/MN/MNW2G/JS/MNW2G.js"></script>
               <!-- подключение главных функций в main -->
               <script src="/MN/COMMON/Script/Main.js"></script> 
        			<script src="/MN/Common/Script/Paginazione.js"></script>       
               <script src="/COMMON64/Script/Behaviors/tppFeuCode/tppFeuCode_v2.js" type="text/javascript"></script>  
               <script src="/COMMON64/Script/Behaviors/tppFeuText/tppFeuText.js" type="text/javascript"></script>  
               <script src="/COMMON64/Script/Behaviors/tppFeuCombo/tppFeuCombo.js" type="text/javascript"></script>  
               <script type="text/javascript" src="/COMMON64/Script/Behaviors/inizializzatore_dinamico.js"></script>      
         </head>
               <!-- Содержит XML-данные, содерж блока будет скопир и исп в преоброз. -->
               <script type="application/xml" id="xml_RESULT">
               <!-- копирует содержимое элемента из xml в xslt -->
                  <xsl:copy-of select="/PAGE/OUTPUT/RESULT"/>
               </script>
            <!-- Вызывает шаблон "BODY" -->
               <xsl:call-template name="BODY"/>
      </html>
   </xsl:template>
   <xsl:template name="BODY">
      <BODY rightmargin="0" onload="load()"  leftmargin="0" topmargin="0" style="overflow-y:hidden; overflow-x:hidden;">
         <!-- действите при загрузке стр -->
         <!-- Применяет шаблоны к элементам -->
         <xsl:apply-templates select="PAGE/DESCRIPTION"/>
         	<form style="margin:10px; padding:5px" action="process.aspx" method="get" class="stdForm">
            <div style="margin-bottom: 15px">
               <div style="width:100%;" class="formLegendTitle">
                  Lista Log
				   </div>
            </div>
            <table style="margin-left: 15px">
               <tr>
                  <td>
                     <label class="mandLabel">
                     Codice Servizio:
                     </label>
                  </td>
                  <td colspan="3">
                     <!-- поле для ввода с атрибутами описывающ его поведение -->
                     <tppFeuCode
                        id="MNW2G-IO-MNSR" 
                        len="3" padLen="3" 
                        allowNull="true" 
                        enabled="true" 
                        required="true" 
                        DClass="stdFormCodeOpt" 
                        focusClass="stdFormCodeOpt" 
                        value="{//MNW8A-O-COD-SRV}"
                        mandClass="stdFormCodeMand">
                     </tppFeuCode>
						<div class="btnRapp" id="">
                  <xsl:attribute name="style">cursor:hand</xsl:attribute>
                  <xsl:attribute name="onclick"> apriModalWin('MNW2G-IO-MNSR','campoDescrServizio',
                    'Utilities', 'SR', 'MNW2G-IO-MNSR', '');</xsl:attribute>
                  <a class="btnShort" href="#">
                    <span>
                      <img alt="" src="COMMON64/images/feu-btn-ico-rapporto.gif" />
                    </span>
                  </a> 
							<span id="campoDescrServizio" style="margin-left: 5px">
                     <xsl:value-of select='//MNW8A-O-DESCR-SRV' />
                     </span>
                </div>
                  </td>
               </tr>
               <tr>
                  <td class="formTdR">
                     <label class="mandLabel">Status CDA:</label>
                  </td>
                  <td class="formTdL">
                     <!-- текст поле для ввода с параметрами -->
                     <tppFeuText 
                        id="MNW2G-IO-MNCAST" 
                        len="2"
                        allowNull="true"
                        enabled="true"
                        required="true" 
                        align="left" 
                        upperCase="true" 
                        lowerCase="false" 
                        DClass="stdFormTextOpt" 
                        focusClass="stdFormTextOpt"
                        mandClass="stdFormTextMand" 
                        type="text" 
                        invalidChars="?!@&amp;">
                     </tppFeuText>
						<div class="btnRapp" id="">
                  <xsl:attribute name="style">cursor:hand</xsl:attribute>
                  <xsl:attribute name="onclick">apriModalWin('MNW2G-IO-MNCAST','StatusCDA',
                    'StatusCDA', 'SZ', 'MNW2G-IO-MNSR', '');
                    </xsl:attribute>
                  <a class="btnShort" href="#" style="margin-left: 5px">
                    <span>
                      <img alt="" src="COMMON64/images/feu-btn-ico-rapporto.gif" />
                    </span>
                  </a>
                </div>
                  </td>
							<td class="formTdR">
                  <label class="mandLabel" style="margin-left: 20px">
                  Mezzi di pagamento:
                  </label>
               </td>
               <td class="formTdL" colspan="3">
                  <tppFeuCombo id="mezziPagamento" formName="mezziPagamento" enabled="true" required="false" codHidden="true" descLen="15" codLen="1" codSize="1" DClass="tppComboBoxOpt" mandClass="tppComboBoxMand" imagePath="/COMMON64/images/feu-bt-comboBox.png" imagePathDisabled="/COMMON64/images/feu-bt-comboBox-disabled.png" focusClass="tppComboBoxOpt" xslUrl="/COMMON64/Xsl/Decod.xsl" onlyListedValues="false" upperCase="true">
										 <xsl:attribute name="cod">
                        <xsl:choose>
                           <xsl:when test="/PAGE/PARAMS/PARAM[@name='MNW2G-I-MNCAPY'] = 'S'">S</xsl:when>
                           <xsl:when test="/PAGE/PARAMS/PARAM[@name='MNW2G-I-MNCAPY'] = 'N'">N</xsl:when>
                           <xsl:otherwise>T</xsl:otherwise>
                        </xsl:choose>
                     </xsl:attribute>
                     <script type="application/xml">
                        <DATASET>
                        	<GRUPPO name="Mezzi di pagamento" caption="Mezzi di pagamento">
                        		<D>
                        			<C>T</C>
                        			<E>Tutti</E>
                        		</D>
                        		<D>
                        			<C>S</C>
                        			<E>Inseriti</E>
                        		</D>
                        		<D>
                        			<C>N</C>
                        			<E>Non inseriti</E>
                        		</D>
                        	</GRUPPO>
                        </DATASET>
                     </script>
                  </tppFeuCombo>
               </td>
               </tr>
            </table>
         </form>
         <xsl:call-template name="button"/>
      </BODY>
   </xsl:template>
   <xsl:template name="button">
      <div style="right: 10px; position: absolute; bottom: 10px;">
         <a class="btnImgR" href="#" id="btnInvio" style="padding-right: 10px;" onclick="listaCDA()">
            <span style="padding-left: 10px; padding-right: 15px; height: 20px; float: none;">
               <label>Invio</label>
                  <img src="/COMMON64/IMAGES/btn-ico-next.gif" style="margin-right:5px"/>
            </span>
         </a>
         </div>
   </xsl:template>
</xsl:stylesheet>