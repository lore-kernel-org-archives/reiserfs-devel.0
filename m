From: =?iso-8859-1?Q?Llu=EDs?= Batlle i Rossell <viric@viric.name>
Subject: More reiserfs hangs, easy to reproduce (Sheevaplug)
Date: Sun, 10 Jun 2012 16:27:25 +0200
Message-ID: <20120610142724.GA2039@vicerveza.homeunix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hello,

I had since the latest 2.6 kernels lockups in a sheevaplug computer (wi=
thout
swap), when it reached OOMK conditions. The machine was in such a deadl=
ock that
it only answered to sysrq request through the serial console. Almost ev=
ery OOMK
caused this, so once you reproduce an OOMK, I think it will almost sure=
 hang the
system. The lock looks related to swapping in read-only pages of progra=
ms.

As I recently experienced reiserfs lockups in a desktop pc
(http://www.spinics.net/lists/reiserfs-devel/msg03157.html), I wondered=
 if those
OOMK lockups could happen due to the reiserfs of /.  So I moved / to ex=
t4, and
all locks disappeared. OOMK works fine now.

So I'm definitely leaving reiserfs due to the deadlocks; a pity, becaus=
e it
served very well to me for many years. I'd be glad to use it again with=
 fixed
deadlock troubles.

If it's of help of anyone, here is the log (since just before the OOMK)=
 taken by
netconsole, linux 3.4.1, and with some sysrq dumps. Since the OOMK mess=
age
appears, the machine answers to nothing but sysrq requests.

The log:
http://viric.name/tmp/hang/sheevaplug-hang1.txt.gz

Regards,
Llu=EDs.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
