From: Mirar <mirar-yg@mirar.org>
Subject: power loss -> corruption
Date: 08 May 2003 13:18:44 +0200
Sender: mirar@orchid.mirar.org
Message-ID: <m1k7d11yaz.fsf@orchid.mirar.org>
References: <200303102115.50039.dirk.leber@web.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303102115.50039.dirk.leber@web.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

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


