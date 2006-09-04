From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser FS will not boot after crash
Date: Tue, 5 Sep 2006 00:29:05 +0400
Message-ID: <200609050029.05251.vs@namesys.com>
References: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com> <200609042333.27778.vs@namesys.com> <200609042030.k84KUmNI017792@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609042030.k84KUmNI017792@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Valdis.Kletnieks@vt.edu, jmh5@nei.mv.com

Hello

On Tuesday 05 September 2006 00:30, Valdis.Kletnieks@vt.edu wrote:
> On Mon, 04 Sep 2006 23:33:27 +0400, "Vladimir V. Saveliev" said:
> > after unclean shutdown journal reply is necessary to return reiserfs to
> > consistent state. Maybe GRUB did not do that?
>
> A case can be made that GRUB should be keeping its grubby little paws off
> the filesystem journal.  It's a *bootloader*.  It's only purpose in life is
> to load other code that can make intelligent decisions about things like
> how (or even whether) to replay a filesystem journal.

Yes, I did not say that grub has to replay a journal, I just tried to guess 
why grub failed to boot and why things went ok after fsck.

