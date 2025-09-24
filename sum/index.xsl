<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="header.xsl"/>
  <xsl:include href="footer.xsl"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Keith's Combined Page</title>
        <link rel="stylesheet" href="styles.css"/>
      </head>
      <body>
        <xsl:call-template name="header"/>

        <div class="content">
          <p>This is the main content area.</p>
        </div>

        <xsl:call-template name="footer"/>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
