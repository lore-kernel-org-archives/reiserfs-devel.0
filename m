From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: 23 Feb 2003 18:31:49 -0500
Message-ID: <b3bll5$er5$1@satsuki.furryterror.org>
References: <200302141318.33057.sam@vilain.net>
Return-path: <reiserfs-list-return-12883-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <200302141318.33057.sam@vilain.net>,
Sam Vilain  <sam@vilain.net> wrote:
>Perhaps it might, but it sure does a good job of cleaning them up with
>ScanDisk.  And it almost certainly won't BSOD for a bad sector.

BSOD, no.  Hang, yes.  Crash, yes.  Kill applications more or less at
random, yes.  Corrupt the registry and never successfully boot again, yes.
Corrupt a database somewhere (even on another machine over a network)
and require careful hand-holding to make some application work again, yes.
Take two or more hours to boot, yes.

But BSOD...no.

>Windows doesn't handle resetting the IDE bus when it needs it very well,
>I've seen one disk that didn't work in Windows but worked passably in
>Linux because of this.  Of course it died a few months later :-).

I've seen disks that fail in ways that bus resets can't fix.  Usually
the problem is heat-related--the drive electronics simply overheat and
the embedded controller crashes.  The drive might start working again
if it cools off a bit.  Generally if I hear a user say "I get disk errors
that only appear when I'm using the disk heavily", I find a hard drive
with inadequate airflow.

Often there is some data corruption associated with IDE bus resets.
Linux IDE drivers seem to corrupt any I/O requests in progress when it
switches from DMA to PIO mode, which it usually does when the IDE bus
times out on DMA requests.  :-P

-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
