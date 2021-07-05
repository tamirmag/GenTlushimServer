<?xml version="1.0" encoding="Windows-1255"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<xsl:for-each select="//Tlush">
			<xsl:apply-templates select="."/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="Tlush">

        <!-- הצגת גלופת התלוש -->
        <img src="http://localhost:8081/glufa/KV/2019" style="position:absolute; top:0px; left:0px;"/>

        <!-- קוביית לכבוד -->
        <TABLE BORDER="0" style="position:absolute; top:55px; left:50px;">
        	<TR>
        		<TD CLASS="tlushTd" WIDTH="220px" align="right">
		            <xsl:apply-templates select="Klali/Darga"/>
		            <xsl:apply-templates select="Klali/Shem_Mishpacha"/>
		            <xsl:apply-templates select="Klali/Shem_Prati"/>
        		</TD>
        		<TD CLASS="tlushTd" align="right">
		            מ. א.<xsl:apply-templates select="Klali/Mispar_Ishi"/>
        		</TD>
        	</TR>
        		<TD CLASS="tlushTd" WIDTH="220px" align="right">
		            יחתש
		            <xsl:apply-templates select="Klali/Yachtash"/>
        		</TD>
        		<TD CLASS="tlushTd" align="right">
		            יחידת משנה
		            <xsl:apply-templates select="Klali/Yehidat_Mishne"/>
        		</TD>
        	<TR>
        	</TR>
        </TABLE>

        <!-- נתונים אישיים + חודש -->
        <span style="position:absolute; top:103px; left:298px;">
        	<TABLE>
        		<TD CLASS="itemNum" WIDTH="77px" ALIGN="center">
            		<xsl:apply-templates select="Klali/Teudat_Zehut"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:103px; left:233px;">
        	<TABLE>
        		<TD CLASS="tlushTd" WIDTH="40px" ALIGN="center">
		            <xsl:apply-templates select="Klali/Darga"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:103px; left:114px;">
        	<TABLE>
        		<TD CLASS="itemNum" WIDTH="88px" ALIGN="center">
		            <xsl:apply-templates select="Klali/T_Tom_Sherut"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:103px; left:21px;">
        	<TABLE>
        		<TD CLASS="tlushTd" WIDTH="76px" ALIGN="center">
		            <xsl:apply-templates select="Klali/Matzav_Mishpachti"/> 
			    <!-- יש ילדים -->
			    <xsl:if test="Klali/Mispar_Yeladim[. != '']"> 
				+
			    </xsl:if>
		            <xsl:apply-templates select="Klali/Mispar_Yeladim[. != '']"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:170px; left:411px;">
            <B>
                <xsl:apply-templates select="Klali/Shnat_Sachar"/>
                /
                <xsl:apply-templates select="Klali/Chodesh_Sachar"/>
            </B>
        </span>

        <!-- נתוני  בנק -->
        <span style="position:absolute; top:220px; left:610px;">
        	<TABLE>
            	<TD CLASS="tlushTd" WIDTH="123px" ALIGN="RIGHT">
            		<xsl:apply-templates select="Klali/Shem_Bank"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:220px; left:561px;">
        	<TABLE>
            	<TD CLASS="itemNum" WIDTH="40px" ALIGN="RIGHT">
		            <xsl:apply-templates select="Klali/Kod_Snif"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:220px; left:460px;">
        	<TABLE>
            	<TD CLASS="tlushTd" WIDTH="90px" ALIGN="RIGHT">
		            <xsl:apply-templates select="Klali/Shem_Snif"/>
            	</TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:220px; left:382px;">
        	<TABLE>
            	<TD CLASS="itemNum" WIDTH="70px" ALIGN="RIGHT">
		            <xsl:apply-templates select="Klali/Mispar_Cheshbon"/>
            	</TD>
            </TABLE>
        </span>

        <!-- נתוני  חופשות -->
        <span style="position:absolute; top:280px; left:382px;">
	       	<TABLE BORDER="0">
 	          	<TD CLASS="itemNum" WIDTH="60px" ALIGN="RIGHT">
	 	           <xsl:apply-templates select="Klali/Zakaut_Shnatit"/>
				</TD>
 	          	<TD CLASS="itemNum" WIDTH="49px" ALIGN="RIGHT">
 	          		<xsl:apply-templates select="Klali/Nitzul_Zakaut"/>
				</TD>
 	          	<TD CLASS="itemNum" WIDTH="55px" ALIGN="RIGHT">
 	          		<xsl:apply-templates select="Klali/Yitra_Lenitzul"/>
				</TD>
 	          	<TD CLASS="itemNum" WIDTH="79px" ALIGN="RIGHT">
 	          		<xsl:apply-templates select="Klali/Yemey_Chufsha_Tzvura"/>
				</TD>
 	          	<TD CLASS="itemNum" WIDTH="84px" ALIGN="RIGHT">
 	          		<xsl:apply-templates select="Klali/Erech_Yom_Tzvura"/>
				</TD>
			</TABLE>
		</span>

        <!-- נתוני  מס -->
        <span style="position:absolute; top:220px; left:10px;">
        	<TABLE>
        		<TD CLASS="itemNum" WIDTH="82px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Hachnasa_Shnatit_Lemas"/>
        		</TD>
        		<TD CLASS="itemNum" WIDTH="80px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Hachnasa_Zkufa"/>
        		</TD>
        		<TD CLASS="itemNum" WIDTH="90px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Hachnasot_Lo_Sotzialiot"/>
        		</TD>
        		<TD CLASS="itemNum" WIDTH="80px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Hachnasot_Chad_Paamiot"/>
        		</TD>
        	</TABLE>
        </span>
        <span style="position:absolute; top:265px; left:10px;">
        	<TABLE>
        		<TD CLASS="itemNum" WIDTH="82px" ALIGN="right">
		            <xsl:apply-templates select="Klali/Zikuy_Shnati_Bemas"/>
        		</TD>
        		<TD CLASS="itemNum" WIDTH="80px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Ptor_Shnati_Bemas"/>
        		</TD>
        		<TD CLASS="itemNum" WIDTH="90px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Mas_Hachnasa"/>
        		</TD>
        		<TD CLASS="itemNum" WIDTH="80px" ALIGN="right">
        			<xsl:apply-templates select="Klali/Achuz_Mas_Shuli"/>
        		</TD>
        	</TABLE>
        </span>

        <!-- נתונים גולמיים -->
        <span style="position:absolute; top:369px; left:10px;">
            <xsl:apply-templates select="Golmi"/>
        </span>

        <!-- שוטף -->
        <span style="position:absolute; top:684px; left:382px;">
            <xsl:apply-templates select="Tashlumim"/>
        </span>
        <span style="position:absolute; top:939px; left:384px;">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="74px" ALIGN="RIGHT">
                    <xsl:apply-templates select="Sikumim/Sum_Tashlumim"/>
                </TD>
            </TABLE>
        </span>

        <span style="position:absolute; top:684px; left:10px;">
            <xsl:apply-templates select="Nikuim"/>
        </span>
        <span style="position:absolute; top:937px; left:9px;" dir="ltr">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="76px" ALIGN="RIGHT">
                    <xsl:apply-templates select="Sikumim/Sum_Nikuim"/>
                </TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:958px; left:9px;" dir="ltr">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="76px" ALIGN="RIGHT">
                    <B><xsl:apply-templates select="Sikumim/Sum_Month_Neto"/></B>
                </TD>
            </TABLE>
        </span>

        <!-- הפרשים -->
        <span style="position:absolute; top:1046px; left:383px;">
            <xsl:apply-templates select="Hefresh_Tashlumim"/>
        </span>
        <span style="position:absolute; top:1300px; left:380px;">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="68px" ALIGN="RIGHT">
                    <xsl:apply-templates select="Sikumim/Sum_Hefresh_Tashlumim"/>
                </TD>
            </TABLE>
        </span>

        <span style="position:absolute; top:1043px; left:10px;">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="76px" ALIGN="RIGHT">
		            <xsl:apply-templates select="Hefresh_Nikuim"/>
                </TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:1300px; left:10px;" dir="ltr">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="65px" ALIGN="RIGHT">
                    <xsl:apply-templates select="Sikumim/Sum_Hefresh_Nikuim"/>
                </TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:1320px; left:10px;" dir="ltr">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="65px" ALIGN="RIGHT">
                    <B><xsl:apply-templates select="Sikumim/Sum_Hefresh_Neto"/></B>
                </TD>
            </TABLE>
        </span>

        <!-- התחייבויות יזומות -->
        <span style="position:absolute; top:1429px; left:9px;">
            <xsl:apply-templates select="Yazumot"/>
        </span>
        <span style="position:absolute; top:1685px; left:9px;" dir="ltr">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="88x" ALIGN="RIGHT">
                    <xsl:apply-templates select="Sikumim/Sum_Yazumot_Neto"/>
                </TD>
            </TABLE>
        </span>

        <!-- נתונים סיכומיים -->
        <span style="position:absolute; top:1710px; left:1px;">
            <TABLE>
                <TD CLASS="itemNum" WIDTH="98px" ALIGN="RIGHT">
                    <B><xsl:apply-templates select="Sikumim/Sum_Trans"/></B>
                </TD>
            </TABLE>
        </span>
        <span style="position:absolute; top:1760px; left:520px;">
        	<TABLE BORDER="0">
        		<TD CLASS="itemNum" WIDTH="60px" ALIGN="center">
        			<xsl:apply-templates select="Klali/Kod_Ishi"/>
        		</TD>
        	</TABLE>

        </span>

        <!-- הודעות לפרט -->
        <span style="position:absolute; left:13px; top:1830px">
            <xsl:apply-templates select="Hodaot"/>
	    <span style="position:absolute; left:15px; top:274px">
		<TABLE BORDER= "0">
			<TD CLASS="tlushTd" align="right">
		            מ.א.<xsl:apply-templates select="Klali/Mispar_Ishi"/>
        		</TD>
        		<TD CLASS="tlushTd" align="right">
		            <xsl:apply-templates select="Klali/Darga"/>
		            <xsl:apply-templates select="Klali/Shem_Mishpacha"/>
		            <xsl:apply-templates select="Klali/Shem_Prati"/>
        		</TD>
           	</TABLE>
      	   </span>
        </span>

    </xsl:template>

    <!-- נתונים כללים -->
	<xsl:template match="Klali"></xsl:template>

    <!-- נתונים גולמיים -->
	<xsl:template match="Golmi">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="711px" CELLPADDING="0">
			<TR>
				<TD CLASS="tlushTd" VALIGN="TOP" WIDTH="350px">
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<xsl:for-each select="Natun_Golmi[position() &lt; 18]">
							<xsl:choose>
								<xsl:when test="Golmi_New[.='*']">
									<TR>
										<TD CLASS="golmiNew" WIDTH="147px">
											<xsl:apply-templates select="Golmi_New"/>
											<span dir="ltr">
												<A>
													<xsl:attribute name="natunName">
														<xsl:apply-templates select="Golmi_Name"/>
													</xsl:attribute>
													<xsl:apply-templates select="Golmi_Name"/>
												</A>
											</span>
										</TD>
										<TD CLASS="golmiNew" WIDTH="123px">
											<span dir="ltr">
												<xsl:apply-templates select="Golmi_Value"/>
											</span>
										</TD>
										<TD CLASS="golmiNew" WIDTH="65px" ALIGN="CENTER">
											<xsl:apply-templates select="Start_Date"/>
										</TD>
									</TR>
								</xsl:when>
<!--								<xsl:if test=".[Golmi_New='']"> -->
<!--								<xsl:if test="self::node()[Golmi_New='']">	-->
<!--								<xsl:test="Golmi_New[.='']"">	-->
								<xsl:otherwise>
									<TR>
										<TD CLASS="itemText" WIDTH="147px">
											<span dir="ltr">
												<A>
													<xsl:attribute name="natunName">
														<xsl:apply-templates select="Golmi_Name"/>
													</xsl:attribute>
													<xsl:apply-templates select="Golmi_Name"/>
												</A>
											</span>
										</TD>
										<TD CLASS="itemText" WIDTH="123px">
											<span dir="ltr">	
												<xsl:apply-templates select="Golmi_Value"/>
											</span>
										</TD>
										<TD CLASS="itemNum" WIDTH="61px" ALIGN="CENTER">
											<xsl:apply-templates select="Start_Date"/>
										</TD>
									</TR>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</TABLE>
				</TD>
				<TD CLASS="tlushTd" WIDTH="22px"/>
				<TD CLASS="tlushTd" VALIGN="TOP">
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<xsl:for-each select="Natun_Golmi[*]">
					 	<xsl:if test="position() &gt; 17">
							<xsl:choose>
								<xsl:when test="Golmi_New[.='*']">
									<TR>
										<TD CLASS="golmiNew" WIDTH="147px">
											<xsl:apply-templates select="Golmi_New"/>
											<span dir="ltr">
												<A>
													<xsl:attribute name="natunName">
														<xsl:apply-templates select="Golmi_Name"/>
													</xsl:attribute>
													<xsl:apply-templates select="Golmi_Name"/>
												</A>
											</span>
										</TD>
										<TD CLASS="golmiNew" WIDTH="123px">
											<span dir="ltr">
												<xsl:apply-templates select="Golmi_Value"/>
											</span>
										</TD>
										<TD CLASS="golmiNew" WIDTH="61px" ALIGN="CENTER">
											<xsl:apply-templates select="Start_Date"/>
										</TD>
									</TR>
								</xsl:when>
<!--								<xsl:if test=".[Golmi_New='']">	-->
<!--								<xsl:if test="self::node()[Golmi_New='']">	-->
<!--								<xsl:if test="Golmi_New[.='']">-->
								<xsl:otherwise>
									<TR>
										<TD CLASS="itemText" WIDTH="147px">
											<span dir="ltr">
												<A>
													<xsl:attribute name="natunName">
														<xsl:apply-templates select="Golmi_Name"/>
													</xsl:attribute>
													<xsl:apply-templates select="Golmi_Name"/>
												</A>
											</span>
										</TD>
										<TD CLASS="itemText" WIDTH="123px">
											<span dir="ltr">
												<xsl:apply-templates select="Golmi_Value"/>
											</span>
										</TD>
										<TD CLASS="itemNum" WIDTH="61px" ALIGN="CENTER">
											<xsl:apply-templates select="Start_Date"/>
										</TD>
									</TR>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:for-each>
					</TABLE>
				</TD>
			</TR>
		</TABLE>

	</xsl:template>
	<xsl:template match="Natun_Golmi">
<!--	<xsl:if test=".[Golmi_New='*']">	-->
<!--	<xsl:if test="self::node()[Golmi_New='*']"> -->
		<xsl:choose>
			<xsl:when test="Golmi_New[.='*']">
				<TR>
					<TD CLASS="golmiNew">
						<xsl:apply-templates select="Golmi_New"/>
						<span dir="ltr">
							<A>
								<xsl:attribute name="natunName">
									<xsl:apply-templates select="Golmi_Name"/>
								</xsl:attribute>
								<xsl:apply-templates select="Golmi_Name"/>
							</A>
						</span>
					</TD>
					<TD CLASS="golmiNew">
						<span dir="ltr">
							<xsl:apply-templates select="Golmi_Value"/>
						</span>
					</TD>
					<TD CLASS="golmiNew">
						<xsl:apply-templates select="Start_Date"/>
					</TD>
				</TR>
			</xsl:when>
<!--			<xsl:if test=".[Golmi_New='']">	-->
<!--			<xsl:if test="self::node()[Golmi_New='']">	-->
<!--			<xsl:if test="Golmi_New[.='']"> -->
			<xsl:otherwise>
				<TR>
					<TD CLASS="itemText">
						<span dir="ltr">
							<A>
								<xsl:attribute name="natunName">
									<xsl:apply-templates select="Golmi_Name"/>
								</xsl:attribute>
								<xsl:apply-templates select="Golmi_Name"/>
							</A>
						</span>	
					</TD>
					<TD CLASS="itemText">
						<span dir="ltr">
							<xsl:apply-templates select="Golmi_Value"/>
						</span>
					</TD>
					<TD CLASS="itemNum">
						<xsl:apply-templates select="Start_Date"/>
					</TD>
				</TR>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- תשלומים שוטפים -->
	<xsl:template match="Tashlumim">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="339px">
			<xsl:apply-templates select="Natun_Tashlum"/>
		</TABLE>
	</xsl:template>
	<xsl:template match="Natun_Tashlum">
		<TR>
<!--		<xsl:apply-templates/> -->
			<xsl:apply-templates select="Tashlum_Name"/>
			<xsl:apply-templates select="Tashlum_Last_Value"/>
			<xsl:apply-templates select="Tashlum_Curr_Value"/>
		</TR>
	</xsl:template>
	<xsl:template match="Tashlum_Name">
		<TD CLASS="itemText" WIDTH="177px">
			<span dir="ltr">
				<A>
					<xsl:attribute name="natunName">
						<xsl:value-of select="."/>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</A>
			</span>
		</TD>
	</xsl:template>
	<xsl:template match="Tashlum_Last_Value">
		<TD CLASS="itemNum" WIDTH="82px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Tashlum_Curr_Value">
		<TD CLASS="itemNum">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>

    <!-- ניכויים שוטפים -->
	<xsl:template match="Nikuim">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="339px">
			<xsl:apply-templates select="Natun_Nikui"/>
		</TABLE>
	</xsl:template>
	<xsl:template match="Natun_Nikui">
		<TR>
<!--		<xsl:apply-templates/>	-->
			<xsl:apply-templates select="Nikui_Name"/>
			<xsl:apply-templates select="Nikui_Last_Value"/>
			<xsl:apply-templates select="Nikui_Curr_Value"/>
		</TR>
	</xsl:template>
	<xsl:template match="Nikui_Name">
		<TD CLASS="itemText" WIDTH="176px">
			<span dir="ltr">
				<A>
					<xsl:attribute name="natunName">
						<xsl:value-of select="."/>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</A>
			</span>
		</TD>
	</xsl:template>
	<xsl:template match="Nikui_Last_Value">
		<TD CLASS="itemNum" WIDTH="83px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Nikui_Curr_Value">
		<TD CLASS="itemNum">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>

	<!-- הפרשי תשלומים -->
	<xsl:template match="Hefresh_Tashlumim">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="338px">
			<xsl:apply-templates select="Natun_Hefresh_Tashlum"/>
		</TABLE>
	</xsl:template>
	<xsl:template match="Natun_Hefresh_Tashlum">
		<TR>
<!--		<xsl:apply-templates/>	-->
			<xsl:apply-templates select="Hefresh_Tashlum_Name"/>
			<xsl:apply-templates select="Hefresh_Tashlum_From_Date"/>
			<xsl:apply-templates select="Hefresh_Tashlum_To_Date"/>
			<xsl:apply-templates select="Hefresh_Tashlum_Value"/>
		</TR>
	</xsl:template>
	<xsl:template match="Hefresh_Tashlum_Name">
		<TD CLASS="itemText" WIDTH="149px">
			<span dir="ltr">
				<A>
					<xsl:attribute name="natunName">
						<xsl:value-of select="."/>
					</xsl:attribute>
					<xsl:value-of select="."/>
				</A>
			</span>
		</TD>
	</xsl:template>
	<xsl:template match="Hefresh_Tashlum_From_Date">
		<TD CLASS="itemNum" WIDTH="59px" ALIGN="center">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Hefresh_Tashlum_To_Date">
		<TD CLASS="itemNum" WIDTH="60px" ALIGN="center">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Hefresh_Tashlum_Value">
		<TD CLASS="itemNum">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>

	<!-- הפרשי ניכויים -->
	<xsl:template match="Hefresh_Nikuim">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="337px">
			<xsl:apply-templates select="Natun_Hefresh_Nikui"/>
		</TABLE>
	</xsl:template>
	<xsl:template match="Natun_Hefresh_Nikui">
		<TR>
<!--		<xsl:apply-templates/>	-->
			<xsl:apply-templates select="Hefresh_Nikui_Name"/>
			<xsl:apply-templates select="Hefresh_Nikui_From_Date"/>
			<xsl:apply-templates select="Hefresh_Nikui_To_Date"/>
			<xsl:apply-templates select="Hefresh_Nikui_Value"/>
		</TR>
	</xsl:template>
	<xsl:template match="Hefresh_Nikui_Name">
		<TD CLASS="itemText" WIDTH="150px">
			<A>
				<xsl:attribute name="natunName">
					<xsl:value-of select="."/>
				</xsl:attribute>
				<xsl:value-of select="."/>
			</A>
		</TD>
	</xsl:template>
	<xsl:template match="Hefresh_Nikui_From_Date">
		<TD CLASS="itemNum" WIDTH="59px" ALIGN="center">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Hefresh_Nikui_To_Date">
		<TD CLASS="itemNum" WIDTH="59px" ALIGN="center">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Hefresh_Nikui_Value">
		<TD CLASS="itemNum">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>

	<!-- התחיבויות יזומות -->
	<xsl:template match="Yazumot">
		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<xsl:apply-templates select="Natun_Yazum"/>
		</TABLE>
	</xsl:template>
	<xsl:template match="Natun_Yazum">
		<TR>
<!--		<xsl:apply-templates/>	-->
			<xsl:apply-templates select="Yazum_Name"/>
			<xsl:apply-templates select="Yazum_Details"/>
			<xsl:apply-templates select="Yazum_Asmachta"/>
			<xsl:apply-templates select="Yazum_From_Date"/>
			<xsl:apply-templates select="Yazum_To_Date"/>
			<xsl:apply-templates select="Yazum_Org_Value"/>
			<xsl:apply-templates select="Yazum_Nu_Of_Nikuim"/>
			<xsl:apply-templates select="Yazum_Itrat_Hov"/>
			<xsl:apply-templates select="Yazum_Value_Hiuv"/>
			<xsl:apply-templates select="Yazum_Siman_Z"/>
		</TR>
	</xsl:template>
	<xsl:template match="Yazum_Name">
		<TD CLASS="itemText" WIDTH="107px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Details">
		<TD CLASS="itemText" WIDTH="157px">
			<span dir="ltr">
				<xsl:value-of select="."/>
			</span>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Asmachta">
		<TD CLASS="itemNum" WIDTH="80px">
			<span dir="ltr">
				<xsl:value-of select="."/>
			</span>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_From_Date">
		<TD CLASS="itemNum" WIDTH="51px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_To_Date">
		<TD CLASS="itemNum" WIDTH="42px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Org_Value">
		<TD CLASS="itemNum" WIDTH="61px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Nu_Of_Nikuim">
		<TD CLASS="itemNum" WIDTH="43px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Itrat_Hov">
		<TD CLASS="itemNum" WIDTH="77px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Value_Hiuv">
		<TD CLASS="itemNum" WIDTH="64px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>
	<xsl:template match="Yazum_Siman_Z">
		<TD CLASS="itemNum" WIDTH="29px">
			<xsl:value-of select="."/>
		</TD>
	</xsl:template>

	<!-- הודעות -->
	<xsl:template match="Hodaot">
		<TABLE BORDER="0" CELLSPACING="0" WIDTH="720px" CELLPADDING="0">
			<TR>
				<TD CLASS="tlushTd" WIDTH="25px"/>
				<TD CLASS="tlushTd" VALIGN="TOP" WIDTH="290px">
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
<!--					<xsl:for-each select="Hodaa[index() $le$ 19]">	-->
						<xsl:for-each select="Hodaa[position() &lt;= 19]">
							<TR>
								<TD ALIGN="RIGHT" DIR="LTR" CLASS="odaotTd">
									<xsl:value-of select="."/>
								</TD>
							</TR>
						</xsl:for-each>
					</TABLE>
				</TD>
				<TD CLASS="tlushTd" WIDTH="25px"/>
				<TD CLASS="tlushTd" VALIGN="TOP" WIDTH="300px">
					<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0">
<!--					<xsl:for-each select="Hodaa[index() $gt$ 19]">	-->
						<xsl:for-each select="Hodaa[(position()&gt;19)]">
							<TR>
								<TD ALIGN="RIGHT" DIR="LTR" CLASS="odaotTd">
									<xsl:value-of select="."/>
								</TD>
							</TR>
						</xsl:for-each>
					</TABLE>
				</TD>
			</TR>
		</TABLE>
	</xsl:template>

	<!-- נתונים סיכומיים -->
	<xsl:template match="Sikumim"></xsl:template>
	<xsl:template match="Sum_Tashlumim">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Nikuim">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Month_Neto">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Hefresh_Tashlumim">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Hefresh_Nikuim">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Hefresh_Neto">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Yazumot_Neto">
		<xsl:value-of select="."/>
	</xsl:template>
	<xsl:template match="Sum_Trans">
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
