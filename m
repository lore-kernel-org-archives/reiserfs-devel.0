From: Emanuel.Quass@temic.com
Subject: Re: any tips on optimising samba on reiserfs?
Date: Thu, 16 Jan 2003 13:14:24 +0100
Message-ID: <OF824D3AF5.162A592E-ONC1256CB0.00430F6D-C1256CB0.0042FA10@nbg.temic.de>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0042FA02C1256CB0_="
Return-path: <reiserfs-list-return-12383-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: darren <teodarren@myrealbox.com>
Cc: 'Reiserfs mail-list' <Reiserfs-List@Namesys.COM>

This is a multipart message in MIME format.
--=_alternative 0042FA02C1256CB0_=
Content-Type: text/plain; charset="us-ascii"

Hi All,

i ma working very much with reiserfs and samba, but I don't know very much 
about parameters to tune!
Can you send a list of all parameters you know to tune samba?
Thanks  in advance

        Emanuel






Hans Reiser <reiser@namesys.com>
16.01.2003 12:01

 
        An:     darren <teodarren@myrealbox.com>
        Kopie:  'Reiserfs mail-list' <Reiserfs-List@Namesys.COM>
        Thema:  Re: any tips on optimising samba on reiserfs?


darren wrote:

>Hi all,
>
>I have been trying to setup my reiserfs/samba CIFS file server on my
>LAN.
>
>Although all my benchmarks have been showing good local read write
>performance, I cannot seem to get the most of it over the network with
>samba.
>
>Anyone got any tips on how I can do this?
>
>p.s. I have already done all the obvious optimizations like TCP_NODELAY
>and using SO_SNBUF=16384 blah blah..
>
>
>
> 
>
This is an area where our team is ignorant due to lack of experience, 
but I am very interested in learning from you and other users about it, 
and we are willing to tweak as needed.  Perhaps we should run netbench 
or some such to replicate your situation?  (We don't use much Windows at 
Namesys....)

-- 
Hans





--=_alternative 0042FA02C1256CB0_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Hi All,</font>
<br>
<br><font size=2 face="sans-serif">i ma working very much with reiserfs and samba, but I don't know very much about parameters to tune!</font>
<br><font size=2 face="sans-serif">Can you send a list of all parameters you know to tune samba?</font>
<br><font size=2 face="sans-serif">Thanks &nbsp;in advance</font>
<br>
<br><font size=2 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Emanuel</font>
<br><font size=2 face="sans-serif"><br>
</font>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td>
<td><font size=1 face="sans-serif"><b>Hans Reiser &lt;reiser@namesys.com&gt;</b></font>
<p><font size=1 face="sans-serif">16.01.2003 12:01</font>
<br>
<td><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; An: &nbsp; &nbsp; &nbsp; &nbsp;darren &lt;teodarren@myrealbox.com&gt;</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Kopie: &nbsp; &nbsp; &nbsp; &nbsp;'Reiserfs mail-list' &lt;Reiserfs-List@Namesys.COM&gt;</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Thema: &nbsp; &nbsp; &nbsp; &nbsp;Re: any tips on optimising samba on reiserfs?</font></table>
<br>
<br>
<br><font size=2 face="Courier New">darren wrote:<br>
<br>
&gt;Hi all,<br>
&gt;<br>
&gt;I have been trying to setup my reiserfs/samba CIFS file server on my<br>
&gt;LAN.<br>
&gt;<br>
&gt;Although all my benchmarks have been showing good local read write<br>
&gt;performance, I cannot seem to get the most of it over the network with<br>
&gt;samba.<br>
&gt;<br>
&gt;Anyone got any tips on how I can do this?<br>
&gt;<br>
&gt;p.s. I have already done all the obvious optimizations like TCP_NODELAY<br>
&gt;and using SO_SNBUF=16384 blah blah..<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &nbsp;<br>
&gt;<br>
This is an area where our team is ignorant due to lack of experience, <br>
but I am very interested in learning from you and other users about it, <br>
and we are willing to tweak as needed. &nbsp;Perhaps we should run netbench <br>
or some such to replicate your situation? &nbsp;(We don't use much Windows at <br>
Namesys....)<br>
<br>
-- <br>
Hans<br>
<br>
<br>
</font>
<br>
<br>
--=_alternative 0042FA02C1256CB0_=--
