From: Russell Coker <russell@coker.com.au>
Subject: Re: non volatile ram devices
Date: Fri, 6 Dec 2002 10:52:59 +0100
Message-ID: <200212061052.59139.russell@coker.com.au>
References: <200212042059.35300.russell@coker.com.au> <200212051000.32340.russell@coker.com.au> <1039094639.8199.119.camel@tiny>
Reply-To: Russell Coker <russell@coker.com.au>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_BGZOJHVSJMMQXCK0QEZ0"
Return-path: <reiserfs-list-return-12122-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1039094639.8199.119.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Chris Mason <mason@suse.com>
Cc: Ragnar =?iso-8859-1?q?Kj=F8rstad?= <linux-ide-arrays@ragnark.vestdata.no>, ReiserFS <reiserfs-list@namesys.com>, Mike Jadon <mikej@umem.com>


--------------Boundary-00=_BGZOJHVSJMMQXCK0QEZ0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

On Thu, 5 Dec 2002 14:23, Chris Mason wrote:
> On Thu, 2002-12-05 at 04:00, Russell Coker wrote:
> > In this case the machines each have 4G of RAM.  The total RAM for the
> > mail cluster is four times what was used for the Solaris cluster, and
> > Intel X86 architecture uses less RAM than SPARC (32bit CISC vs 64bit
> > RISC) and I suspect that the software we're now using (Qmail and Courier)
> > is more memory efficient than Netscape too.  Overall we have heaps more
> > cache memory than before, I'm seeing 20 reads per second and 160 writes
> > per second at times of peak load.
>
> Have you benchmarked these machines to determine the max write load
> capacity on reiserfs?  Are you using a vanilla kernel or one with
> patches applied?

I'm using a fairly vanilla kernel.  It's performance is 2 messages per second 
taken from qmail spool and delivered while there is a background load of pop 
access and new incoming mail.  IE if there is a backlog of mail to deliver 
the backlog gets smaller by 120 messages per minute.

> I've done a few of my own benchmarks of the data logging patches, but it
> would be great to see some independent verification of the speedups in a
> real mail server workload.

I've attached the results from a quick bonnie++ run of a vanilla system, a 
system with the patches you referred me to, and finally with the file system 
mounted with data journalling.

The test was pretty quick (only a single pass) because I've spent so much time 
fiddling with the crappy test hardware to be inclined to spend too much 
effort on it (how the hell is a P3-600 with a 6G IDE drive and 128M of RAM 
supposed to be used for evaluating software to deploy on a server with 
2*1.8GHz CPUs, 196G of hardware RAID, and 4G of RAM).

The results seem to show that the patches do some good on their own, nothing 
really exciting but worth having.  The data journalling improves performance 
of synchronously creating files in the 512b to 16K size range (the issue I am 
interested in) by a factor of 7!  This is very promising, I only hope that 
the performance gains when 200 processes are hitting a hardware RAID array of 
4 U160 disks are as good as when a single process is hitting a cheap old IDE 
disk.

This may even remove the immediate need for umem devices.  But I think I'll 
try and get them anyway.  Extra speed is always useful.

-- 
http://www.coker.com.au/selinux/   My NSA Security Enhanced Linux packages
http://www.coker.com.au/bonnie++/  Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/    Postal SMTP/POP benchmark
http://www.coker.com.au/~russell/  My home page

--------------Boundary-00=_BGZOJHVSJMMQXCK0QEZ0
Content-Type: text/html;
  charset="iso-8859-1";
  name="res.html"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="res.html"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/RE=
C-html40/strict.dtd">
<HTML>
<HEAD><TITLE>Bonnie++ V1.02d Benchmark results</TITLE>
<STYLE type=3D"text/css">
TD.header {text-align: center; backgroundcolor: "#CCFFFF" }
TD.rowheader {text-align: center; backgroundcolor: "#CCCFFF" }
TD.size {text-align: center; backgroundcolor: "#CCCFFF" }
TD.ksec {text-align: center; fontstyle: italic }
</STYLE>
<BODY>
<TABLE ALIGN=3Dcenter BORDER=3D3 CELLPADDING=3D2 CELLSPACING=3D1>
<TR><TD COLSPAN=3D2 class=3D"header"></TD>
<TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequential Output</B>=
</FONT></TD>
<TD COLSPAN=3D4 class=3D"header"><FONT SIZE=3D+2><B>Sequential Input</B><=
/FONT></TD>
<TD COLSPAN=3D2 ROWSPAN=3D2 class=3D"header"><FONT SIZE=3D+2><B>Random<BR=
>Seeks</B></FONT></TD>
<TD COLSPAN=3D1 class=3D"header"></TD>
<TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequential Create</B>=
</FONT></TD>
<TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Random Create</B></FO=
NT></TD>
</tr>
<TR><TD></TD><TD>Size:Chunk Size</TD><TD COLSPAN=3D2>Per Char</TD><TD COL=
SPAN=3D2>Block</TD><TD COLSPAN=3D2>Rewrite</TD><TD COLSPAN=3D2>Per Char</=
TD><TD COLSPAN=3D2>Block</TD><TD>Num Files</TD><TD COLSPAN=3D2>Create</TD=
><TD COLSPAN=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD><TD COLSPAN=3D2>Crea=
te</TD><TD COLSPAN=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD></TR><TR><TD C=
OLSPAN=3D2></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD c=
lass=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT S=
IZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT>=
</TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"kse=
c"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SI=
ZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/ sec</FONT><=
/TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>/ sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=
=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/ sec</FONT></T=
D><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec">=
<FONT SIZE=3D-2>/ sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU=
</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/ sec</FONT></TD><TD class=
=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D=
-2>/ sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><=
TD class=3D"ksec"><FONT SIZE=3D-2>/ sec</FONT></TD><TD class=3D"ksec"><FO=
NT SIZE=3D-2>% CPU</FONT></TD></TR>
<TR><TD class=3D"rowheader"><FONT SIZE=3D+1><B>orig</B></FONT></TD><TD cl=
ass=3D"size"></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><=
TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>10:16384:512/5</=
TD><TD>946</TD><TD>37</TD><TD>89</TD><TD>1</TD><TD>6099</TD><TD>99</TD><T=
D>879</TD><TD>28</TD><TD>86</TD><TD>0</TD><TD>553</TD><TD>10</TD></TR>
<TR><TD class=3D"rowheader"><FONT SIZE=3D+1><B>patched</B></FONT></TD><TD=
 class=3D"size"></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></T=
D><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>10:16384:512/=
5</TD><TD>738</TD><TD>23</TD><TD>115</TD><TD>1</TD><TD>6142</TD><TD>100</=
TD><TD>1275</TD><TD>78</TD><TD>126</TD><TD>1</TD><TD>3971</TD><TD>74</TD>=
</TR>
<TR><TD class=3D"rowheader"><FONT SIZE=3D+1><B>jdata</B></FONT></TD><TD c=
lass=3D"size"></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD>=
<TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>10:16384:512/5<=
/TD><TD>714</TD><TD>22</TD><TD>159</TD><TD>1</TD><TD>5616</TD><TD>100</TD=
><TD>683</TD><TD>21</TD><TD>129</TD><TD>1</TD><TD>5067</TD><TD>98</TD></T=
R>
<TR><TD class=3D"rowheader"><FONT SIZE=3D+1><B>orig.sync</B></FONT></TD><=
TD class=3D"size"></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD><=
/TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>10:16384:51=
2/5</TD><TD>37</TD><TD>2</TD><TD>111</TD><TD>1</TD><TD>50</TD><TD>2</TD><=
TD>36</TD><TD>2</TD><TD>86</TD><TD>1</TD><TD>36</TD><TD>2</TD></TR>
<TR><TD class=3D"rowheader"><FONT SIZE=3D+1><B>patched.sync</B></FONT></T=
D><TD class=3D"size"></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><T=
D></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>10:16384=
:512/5</TD><TD>36</TD><TD>2</TD><TD>152</TD><TD>2</TD><TD>137</TD><TD>7</=
TD><TD>35</TD><TD>2</TD><TD>127</TD><TD>1</TD><TD>80</TD><TD>4</TD></TR>
<TR><TD class=3D"rowheader"><FONT SIZE=3D+1><B>jdata.sync</B></FONT></TD>=
<TD class=3D"size"></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>=
</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD>10:16384:5=
12/5</TD><TD>225</TD><TD>14</TD><TD>127</TD><TD>1</TD><TD>236</TD><TD>13<=
/TD><TD>227</TD><TD>15</TD><TD>150</TD><TD>1</TD><TD>100</TD><TD>6</TD></=
TR>
</TABLE>
</BODY>
</HTML>

--------------Boundary-00=_BGZOJHVSJMMQXCK0QEZ0--

