From: John Dalbec <jpdalbec@cc.ysu.edu>
Subject: Re: Quota on Debian with 2.4.18
Date: Tue, 17 Sep 2002 10:02:14 -0400
Message-ID: <3D8735E6.3020104@cc.ysu.edu>
References: <Pine.LNX.4.44.0209171410001.5546-100000@ariel.planitis.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11496-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Karaolides <george.karaolides@planitis.net>
Cc: reiserfs-list@namesys.com



George Karaolides wrote:
> Hi all,
> 
> Tried to compile a 2.4.18 kernel with reiserfs quota support on Debian
> 3.0 "woody".  The following patches applied cleanly to the kernel:
> 
> 50_quota-patch-2.4.15-1-2.4.16.gz
> dquot_deadlock.diff.gz
> kinoded-8.diff.gz
> nesting-10.diff.gz
> reiserfs-quota-20.diff.gz
> 
> However, running depmod -a returns unresolved symbols.

What does "dpkg -l '*modules*'" say?

> 
> I tried the usual stuff: making sure that the kernel source directory I
> was compiling in is linked to /usr/src/linux, and playing with the setting
> of module versioning in the kernel config.  No joy, though.
> 
> I tried both the kernel source in the Debian kernel-source-2.4.18 package,
> and kernel source from kernel.org.  I also tried the 2.4.19 kernel source
> from kernel.org and the 2.4.19 reiserfs quota pateches (reiserfs-quota-22
> etc).  No joy.
> 
> Any ideas?
> 
> Best regards,
> 
> |   George Karaolides                      Planitis Communications Ltd.,  |
> |   tel:   +357 22 45 65 00              Office 102, 11 Florinis Street,  |
> |   web:   www.planitis.net                             Nicosia CY 1065,  |
> |   email: george.karaolides@planitis.net           Republic  of Cyprus.  |
> 
> 


