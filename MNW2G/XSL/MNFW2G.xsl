<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:bhv="http://www.behav.it"
  xmlns:tpp="www.cedacrinet.it"
  xmlns:cdn="www.cedacri.it">
  <xsl:output version="1.0" method="html" indent="no" encoding="iso-8859-1" />
  <xsl:include href="../../../COMMON64/Xsl/MainATitle_INC.xsl" />
  <xsl:include href="../../../COMMON64/Xsl/FeuBack.xsl" />
  <xsl:include href="../../COMMON/Xsl/FormatInputOutput.xsl" />
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="/COMMON64/styles/Standard.css" />

        <script src="/COMMON64/Script/General.js"></script>
        <script src="/COMMON64/Script/GeneralFEU.js"></script>
        <script src="/COMMON64/Script/Behaviors/inizializzatore_dinamico.js"></script>  
        <script src="MN/COMMON/Script/Main.js"></script>
        <script src="/MN/MNW2G/JS/MNMNFW2G.js"></script>
        <script src="MN/Common/Script/Paginazione.js"></script>
      </head>
      <body style="width:100%; height:100%;margin:0px; overflow-y: scroll;  position:relative;" onload="load()">
        <xsl:apply-templates select="PAGE/DESCRIPTION" />
        <div style="display:none;position:abbsolute">
        </div>
        <div style="display:none;position:abbsolute">
      </div>
        <div style="margin: 15px 0 8px 0; width:100%; display:flex; justify-content:center">
          <div class='stdForm' style='width:97%; padding:10px'>
            <label class="fieldNameLblBox">
              Status CDA: 
            </label>
            <span>
            <xsl:value-of select="//MNW2G-IO-MNCAST "/>
            </span>
            <span>
            -
            <xsl:value-of select="//MNW2G-O-MNCADX"/>
            </span>
          </div>
        </div>
        <table class="stdDataTable" id="scollableTable" style="width:30%; overflow-y: scroll; max-height: 300px; margin: 0 auto;">
        <thead>
          <tr>
            <td class="titleColC">Chiave</td>
            <td class="titleColC">Progr. CDA</td>
            <td class="titleColC">Stato CDA</td>
            <td class="titleColC">Data stipula prevista</td>
          </tr>
        </thead>
        <xsl:for-each select="//MNW2G-O-EL-LISTA">
          <tr>
            <td class="tdC">
              <xsl:value-of select="MNW2G-O-CHIAVE"/>
            </td>
            <td class="tdC">
              <xsl:value-of select="MNW2G-O-MNCANR"/>
            </td>
            <td class="tdC">
              <xsl:value-of select="MNW2G-O-MNCADX"/>
            </td>
            <td class="tdC">
              <xsl:call-template name="format-data">
                <xsl:with-param name="data">
                  <xsl:value-of select="MNW2G-O-MNDTRO" />
                </xsl:with-param>
              </xsl:call-template>
            </td>
          </tr>
        </xsl:for-each>
      </table>
        <div width="100%" style="margin-left:5px;">
           <div id="id_pag" align="center" class="unvisited" style="text-align: center"></div>
        </div>
      <form name="Param" action="/process.aspx" method="post" >
        <input id="PAGE" name="PAGE" type="hidden" value="/MN/MNW2G/PDS/MNFW2G"></input>
          <input type="hidden" id="NextPage" name="MNW2G-IO-PAG-RICH"></input>
          <input type="hidden" id="Tot_Pagg" name="MNW2G-IO-NRPAG-TOT">
          <!-- Уст значение поля 'Tot_Pagg' равным значению элемента 'MNW2G-IO-NRPAG-TOT' в XML-документе -->
            <xsl:attribute name="value">
              <xsl:value-of select="//MNW2G-IO-NRPAG-TOT"/>
            </xsl:attribute>
          </input>
          <input type="hidden" id="Cur_Pag">
            <xsl:attribute name="value">
              <xsl:value-of select="//MNW2G-IO-PAG-RICH"/>
            </xsl:attribute>
          </input>
      </form>
      <div style="position: fixed; bottom: 0; padding: 10px 20px;">
        <xsl:call-template name="GOBACK"/>
      </div>
    </body>
    <script type="application/xml" id="xml_RESULT">
      <xsl:copy-of select="/PAGE/OUTPUT/RESULT" />
    </script>
    </html>
  </xsl:template>
</xsl:stylesheet>