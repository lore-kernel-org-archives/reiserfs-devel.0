From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser FS will not boot after crash
Date: Mon, 04 Sep 2006 22:10:23 -0500
Message-ID: <44FCEA9F.1060006@slaphack.com>
References: <Pine.LNX.4.04.10609041516380.4384-100000@nei15.nei1.nei.mv.com>            <200609042333.27778.vs@namesys.com> <200609042030.k84KUmNI017792@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29808-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609042030.k84KUmNI017792@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com, jmh5@nei.mv.com

Valdis.Kletnieks@vt.edu wrote:
> On Mon, 04 Sep 2006 23:33:27 +0400, "Vladimir V. Saveliev" said:
> 
>> after unclean shutdown journal reply is necessary to return reiserfs to 
>> consistent state. Maybe GRUB did not do that?
> 
> A case can be made that GRUB should be keeping its grubby little paws off
> the filesystem journal.  It's a *bootloader*.  It's only purpose in life is
> to load other code that can make intelligent decisions about things like
> how (or even whether) to replay a filesystem journal.

But, unlike Lilo, Grub usually has to load that other code from a 
filesystem, which means it's already doing more than what bootloaders 
traditionally do.

If it was up to me, we'd all be using LinuxBIOS and kexec, and it 
wouldn't be an issue.
