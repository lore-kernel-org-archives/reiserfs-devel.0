From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: Error messages.
Date: 7 Mar 2003 00:47:47 -0500
Message-ID: <b49bq3$u2v$1@satsuki.furryterror.org>
References: <7473069171.20030305201818@tnonline.net>
Return-path: <reiserfs-list-return-13137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <7473069171.20030305201818@tnonline.net>,
Anders Widman  <andewid@tnonline.net> wrote:
>   This  has  come up on this list a number of times, and no one still
>   seem to have found the true answer to the problem.
>
>   kernel: status error: status=0x58 { DriveReady SeekComplete DataRequest }
>
>   Most  seem  to  say  this is a bad block on the harddrive. I am not
>   convinced  though.  Using  Linux on three machines here, and I have
>   seen  this error on all of them, with lots of disks. The error seem
>   to   come  random,  but  does  cause  system  lockups  and  broken
>   filesystems.

It's a timeout during a data request, which could be caused by a bad
block, but might also be caused by poor cabling, overheating, or crap
drive firmware.  If there is a disk that appears to be implicated, the
real culprit could actually be caused by the _other_ disk on the cable,
if there is one.  It's very hard to tell which of these is the case
without more information than this log message--all you know is that
suddenly the drive stops responding to commands, or that you can't
send commands to the drive any more.

You get data corruption because the usual way out of one of these
messages is a drive reset, which will discard any writes that might
have been buffered in the drive's controller but not written on the disk.
Linux might also get confused here, which just makes a bad situation
worse.

I had dozens of these messages every day before I started explicitly
cooling drives _and_ the drive controllers.  For some reason board
manufacturers to this day do not put heat sinks on their ATA100 and
faster chips.  I can only assume that this is because they assume your
machine will spend no more than 20% of its time doing disk I/O, and
design a system that will overheat if it does disk I/O continuously at
full speed for any length of time.

After I started aggressively cooling disks and controllers, I now only
see that message a few weeks before disks fail.  Usually the 'smartctl'
utility (from smartsuite) will also list reallocated sectors in the
output of 'smartctl -v' (i.e. bad sectors that have been remapped).

>   Have  about  20  disks, and have replaced and upgraded them several
>   times  too.  This error has shown on most of them. But when testing
>   them  with tools like IBM DFT, Maxtor Powermax, badblocks or chkdsk
>   in Windows none show up to be with errors on.

Most vendor utilities will never report errors on a drive until the
disk has failed in some fatal way.  It's against their interests to
do otherwise.

>   Sometimes  it  seem  to  help to disable DMA and or lower UDMA mode
>   (all  drives are ATA-100 or ATA-133). But then after a few days, or
>   a  few  minutes  the  kernel  starts spitting out these status=0x58
>   errors.

This happens to make the chips run cooler.

>   After  looking  online  on  different forums it does seem that many
>   people are experiencing them.
>
>   What  exactly does this status=0x58 error mean, and what can one do
>   to solve the problem?

0x58 = 0x40 | 0x10 | 0x08 (i.e. the DriveReady, SeekComplete, and
DataRequest bits).  Usually this is followed by an error message from
the last command that was sent to the drive (e.g. 

	end_request: I/O error, dev 03:42 (hdb), sector 69234536

).


-- 
Zygo Blaxell (Laptop) <zblaxell@feedme.hungrycats.org>
GPG = D13D 6651 F446 9787 600B AD1E CCF3 6F93 2823 44AD
