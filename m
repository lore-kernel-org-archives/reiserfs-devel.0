From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: data corruption with 2.4.25 and datalogging patches
Date: Fri, 14 Jul 2006 16:59:35 +0400
Message-ID: <1152881975.6407.58.camel@tribesman.namesys.com>
References: <200607120816.11292.fjcabello@visual-tools.com>
	 <1152877739.6407.37.camel@tribesman.namesys.com>
	 <200607141403.33613.fjcabello@visual-tools.com>
	 <200607141420.36656.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-00fLvqo7tmT5g3Gustn9"
Return-path: <reiserfs-list-return-29004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200607141420.36656.fjcabello@visual-tools.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Francisco Javier Cabello <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

--=-00fLvqo7tmT5g3Gustn9
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello

On Fri, 2006-07-14 at 14:20 +0200, Francisco Javier Cabello wrote:

> Hello Vladimir,
> 
> # reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1
> 
> Standard output:
> ======================================================
> Will read-only check consistency of the filesystem on /dev/hdc1
> Will put log info to '/tmp/reiserfsck.log'
> ###########
> reiserfsck --check started at Fri Jul 14 14:09:33 2006
> ###########
> Replaying journal..
> Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions replayed
> Checking internal tree..finished
> Comparing bitmaps..Bad nodes were found, Semantic pass skipped
> 1 found corruptions can be fixed only when running with --rebuild-tree
> ###########
> reiserfsck finished at Fri Jul 14 14:13:29 2006
> ###########
> ======================================================
> 
> /tmp/reiserfsck.log:
> ======================================================
> bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong order of 
> items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321 0x22f1c880 DIR 
> (3)]


such corruptions used to be considered as hardware bugs. Memory failure,
for instance. Did you ever run memtest on your systems?


>  the problem in the internal node occured (23868569), whole subtree is skipped
> vpf-10640: The on-disk and the correct bitmaps differs.
> ======================================================
> 



--=-00fLvqo7tmT5g3Gustn9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.6.1">
</HEAD>
<BODY>
Hello<BR>
<BR>
On Fri, 2006-07-14 at 14:20 +0200, Francisco Javier Cabello wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#000000">Hello Vladimir,</FONT>

<FONT COLOR="#000000"># reiserfsck -l /tmp/reiserfsck.log -y --check /dev/hdc1</FONT>

<FONT COLOR="#000000">Standard output:</FONT>
<FONT COLOR="#000000">======================================================</FONT>
<FONT COLOR="#000000">Will read-only check consistency of the filesystem on /dev/hdc1</FONT>
<FONT COLOR="#000000">Will put log info to '/tmp/reiserfsck.log'</FONT>
<FONT COLOR="#000000">###########</FONT>
<FONT COLOR="#000000">reiserfsck --check started at Fri Jul 14 14:09:33 2006</FONT>
<FONT COLOR="#000000">###########</FONT>
<FONT COLOR="#000000">Replaying journal..</FONT>
<FONT COLOR="#000000">Reiserfs journal '/dev/hdc1' in blocks [18..8211]: 0 transactions replayed</FONT>
<FONT COLOR="#000000">Checking internal tree..finished</FONT>
<FONT COLOR="#000000">Comparing bitmaps..Bad nodes were found, Semantic pass skipped</FONT>
<FONT COLOR="#000000">1 found corruptions can be fixed only when running with --rebuild-tree</FONT>
<FONT COLOR="#000000">###########</FONT>
<FONT COLOR="#000000">reiserfsck finished at Fri Jul 14 14:13:29 2006</FONT>
<FONT COLOR="#000000">###########</FONT>
<FONT COLOR="#000000">======================================================</FONT>

<FONT COLOR="#000000">/tmp/reiserfsck.log:</FONT>
<FONT COLOR="#000000">======================================================</FONT>
<FONT COLOR="#000000">bad_internal: vpf-10320: block 23868569, items 91 and 92: The wrong order of </FONT>
<FONT COLOR="#000000">items: [410810496 11321 0x16abca00 ??? (15)], [11312 11321 0x22f1c880 DIR </FONT>
<FONT COLOR="#000000">(3)]</FONT>
</PRE>
</BLOCKQUOTE>
<BR>
such corruptions used to be considered as hardware bugs. Memory failure, for instance. Did you ever run memtest on your systems?<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
<FONT COLOR="#000000"> the problem in the internal node occured (23868569), whole subtree is skipped</FONT>
<FONT COLOR="#000000">vpf-10640: The on-disk and the correct bitmaps differs.</FONT>
<FONT COLOR="#000000">======================================================</FONT>

</PRE>
</BLOCKQUOTE>
<BR>
</BODY>
</HTML>

--=-00fLvqo7tmT5g3Gustn9--

