<%@ taglib prefix="c" uri="/WEB-INF/tld/c.tld"%>
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma","no-cache");
%>
<div id="hiddenDiv">
	<jsp:include page="/pages/userAccess.jsp"></jsp:include>
	<input type="hidden" id="adhocUser" name="adhocUser" value="${adhocUser}">
<!-- <input type="hidden" id="adhocUser" name="adhocUser" value="BADZ"> -->
</div>
<script type="text/javascript">
	//init user access
	//all
	var userAccess = '{"userAccess" :';
	var userAccess2 = $F("userAccessList");
	var userAccess3 = '}';
	var userAccessConcat = userAccess.concat(userAccess2.concat(userAccess3));
	if (userAccessConcat == '{"userAccess" :}') {
		var userId = $F("adhocUser");
		new Ajax.Updater(
				"hiddenDiv",
				contextPath
						+ "/GIISUserController?action=getUserAccess&userId="
						+ userId,
				{
					evalScripts : true,
					asynchronous : true,
					onCreate : showNotice("Fetching User Details. Please wait..."),
					onComplete : function(response) {
						location.reload();
						hideNotice("");
					}
				});
	}
	var userAccessObj = userAccess.concat(userAccess2.concat(userAccess3))
			.evalJSON();
	var userAccessObjLength = userAccessObj.userAccess.length;

	//tranCd
	var userTranCd = '{"userTranCd" : ' + $F("userTranCdList") + '}';
	var userOk = false;
	var tranCdObj = JSON.parse(userTranCd);
	var propNames = Object.keys(tranCdObj);
	var tranCdLength = tranCdObj.userTranCd.length;

	//claims lineCd
	var userClaimsLineCd = '{"userLineCd" : ' + $F("userClaimsLineCdList")
			+ '}';
	var claimsLineCdObj = JSON.parse(userClaimsLineCd);
	var lineCdClaimsLength = claimsLineCdObj.userLineCd.length;
	
	//policy issuance lineCd
	var userPolIssuanceLineCd = '{"userLineCd" : '
			+ $F("userPolIssuanceLineCdList") + '}';
			//alert(userPolIssuanceLineCd);
	var polIssuanceLineCdObj = JSON.parse(userPolIssuanceLineCd);
	var lineCdPolIssuanceLength = polIssuanceLineCdObj.userLineCd.length;

	//policy issuance isscd
	var userPolIssuanceIssCd = '{"userIssCd" : '
			+ $F("userPolIssuanceIssCdList") + '}';
	var polIssuanceIssCdObj = JSON.parse(userPolIssuanceIssCd);
	var issCdPolIssuanceLength = polIssuanceIssCdObj.userIssCd.length;

	//module
	var userModule1 = '{"userModuleId" :';
	var userModule2 = $F("userModuleList");
	var userModule3 = '}';
	var userModuleConcat = userModule1.concat(userModule2.concat(userModule3));
	var userModuleObj = userModule1.concat(userModule2.concat(userModule3))
			.evalJSON();
	var moduleIdObjLength = userModuleObj.userModuleId.length;
</script>

<div id="adHocMainMenu">
	<div id="mainNav" name="mainNav">
		<div id="smoothmenu1" name="smoothmenu1" class="ddsmoothmenu">
			<ul>
				<li><a id="claims">Claims</a>
					<ul style="width: 230px;">
						<li><a id="claimsListing" name="claimsListing">Claims
								Listing/Aging per Processor</a></li>
						<li><a id="demandLetter" name="demandLetter">Demand
								Letter</a></li>
						<li><a id="lossesPaidMotor" name="lossesPaidMotor">Losses
								Paid - Motorshop</a></li>
						<li><a id="offerLetter" name="offerLetter">Motor Car -
								Offer Letter</a></li>
						<li><a id="mcSworn" name="mcSworn">Motor Car - Sworn
								Statement in Proof of Loss</a></li>
						<li><a id="transmittal" name="transmittal">Motor Car -
								Transmittal</a></li>
					</ul></li>
				<li><a id="collections">Coll/Acctg/Treasury</a>
					<ul style="width: 180px;">
						<li><a id="collectionBreakdown" name="collectionBreakdown">Collection
								Breakdown</a></li>
						<li><a id="commissionFund" name="commissionFund">Commission
								Fund</a></li>
						<li><a id="inquiryMetrobank" name="inquiryMetrobank">Inquiry
								- Metrobank Referror</a></li>
						<li><a id="intertradeCheckReport"
							name="intertradeCheckReport">Intertrade/BNC - Check Report</a></li>
						<li><a id="issuedApdc" name="issuedApdc">Issued
								Acknowledgement of APDC</a>
						<li><a id="jvPerUser" name="jvPerUser">Journal Voucher
								Entries Per User</a></li>
						<li><a id="outstandingAPDC" name="outstandingAPDC">Outstanding
								APDC</a></li>
						<li><a id="paidPremiums" name="paidPremiums">Paid
								Premiums by Intermediary</a></li>
						<li><a id="receiptedDollarAcct" name="receiptedDollarAcct">Receipted
								Dollar Account</a></li>
						<li><a id="soaPerAssdIntm" name="soaPerAssdIntm">SOA per
								Assured/Intermediary</a></li>
						<li><a id="orixSoaExt" name="orixSoaExt">Statement of
								Account - ORIX</a></li>
						<li><a id="orixSoaExt2" name="orixSoaExt2">Check Warehouse</a></li>		
						<li><a id="updateRefName" name="updateRefName">Update
								Referror Name</a></li>
						<!-- <li class="menuSeparator"></li>
						<li><a id="endOfMonth" name="dynamicUrl">End Of Month</a>
							<ul style="width: 160px;">
								<li><a id="monthEndReports" name="monthEndReports">Month End Reports</a></li>
							</ul></li> -->
						<!-- <li><a id="checkRequest" name="checkRequest">Update
								Check Request</a></li> -->
						<!-- <li><a id="checkRequest" name="checkRequest">Intertrade/NEV
								Check Request</a></li> -->
						<li class="menuSeparator"></li>
						<li><a id="dynamicUrl" name="dynamicUrl">Dynamic URL</a></li>
					</ul></li>
				<li><a id="policyIssuance">Policy Issuance</a>
					<ul style="width: 120px;">
						<li><a id="onePager" name="onePager">One Pager</a>
							<ul style="width: 160px;">
								<li><a id="mcOnePager" name="mcOnePager">Motor Car
										Policy One Pager</a></li>
								<!-- <li><a id="12pMcOnePager" name="12pMcOnePager">12P
										Motor Car One Pager</a></li> -->
								<li><a id="regFiOnePager" name="regFiOnePager">REG Fire
										Policy One Pager</a></li>
								<!-- <li><a id="clgFiOnePager" name="clgFiOnePager">CLG Fire
										Policy One Pager</a></li>
								<li><a id="12pFiOnePager" name="12pFiOnePager">12P Fire
										Policy One Pager</a></li>
								<li><a id="psFiOnePager" name="psFiOnePager">PS Fire
										Policy One Pager</a></li> -->
								<li><a id="ocOnePager" name="ocOnePager">Other Casualty
										One Pager</a></li>
								<!-- <li><a id="12paOnePager" name="12paOnePager">12P PA
										Policy One Pager</a></li> -->
								<li class="menuSeparator"></li>
								<li><a id="clgOnePager" name="clgOnePager">CLG One Pager
								</a></li>
								<li><a id="psBankOnePager" name="psBankOnePager">PS BANK One Pager
								</a></li>
								<li><a id="12planOnePager" name="12planOnePager">12 Plan One Pager
								</a></li>
							</ul></li>
						<li><a id="renewal" name="renewal">Renewal</a>
							<ul style="width: 160px;">
								<li><a id="enRenewal" name="enRenewal">Engineering -
										Renewal Notice</a></li>
								<li><a id="mcRenewal" name="mcRenewal">Motor Car -
										Renewal Notice</a></li>
								<li><a id="fiRenewal" name="fiRenewal">Fire - Renewal
										Notice</a></li>
								<li><a id="ocRenewal" name="ocRenewal">Other Casualty -
										Renewal Notice</a></li>
								<li><a id="paRenewal" name="paRenewal">PA - Renewal
										Notice</a></li>
							</ul></li>
						<li><a id="bonds" name="bonds">Bonds</a>
							<ul style="width: 160px;">
								<li><a id="SOtherBondDoc" name="SOtherBondDoc">Surety
										Other Bond Documents</a></li>
								<li><a id="bondDetails" name="bondDetails">Surety Bond
										Detail Maintenance</a></li>
							</ul></li>
						<li class="menuSeparator"></li>
						<li><a id="nonRenewal" name="nonRenewal">Non Renewal</a></li>
						<li class="menuSeparator"></li>
						<li><a id="thankYou" name="thankYou">Thank You Letter</a></li>
						<li class="menuSeparator"></li>
						<li><a id="confirmedPolicy" name="confirmedPolicy">Confirmed
								Policy</a></li>
					</ul></li>
				<li><a id="reinsurance">Reinsurance</a>
					<ul style="width: 150px;">
						<li><a id="riBinder" name="riBinder">Binder Printing</a></li>
					</ul></li>
				<li><a id="underwriting">Underwriting</a>
					<ul style="width: 150px;">
						<!-- <li><a id="catAccumulation" name="catAccumulation">CAT Accumulation</a></li> -->
						<li><a id="issuedBonds" name="issuedBonds">Issued Bonds</a></li>
						<li><a id="psBank" name="psBank">Ps Bank Posted Policy</a></li>
						<li><a id="pamsIssuance" name="pamsIssuance">PAMS
								Issuance</a></li>
						<!-- <li><a id="postedPolicy" name="postedPolicy">Posted Policies Per User</a></li> -->
						<li><a id="premProduction" name="premProduction">Premium
								Production Report</a></li>
						<li><a id="toyotaDealers" name="toyotaDealers">Toyota
								Dealers Report</a></li>
						<li class="menuSeparator"></li>
						<li><a id="batchGen" name="batchGen">Batch Generation</a></li>
						<li><a id="gwpReport" name="gwpReport">GWP Report</a></li>
						<li><a id="pamsCash" name="pamsCash">PAMS Cashier</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>

<div id="blankDiv1">
</div>

<script type="text/javascript">
	$("blankDiv1").hide();
	initializeMenu();
	var divToUpdate = "mainContents";
	var userId = $F("adhocUser");
	//end homepage

	/* CLAIMS MENU */
	if (!checkUserTranCd('93', tranCdLength, tranCdObj)) {
		$('claims').setStyle('color: rgb(176, 176, 176)');
		disableMenu('claimsListing');
		disableMenu('offerLetter');
		disableMenu('mcSworn');
		disableMenu('demandLetter');
		disableMenu('transmittal');
		disableMenu('lossesPaidMotor');
	} else {
		//check per module
		//checkUserAccess2('FCLMLSTAGE', moduleIdObjLength, userModuleObj,"claimsListing","/pages/claims/Claims Listing/claimsListing.jsp","Claims Listing/Aging per Processor");
		checkUserAccess2('FCLMLSTAGE', moduleIdObjLength, userModuleObj,
				"claimsListing",
				"/ClaimsListingController?action=toClaimsListingPage&tranCd=93&userId="+userId,
				"Claims Listing/Aging per Processor");
		checkUserAccess2('MOTORSHOP', moduleIdObjLength, userModuleObj,
				"lossesPaidMotor", "/pages/claims/Losses Paid/lossesPaid.jsp",
				"Losses Paid - Motorshop");
		checkUserAccess2('FCLTOTOFFR', moduleIdObjLength, userModuleObj,
				"offerLetter",
				"/OfferLetterController?action=toOfferLetterPage",
				"Motor Car - Offer Letter(Total Loss/Carnap)");
		checkUserAccess2('FINALSWORN', moduleIdObjLength, userModuleObj,
				"mcSworn", "/pages/claims/MC Sworn/mcSworn.jsp",
				"Motor Car - Sworn Statement in Proof of Loss");
		checkUserAccess2("FCLTRNSMTL", moduleIdObjLength, userModuleObj,
				"transmittal",
				"/TransmittalController?action=toTransmittalPage",
				"Motor Car - Transmittal(Total Loss/Carnap)");
		checkUserAccess2("FCLDMNDLET", moduleIdObjLength, userModuleObj,
				"demandLetter", "/pages/claims/Demand Letter/demandLetter.jsp", "Demand Letter");
		if (!checkUserLineCd('MC', lineCdClaimsLength, claimsLineCdObj)) {
			disableMenu('lossesPaidMotor');
			disableMenu('mcSworn');
			disableMenu('offerLetter');
			disableMenu('demandLetter');
			disableMenu('transmittal');
		}
	}
	/**END CLAIMS MENU***/

	/**COLLECTIONS MENU**/
	if (!checkUserTranCd('94', tranCdLength, tranCdObj)) {
		$('collections').setStyle('color: rgb(176, 176, 176)');
		disableMenu('collectionBreakdown');
		disableMenu('commissionFund');
		disableMenu('inquiryMetrobank');
		disableMenu('intertradeCheckReport');
		disableMenu('issuedApdc');
		disableMenu('jvPerUser');
		disableMenu('outstandingAPDC');
		disableMenu('paidPremiums');
		disableMenu('receiptedDollarAcct');
		disableMenu('soaPerAssdIntm');
		disableMenu('orixSoaExt');
		disableMenu('orixSoaExt2');
		disableMenu('updateRefName');
		disableMenu('endOfMonth');
		disableMenu('dynamicUrl');
		//disableMenu('checkRequest');
	} else {
		//check per module
		checkUserAccess2(
				'UTILITY',
				moduleIdObjLength,
				userModuleObj,
				"collectionBreakdown",
				"/CollectionBreakdownController?action=toCollectionBreakdownPage&tranCd=94&userId="+userId,
				"Collection Breakdown");
		checkUserAccess2('FCOMMFUND', moduleIdObjLength, userModuleObj,
				"commissionFund",
				"/CommissionFundController?action=toCommissionFundPage&tranCd=94&userId="+userId,
				"Commission Fund");
		checkUserAccess2('INTCHKINQ', moduleIdObjLength, userModuleObj,
				"inquiryMetrobank",
				"/pages/collections/inquiry metrobank/inquiryMetrobank.jsp",
				"Inquiry - Metrobank Referror");

		checkUserAccess2('FACCHKREP', moduleIdObjLength, userModuleObj,
				"intertradeCheckReport",
				"/IntertradeCheckReportController?action=toPage&tranCd=94&userId="+userId,
				"Intertrade/BNC - Check Report");

		checkUserAccess2('FISSAPDC', moduleIdObjLength, userModuleObj,
				"issuedApdc", "/IssuedApdcController?action=IssuedApdc&tranCd=94&userId="+userId,
				"Issued APDC");
		checkUserAccess2('FJVPERUSER', moduleIdObjLength, userModuleObj,
				"jvPerUser", "/JvPerUserController?action=toJvPerUserPage",
				"Journal Voucher Entries Per User");
		checkUserAccess2('OUTS_APDC', moduleIdObjLength, userModuleObj,
				"outstandingAPDC", "/OsApdcController?action=OsApdc&tranCd=94&userId="+userId,
				"Outstanding APDC");
		checkUserAccess2('FPAIDPREM', moduleIdObjLength, userModuleObj,
				"paidPremiums",
				"/PaidPremiumsController?action=toPaidPremiumsPage&tranCd=94&userId="+userId,
				"Paid Premiums by Intermediary");
		checkUserAccess2('DOLLAR', moduleIdObjLength, userModuleObj,
				"receiptedDollarAcct",
				"/pages/collections/dollar/receiptedDollarAcct.jsp",
				"Receipted Dollar Account");
		checkUserAccess2('SOA_FINAL', moduleIdObjLength, userModuleObj,
				"soaPerAssdIntm", "/SOAperAssdIntmController?action=toSOAPage&tranCd=94&userId="+userId,
				"SOA per Assured/Intermediary");
		checkUserAccess2('FSOAORIX', moduleIdObjLength, userModuleObj,
				"orixSoaExt", "/SoaOrixExtController?action=OrixSoaExt&tranCd=94&userId="+userId, "Statement of Account ORIX");
		checkUserAccess2('FISSAPDC', moduleIdObjLength, userModuleObj,
                "orixSoaExt2", "/SoaOrixExtController2?action=OrixSoaExt2&tranCd=94&userId="+userId, 
                "Check Warehouse");
		checkUserAccess2('FACINTRADE', moduleIdObjLength, userModuleObj,
				"updateRefName",
				"/pages/collections/update referror name/updateRefName.jsp",
				"Inquiry - Metrobank Referror");
		checkUserAccess2('MONTHEND', moduleIdObjLength, userModuleObj,
				"monthEndReports",
				"/MonthEndProdReportController?action=toMonthEndReportPage",
				/* "/pages/collections/month end/monthEndReports.jsp", */
				"Month End Reports");
		/* checkUserAccess2('FACCHKREP', moduleIdObjLength, userModuleObj,
				"checkRequest", "/CheckRequestController?action=toCheckRequest&userId="+userId, "Update Check Request"); */
		
		$("dynamicUrl").observe("click", function() {
			goToModule(divToUpdate, contextPath + "/DynamicUrlController?action=toPage", "Please wait.........", "Dynamic URL");
		});
	}
	/**END COLLECTIONS MENU**/

	/*POLICY ISSUANCE MENU  */
	if (!checkUserTranCd('95', tranCdLength, tranCdObj)) {
		$('policyIssuance').setStyle('color: rgb(176, 176, 176)');
		$('onePager').setStyle('color: rgb(176, 176, 176)');
		$('renewal').setStyle('color: rgb(176, 176, 176)');
		$('bonds').setStyle('color: rgb(176, 176, 176)');

		disableMenu('enRenewal');
		disableMenu('mcRenewal');
		disableMenu('fiRenewal');
		disableMenu('ocRenewal');
		disableMenu('paRenewal');
		disableMenu('mcOnePager');
		//disableMenu('12pMcOnePager');
		disableMenu('regFiOnePager');
		//disableMenu('clgFiOnePager');
		//disableMenu('12pFiOnePager');
		//disableMenu('psFiOnePager');
		disableMenu('ocOnePager');
		//disableMenu('12paOnePager');
		disableMenu('SOtherBondDoc');
		disableMenu('bondDetails');
		disableMenu('nonRenewal');
		disableMenu('thankYou');
		disableMenu('confirmedPolicy');
		disableMenu('batchGen');
		
		disableMenu('clgOnePager');
		disableMenu('psBankOnePager');
		disableMenu('12planOnePager');
	} else {
		//renewal
		//check renewal access per module
		checkUserAccess2('FENRENNOTE', moduleIdObjLength, userModuleObj,
				"enRenewal", "/RenewalNoticeController?action=toENRenewal","Engineering - Renewal Notice");
		checkUserAccess2('FMCRENOTE', moduleIdObjLength, userModuleObj,
				"mcRenewal", "/RenewalNoticeController?action=toMCRenewal","Motor Car - Renewal Notice");
		checkUserAccess2('FFIRENNOTE', moduleIdObjLength, userModuleObj,
				"fiRenewal", "/RenewalNoticeController?action=toFIRenewal","Fire - Renewal Notice");
		checkUserAccess2('FPARENNOTE', moduleIdObjLength, userModuleObj,
				"ocRenewal", "/RenewalNoticeController?action=toOCRenewal","Other Casualty - Renewal Notice");
		checkUserAccess2('FPARENNOTE', moduleIdObjLength, userModuleObj,
				"paRenewal", "/RenewalNoticeController?action=toPARenewal","Personal Accident - Renewal Notice");

		//thank you letter
		checkUserAccess2('FTYLETTER', moduleIdObjLength, userModuleObj,
				"thankYou", "/ThankYouLetterController?action=toThankYouPage&tranCd=95&userId="+userId, "Thank You Letter");

		//to set to function
		if (!checkUserLineCd('MC', lineCdPolIssuanceLength,
				polIssuanceLineCdObj)) {
			disableMenu('thankYou');
		}
		if (!checkUserLineCd('EN', lineCdPolIssuanceLength,
				polIssuanceLineCdObj)) {
			disableMenu('enRenewal');
		}
		if (!checkUserLineCd('MC', lineCdPolIssuanceLength,
				polIssuanceLineCdObj)) {
			disableMenu('mcRenewal');
		}
		if (!checkUserLineCd('FI', lineCdPolIssuanceLength,
				polIssuanceLineCdObj)) {
			disableMenu('fiRenewal');
		}
		if (!checkUserLineCd('PA', lineCdPolIssuanceLength,
				polIssuanceLineCdObj)) {
			disableMenu('paRenewal');
		}
		

		//one pager
		checkUserAccess2('FMCCONFCOV', moduleIdObjLength, userModuleObj,
				"mcOnePager", "/OnePagerController?action=toMC","Motor Car One Pager");
		/* checkUserAccess2('FCMC_TP', moduleIdObjLength, userModuleObj,
				"12pMcOnePager", "/OnePagerController?action=to12PMC",
				"Please wait.....", "12P Motor Car One Pager"); */
		checkUserAccess2('GIRC003', moduleIdObjLength, userModuleObj,
				"regFiOnePager", "/OnePagerController?action=toREGFI","REG Fire One Pager");
		/* checkUserAccess2('GIRC003', moduleIdObjLength, userModuleObj,
				"clgFiOnePager", "/OnePagerController?action=toCLGFI",
				"Please wait.....", "CLG Fire One Pager");
		checkUserAccess2('GIRC003', moduleIdObjLength, userModuleObj,
				"12pFiOnePager", "/OnePagerController?action=to12PFI",
				"Please wait.....", "12P Fire One Pager"); 
		checkUserAccess2('GIRC003', moduleIdObjLength, userModuleObj,
				"psFiOnePager", "/OnePagerController?action=toPSFI",
				"Please wait.....", "PS Fire One Pager");*/
		checkUserAccess2('FOCINDEMTY', moduleIdObjLength, userModuleObj,
				"ocOnePager", "/OnePagerController?action=toOC","Other Casualty One Pager");
		/* checkUserAccess2('FPACOC', moduleIdObjLength, userModuleObj,
				"12paOnePager", "/OnePagerController?action=to12pPA",
				"Please wait.....", "12P PA One Pager"); */
		
		var clgAccess = 'GIRC003 GPRC004 ';
		checkUserAccess3(clgAccess, moduleIdObjLength,
				userModuleObj, "clgOnePager",
				"/OnePagerController?action=toClgOnePager",
				"CLG One Pager");
		var PsBankAccess = 'GIRC003 GPRC004 ';
		checkUserAccess3(PsBankAccess, moduleIdObjLength,
				userModuleObj, "psBankOnePager",
				"/OnePagerController?action=toPSBankOnePager",
				"PS BANK One Pager");
		var PlanAccess = 'GIRC003 GPRC004 FPACOC ';
		checkUserAccess3(PlanAccess, moduleIdObjLength,
				userModuleObj, "12planOnePager",
				"/OnePagerController?action=to12PlanOnePager",
				"12 Plan One Pager");
		

		//to set to function
		/* if (!checkUserAccess("95 MC TP", userAccessObj, userAccessObjLength))
			disableMenu('12pMcOnePager');
		if (!checkUserAccess("95 FI TP", userAccessObj, userAccessObjLength))
			disableMenu('12pFiOnePager');
		if (!checkUserAccess("95 PA TP", userAccessObj, userAccessObjLength))
			disableMenu('12paOnePager');
		if (!checkUserAccess("95 FI PS", userAccessObj, userAccessObjLength))
			disableMenu('psFiOnePager'); */

		//surety bonds
		checkUserAccess2('FSUOTHDOCS', moduleIdObjLength, userModuleObj,
				"SOtherBondDoc",
				"/BondsReportController?action=toSOtherBondDoc","SU - Other Bond Documents");

		//bond detail maintenance
		checkUserAccess2('FSUDTLMAIN', moduleIdObjLength, userModuleObj,
				"bondDetails",
				"/BondDetailsController?action=toBondDetailsPage", "SU - Bond Detail Maintenance");

		//nonRenewal
		checkUserAccess2('FNONRENEW', moduleIdObjLength, userModuleObj,
				"nonRenewal", "/NonRenewalController?action=toNonRenewPage","Non Renewal");

		checkUserAccess2('FPRODREP', moduleIdObjLength, userModuleObj,
				"confirmedPolicy",
				"/ConfirmedPolicyController?action=toConfirmedPolicyPage&tranCd=95&userId="+userId,"Confirmed Policy");

		//batch gen
		checkUserAccess2('CPAICM001', moduleIdObjLength, userModuleObj,
				"batchGen",
				"/BatchGenerationController?action=toBatchGenerationPage",
				"Batch Generation of Policy through PDF Maintenance");
		/*END POLICY ISSUANCE MENU*/
	}

	/*REINSURANCE*/
	if (!checkUserTranCd('96', tranCdLength, tranCdObj)) {
		$('reinsurance').setStyle('color: rgb(176,176,176)');
		disableMenu('riBinder');
	} else {
		checkUserAccess2('RI_BINDER', moduleIdObjLength, userModuleObj,
				"riBinder", "/pages/reinsurance/ri binder/RiBinder.jsp","Ri Binder");
	}
	/*END REINSURANCE MENU*/

	/*UNDERWRITING*/
	if (!checkUserTranCd('98', tranCdLength, tranCdObj)) {
		$('underwriting').setStyle('color: rgb(176, 176, 176)');
		//disableMenu('catAccumulation');
		disableMenu('issuedBonds');
		//disableMenu('postedPolicy');
		disableMenu('premProduction');
		disableMenu('toyotaDealers');

		disableMenu('psBank');
		disableMenu('pamsIssuance');
		disableMenu('gwpReport');
		disableMenu('pamsCash');
		//disableMenu('batchGen');
	} else {
		//check per module
		//checkUserAccess2('FCATACCUM', moduleIdObjLength, userModuleObj,"catAccumulation","/CatAccumulationController?action=toCATAccumulationPage","CAT Accumulation");
		checkUserAccess2('FISSBONDS', moduleIdObjLength, userModuleObj,
				"issuedBonds",
				"/IssuedBondsController?action=toIssuedBondsPage",
				"Issued Bond");
		
		checkUserAccess2('FPSBPSTPOL', moduleIdObjLength, userModuleObj,
				"psBank", "/PsBankController?action=toPsBankPage&tranCd=98&userId="+userId,
				"Ps Bank Posted Policy");
		checkUserAccess2('PAMS_ISS', moduleIdObjLength, userModuleObj,
				"pamsIssuance", "/PamsIssuanceController?action=PamsIssuance&tranCd=98&userId="+userId,
				"PAMS Issuance");
		//checkUserAccess2('FPOSTEDPOL', moduleIdObjLength, userModuleObj,"postedPolicy","/PostedPoliciesController?action=toPostedPolicyPage","Posted Policies per User");
		var premProductionAccess = 'FPRMPRODRP DP_FRM FSOADLRS GPRC001 PROD800 ';
		checkUserAccess3(premProductionAccess, moduleIdObjLength,
				userModuleObj, "premProduction",
				"/PremProductionController?action=toPremProductionPage&tranCd=98&userId="+userId,
				"Premium Production Report");
		checkUserAccess2('FTYTADLRS', moduleIdObjLength, userModuleObj,
				"toyotaDealers",
				"/ToyotaDealersController?action=toToyotaDealersPage",
				"Toyota Dealers Report");
		checkUserAccess2('GWPCPAIC', moduleIdObjLength, userModuleObj,
				"gwpReport",
				"/pages/underwriting/gwp/gwp.jsp", //"/GwpReportController?action=toGwpPage",
				"GWP Report");
		checkUserAccess2('PAMSCASH', moduleIdObjLength, userModuleObj,
				"pamsCash",
				"/PamsCashierController?action=toPamsCashierPage", //"/GwpReportController?action=toGwpPage",
				"PAMS Cashier");
	}
</script>