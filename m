From: Frank Carreiro <frank.carreiro@investools.com>
Subject: Re: Can't kill a process
Date: Tue, 06 Apr 2004 10:47:22 -0600
Message-ID: <4072DF1A.2030608@investools.com>
References: <3DF9165145FACB4C96977FF650C1E9040C469D74@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------080707070404040509040605"
Return-path: <reiserfs-list-return-17752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C469D74@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Burnes, James" <james.burnes@gwl.com>, reiserfs-list@namesys.com

--------------080707070404040509040605
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Yes network connectivity with the box is available.  The disk space is 
slowly dropping.  We're running 2.4.9 -e38 on the RedHat Advanced 
Server.  Memory seemed to be fine on the system.  Nothing unusually 
there (1.5 Gigs of ram on the server).

I'm recycling the power on the box.  Reboot and init 6 seem to run 
however it's not bringing down the box.  Very strange problem :-)

Thx





Burnes, James wrote:

> Do you still have network connectivity with the 10.0.0.5 box?  It 
> sounds like the process is Zombie'ing because the disk subsystem has 
> lost it's mind or there is some strange network contention race 
> condition.  What version of the kernel are you running?
>
>  
>
> Have you checked the memory in the destination machine?  Reiser is 
> very demanding of system memory and CPU.  It tends to reveal marginal 
> memory or SDRAM modules that need reseating.
>
>  
>
> Other than that I think Hans and company may be more help.
>
>  
>
> Strange.  Let me know when you find out what the problem is.
>
>  
>
> Good luck,
>
>  
>
> jim burnes
> security engineer
> great-west, denver
>  
>
> -----Original Message-----
> From: Frank Carreiro [mailto:frank.carreiro@investools.com]
> Sent: Tuesday, April 06, 2004 9:34 AM
> To: Burnes, James
> Subject: Re: Can't kill a process
>
>  
>
> I had actually run the following from a foreign system
>
> tar -czf - .| ssh 10.0.0.5 "cat > /filesystem/files.tgz"
>
> We were trying to basically maintain the file permissions/ownership 
> and copy the files to a system with a great deal of diskspace handy.  
> After a couple of gigs it seemed to stop copying.  I had noticed there 
> is a process 'cat' running and yet I cannot kill it with -15 or -9. 
>
> I did notice that while the files.tgz is not being updated, disk space 
> is somewhere being eaten up.  I'm still poking around to find the 
> cause.  It's a rather strange problem.  I've seen this now with two 
> redhat servers using the reiser file system now.
>
> Thx
>
> Burnes, James wrote:
>
> What is the name of the process? 
>
>  
>
> jim burnes
> security engineer
> great-west, denver
>  
>
> -----Original Message-----
> From: Frank Carreiro [mailto:frank.carreiro@investools.com]
> Sent: Tuesday, April 06, 2004 9:26 AM
> To: reiserfs-list@namesys.com <mailto:reiserfs-list@namesys.com>
> Subject: Re: Can't kill a process
>
>  
>
> The system originally was running ext3 until we flattened it and 
> reinstalled RedHat with the reiser file system.  I have other systems 
> not running reiser which perform just fine.  The problem seems to be 
> pointed at the filesystem
>
> I had presumed there was something I needed to tweak there.
>
>
> Dave Poirier wrote:
>
>May I ask how is that related to ReiserFS?  Seems like a rather generic Linux problem to me, maybe you could try the Red Hat forums, mailing lists or IRC channels.
>
> 
>
>Dave Poirier
>
>Webmestre DSFM / Technicien Informatique
>
>+1.204.997.6253
>
> 
>
>----- Original Message -----
>
>From: Frank Carreiro <frank.carreiro@investools.com> <mailto:frank.carreiro@investools.com>
>
>Date: Tuesday, April 6, 2004 9:52 am
>
>Subject: Can't kill a process
>
> 
>
>  
>
>>I have a rather intense process that has been running since last 
>>
>>night.  
>>
>>I wanted to kill it since it's eating up my cpu however kill and 
>>
>>kill -9 
>>
>>don't seem to be doing the trick.
>>
>> 
>>
>>I'm running the reiser 3.6.25 file system on a RedHat Advanced 
>>
>>Server 
>>
>>(2.1) with 2.4.9-3.38smp kernel.
>>
>> 
>>
>>It's simply counting the time away as it copies files to disk.  
>>
>>I've 
>>
>>reniced it to 15.  It's also on a raid 5 array and I've modified 
>>
>>my 
>>
>>min/max speed to 10/50.  Performance has improved however the 
>>
>>process is 
>>
>>still running. 
>>
>> 
>>
>>Thoughts?
>>
>> 
>>
>>thx
>>
>> 
>>
>> 
>>
>> 
>>
>> 
>>
>>    
>>
> 
>
>  
>

--------------080707070404040509040605
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
Yes network connectivity with the box is available.&nbsp; The disk space is
slowly dropping.&nbsp; We're running 2.4.9 -e38 on the RedHat Advanced
Server.&nbsp; Memory seemed to be fine on the system.&nbsp; Nothing unusually
there (1.5 Gigs of ram on the server).<br>
<br>
I'm recycling the power on the box.&nbsp; Reboot and init 6 seem to run
however it's not bringing down the box.&nbsp; Very strange problem :-)<br>
<br>
Thx<br>
<br>
<br>
<br>
<br>
<br>
Burnes, James wrote:<br>
<blockquote type="cite"
 cite="mid3DF9165145FACB4C96977FF650C1E9040C469D74@its-mail1.its.corp.gwl.com">
  <meta http-equiv="Content-Type" content="text/html; ">
  <meta name="ProgId" content="Word.Document">
  <meta name="Generator" content="Microsoft Word 10">
  <meta name="Originator" content="Microsoft Word 10">
  <link rel="File-List" href="cid:filelist.xml@01C41BBB.150F3910">
  <o:SmartTagType
 namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="PersonName">
<!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:DoNotRelyOnCSS/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:GrammarState>Clean</w:GrammarState>
  <w:DocumentKind>DocumentEmail</w:DocumentKind>
  <w:EnvelopeVis/>
  <w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>
 </w:WordDocument>
</xml><![endif]--><!--[if !mso]>
<style>
st1\:*{behavior:url(#default#ieooui) }
</style>
<![endif]-->
  <style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:553679495 -2147483648 8 0 66047 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";
	color:black;}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
a:visited, span.MsoHyperlinkFollowed
	{color:blue;
	text-decoration:underline;
	text-underline:single;}
p
	{mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Times New Roman";
	mso-fareast-font-family:"Times New Roman";
	color:black;}
pre
	{margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	tab-stops:45.8pt 91.6pt 137.4pt 183.2pt 229.0pt 274.8pt 320.6pt 366.4pt 412.2pt 458.0pt 503.8pt 549.6pt 595.4pt 641.2pt 687.0pt 732.8pt;
	font-size:10.0pt;
	font-family:"Courier New";
	mso-fareast-font-family:"Times New Roman";
	color:black;}
span.EmailStyle19
	{mso-style-type:personal;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	mso-style-noshow:yes;
	mso-ansi-font-size:10.0pt;
	mso-bidi-font-size:10.0pt;
	font-family:Arial;
	mso-ascii-font-family:Arial;
	mso-hansi-font-family:Arial;
	mso-bidi-font-family:Arial;
	color:navy;}
span.GramE
	{mso-style-name:"";
	mso-gram-e:yes;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.Section1
	{page:Section1;}
-->
  </style><!--[if gte mso 10]>
<style>
 /* Style Definitions */ 
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:10.0pt;
	font-family:"Times New Roman";}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1" />
 </o:shapelayout></xml><![endif]-->
  </o:SmartTagType>
  <div class="Section1">
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;">Do you still
have network connectivity
with the 10.0.0.5 box?<span style="">&nbsp; </span>It sounds
like the process is Zombie&#8217;ing because the disk subsystem has lost <span
 class="GramE">it&#8217;s</span> mind or there is some strange network
contention
race condition.<span style="">&nbsp; </span>What version of the
kernel are you running?<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;">Have you
checked the memory in the
destination machine?<span style="">&nbsp; </span>Reiser is very
demanding of system memory and CPU.<span style="">&nbsp;
  </span>It tends to reveal marginal memory or SDRAM modules that need
reseating.<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;">Other than
that I think Hans and company
may be more help.<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><span class="GramE"><font size="2" color="navy"
 face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;">Strange.</span></font></span><font
 size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><span
 style="">&nbsp; </span>Let me know when you
find out what the problem is.<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;">Good luck,<o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><o:p>&nbsp;</o:p></span></font></p>
  <div>
  <p><font size="2" color="black" face="Times New Roman"><span
 style="font-size: 10pt;">jim burnes<br>
security engineer<br>
great-west, denver<br>
&nbsp;</span></font><span style=""> </span><o:p></o:p></p>
  </div>
  <div
 style="border-style: none none none solid; border-color: -moz-use-text-color -moz-use-text-color -moz-use-text-color blue; border-width: medium medium medium 1.5pt; padding: 0in 0in 0in 4pt;">
  <p class="MsoNormal"><font size="2" color="black" face="Tahoma"><span
 style="font-size: 10pt; font-family: Tahoma; color: windowtext;">-----Original
Message-----<br>
  <b><span style="font-weight: bold;">From:</span></b> Frank Carreiro
[<a class="moz-txt-link-freetext" href="mailto:frank.carreiro@investools.com">mailto:frank.carreiro@investools.com</a><span class="GramE">] <br>
  <b><span style="font-weight: bold;">Sent</span></b></span><b><span
 style="font-weight: bold;">:</span></b> Tuesday, April 06, 2004 9:34 AM<br>
  <b><span style="font-weight: bold;">To:</span></b> </span></font><st1:PersonName><font
 size="2" color="black" face="Tahoma"><span
 style="font-size: 10pt; font-family: Tahoma; color: windowtext;">Burnes,
James</span></font></st1:PersonName><font size="2" color="black"
 face="Tahoma"><span
 style="font-size: 10pt; font-family: Tahoma; color: windowtext;"><br>
  <b><span style="font-weight: bold;">Subject:</span></b> Re: Can't
kill a process</span></font></p>
  <p class="MsoNormal"><font size="3" color="black"
 face="Times New Roman"><span style="font-size: 12pt;"><o:p>&nbsp;</o:p></span></font></p>
  <p class="MsoNormal"><font size="3" color="black"
 face="Times New Roman"><span style="font-size: 12pt;">I had actually
run the following from a foreign system
  <br>
  <br>
tar -czf - .| ssh 10.0.0.5 "cat &gt; /filesystem/files.tgz"<br>
  <br>
We were trying to basically maintain the file permissions/ownership and
copy
the files to a system with a great deal of diskspace handy.&nbsp; After a
couple of gigs it seemed to stop copying.&nbsp; I had noticed there is a
process 'cat' running and yet I cannot kill it with -15 or -9.&nbsp; <br>
  <br>
I did notice that while the files.tgz is not being updated, disk space
is
somewhere being eaten up.&nbsp; I'm still poking around to find the
cause.&nbsp; It's a rather strange problem.&nbsp; I've seen this now with two
redhat servers using the reiser file system now.<br>
  <br>
Thx<br>
  <br>
Burnes, James wrote:<br style="">
<!--[if !supportLineBreakNewLine]--><br style="">
<!--[endif]--><o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><u1:SmartTagType
 namespaceuri="urn:schemas-microsoft-com:office:smarttags"
 name="PersonName"><!--[if gte mso 9]><xml>
  <u1:OfficeDocumentSettings>
   <u1:DoNotRelyOnCSS/>
  </u1:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
  <u2:WordDocument>
   <u2:GrammarState>Clean</u2:GrammarState>
   <u2:DocumentKind>DocumentEmail</u2:DocumentKind>
   <u2:EnvelopeVis/>
   <u2:BrowserLevel>MicrosoftInternetExplorer4</u2:BrowserLevel>
  </u2:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
  <u1:shapedefaults u3:ext="edit" spidmax="1026"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
  <u1:shapelayout u4:ext="edit">
   <u1:idmap u4:ext="edit" data="1"/>
  </u1:shapelayout>
</xml><![endif]--></u1:SmartTagType>What
is the name of the process?&nbsp; <u1:p></u1:p></span></font><o:p></o:p></p>
  <p class="MsoNormal"><font size="2" color="navy" face="Arial"><span
 style="font-size: 10pt; font-family: Arial; color: navy;"><u1:p>&nbsp;</u1:p></span></font><o:p></o:p></p>
  <div>
  <p><font size="2" color="navy" face="Times New Roman"><span
 style="font-size: 10pt; color: navy;">jim burnes<br>
security engineer<br>
great-west, denver<br>
&nbsp;</span></font><font color="navy"><span style="color: navy;"> </span></font><o:p></o:p></p>
  </div>
  <u1:p></u1:p>
  <div
 style="border-style: none none none solid; border-color: -moz-use-text-color -moz-use-text-color -moz-use-text-color blue; border-width: medium medium medium 1.5pt; padding: 0in 0in 0in 4pt;">
  <p class="MsoNormal"><font size="2" color="black" face="Tahoma"><span
 style="font-size: 10pt; font-family: Tahoma; color: windowtext;">-----Original
Message-----<br>
  <b><span style="font-weight: bold;">From:</span></b> Frank Carreiro [<a
 href="mailto:frank.carreiro@investools.com">mailto:frank.carreiro@investools.com</a>]
  <br>
  <b><span style="font-weight: bold;">Sent:</span></b> Tuesday, April
06, 2004 9:26
AM<br>
  <b><span style="font-weight: bold;">To:</span></b> <a
 href="mailto:reiserfs-list@namesys.com"><st1:PersonName>reiserfs-list@namesys.com</st1:PersonName></a><br>
  <b><span style="font-weight: bold;">Subject:</span></b> Re:
Can't kill a process</span></font><o:p></o:p></p>
  <p class="MsoNormal"><font size="3" color="black"
 face="Times New Roman"><span style="font-size: 12pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></p>
  <p class="MsoNormal"><font size="3" color="black"
 face="Times New Roman"><span style="font-size: 12pt;">The system
originally was running ext3 until we flattened
it and reinstalled RedHat with the reiser file system.&nbsp; I have other
systems not running reiser which perform just fine.&nbsp; The problem seems
to
be pointed at the filesystem<br>
  <br>
I had presumed there was something I needed to tweak there.<br>
  <br>
  <br>
Dave Poirier wrote:<br style="">
<!--[if !supportLineBreakNewLine]--><br style="">
<!--[endif]--><o:p></o:p></span></font></p>
  <u1:p></u1:p>
  <pre wrap=""><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">May I ask how is that related to ReiserFS?&nbsp; Seems like a rather generic Linux problem to me, maybe you could try the Red Hat forums, mailing lists or IRC channels.<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">Dave Poirier<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">Webmestre DSFM / Technicien Informatique<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">+1.204.997.6253<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">----- Original Message -----<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">From: Frank Carreiro <a
 href="mailto:frank.carreiro@investools.com">&lt;frank.carreiro@investools.com&gt;</a><u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">Date: Tuesday, April 6, 2004 9:52 am<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">Subject: Can't kill a process<u1:p></u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">&nbsp; <u1:p></u1:p><o:p></o:p></span></font></pre>
  <blockquote style="margin-top: 5pt; margin-bottom: 5pt;" type="cite">
    <pre wrap=""><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">I have a rather intense process that has been running since last <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">night.&nbsp; <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">I wanted to kill it since it's eating up my cpu however kill and <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">kill -9 <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">don't seem to be doing the trick.<u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">I'm running the reiser 3.6.25 file system on a RedHat Advanced <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">Server <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">(2.1) with 2.4.9-3.38smp kernel.<u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">It's simply counting the time away as it copies files to disk.&nbsp; <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">I've <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">reniced it to 15.&nbsp; It's also on a raid 5 array and I've modified <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">my <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">min/max speed to 10/50.&nbsp; Performance has improved however the <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">process is <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">still running. <u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">Thoughts?<u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">thx<u1:p></u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
    <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">&nbsp;&nbsp;&nbsp; <u1:p></u1:p><o:p></o:p></span></font></pre>
  </blockquote>
  <pre wrap=""><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;"><u1:p>&nbsp;</u1:p><o:p></o:p></span></font></pre>
  <pre><font size="2" color="black" face="Courier New"><span
 style="font-size: 10pt;">&nbsp; <u1:p></u1:p><o:p></o:p></span></font></pre>
  </div>
  </div>
  </div>
</blockquote>
</body>
</html>

--------------080707070404040509040605--

