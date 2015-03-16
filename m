From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiserfs: inconsistent format in __RASSERT
Date: Mon, 16 Mar 2015 09:05:08 -0400
Message-ID: <5506D504.7040800@suse.com>
References: <5506D2DB.6040907@m4x.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5506D2DB.6040907@m4x.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Nicolas Iooss <nicolas.iooss_linux@m4x.org>, reiserfs-devel@vger.kernel.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 3/16/15 8:55 AM, Nicolas Iooss wrote:
> Hello,
> 
> When adding a __printf attribute to reiserfs_panic, gcc reported
> an inconsistent format for __RASSERT.  This macro is currently
> defined in fs/reiserfs/reiserfs.h as:
> 
> reiserfs_panic(NULL, "assertion failure", "(" #cond ") at " \ 
> __FILE__ ":%i:%s: " format "\n",                        \ 
> in_interrupt() ? -1 : task_pid_nr(current),             \ __LINE__,
> __func__ , ##args);
> 
> In the format string, the first parameter is a line number, but in
> the arguments there is a PID before.  Before c3a9c2109f84
> ("reiserfs: rework reiserfs_panic") [1], the format string began
> with "reiserfs[%i]" [2], which explains the PID in the arguments.
> 
> I see three possibilities:
> 
> * I missed something in my analysis and in fact the PID argument
> is processed by reiserfs_panic (don't know where), or * the PID
> argument is not used and should be removed, or

This, please. reiserfs_panic calls BUG(), which will contain the PID.

> * the PID is useful and "[%i]" should be added somewhere in the
> format string.
> 
> Which one would you prefer?
> 
> Also, I found this when building the kernel with "allmodconfig" on 
> x86_64.  With "defconfig" gcc does not report this error, but I
> guess it is because without CONFIG_REISERFS_CHECK, __RASSERT is
> never used.

Yeah. If reiserfs was more actively maintained, what is currently
protected by CONFIG_REISERFS_CHECK would be handled a bit better.
There are ton of fsfuzzer bugs that would be caught by it and should
be handled using reiserfs_error. Unfortunately, it also enables some
heavy checks that make the file system very slow.

Thanks for looking into this. It looks like it's been broken for a
while. I suppose the only saving grace is that it would crash in a
path that crashes on purpose a few lines later.

- -Jeff

- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.19 (Darwin)

iQIcBAEBAgAGBQJVBtUEAAoJEB57S2MheeWysH4P/RBggjHOwREYHiq2RaY8H+sf
rSRaqf14xePP7vcWOvcQRkzjB2f6wnvD40i7j0vLqP5A6mjp+tdrSgl7P1KqGGBV
45oQuibM5LcrDA07cIgXYLVYZxiWCtOyDxjSfoNw4HsrP/gPIx5YevJseb/VZPON
AH1ywT8LSmKx25jz20f6mmfbSuqtHe+ceitVcyjRnTw6363ngSPKj48rpPpo9uQE
SJygrJy1kkEVw0P9EHSa03jSKggPIpEj40lV5L7BDKkEsqor+3jXZDHaM7qQq+N0
eYaYzIxBbWuf8jAHe/XDGDNo0TEjvFk6qgmdUKjn41j+mS4SbUZGk55QFJO32ecv
GK9a/leQ/YyfPS9HBsuk6g51O1RU34nSyMY/i6o//VncgIJqIaxiWMb0KR5f79uL
LWv/A4TDsFC0/o/O25FFFq2jte5i497aFzxpTI+KDRmzxBUM20QzkhwPz2tySace
X0KBsJoLdgXLZhHYSlm2iydCb4C0lt6M3Q42IUlCeB3DQSViFgHnLry0ALULMcOk
N061Pnv+BoM+yEScF5TEF+/S4QgtgqdxNsUzZTF/070rVgtbR0iimikkf2w2ejWM
nYHsrFXJBZ55PtLKrV2ujVg3e25DlHK2irrawWmUF+/9zA/CV08u73XnB+VjAnTm
8Y0B/t6I90I3urltJbYA
=Pcpd
-----END PGP SIGNATURE-----
