From: "Bill Rees" <brees@benchmarkautomation.com>
Subject: RE: power loss -> corruption
Date: Thu, 8 May 2003 08:02:53 -0400
Message-ID: <NHBBIGLOALLFLCNJNOLHGEMCCAAA.brees@benchmarkautomation.com>
References: <m1k7d11yaz.fsf@orchid.mirar.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m1k7d11yaz.fsf@orchid.mirar.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I have seen this as well. Recently accessed or edited files become corrupt
when the system kernel panics and halts as well. For instance, I will edit
/etc/inittab, a kernel panic occurs and when the system attempts to reboot
it fails because the inittab contains unreadable garbage.

Bill

-----Original Message-----
From: mirar@orchid.mirar.org [mailto:mirar@orchid.mirar.org]On Behalf Of
Mirar
Sent: Thursday, May 08, 2003 7:19 AM
To: reiserfs-list@namesys.com
Subject: power loss -> corruption


I've had this problem for a while. Every time the system gets a power
loss, all files that was recently written to gets garbage in them.
(It seems to me like the wrong content gets in the wrong files.)

I assume it's not supposed to be that way.

Is this something known?

It happens with 2.4.19 and 2.4.20 kernel versions.
Is there anything I can do to track down this issue?

Since it's every time, or at least close to every time...

I don't power down by breaking that power that often, so it hasn't
disturbed me that much, but I lost an important file today so I guess
I'm extra aggravated.

/Mirar



