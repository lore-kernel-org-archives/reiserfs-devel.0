From: Rudy Zijlstra <rudy@edsons.demon.nl>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 13 Feb 2003 15:44:28 +0100 (CET)
Message-ID: <Pine.LNX.4.44.0302131533460.24510-100000@kheldar.edsons.demon.nl>
References: <13345098656.20030213111356@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <13345098656.20030213111356@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com



On Thu, 13 Feb 2003, Anders Widman wrote:

> > In article <46110589437.20030212162613@tnonline.net>,
> > Anders Widman  <andewid@tnonline.net> wrote:
> >>The  others  want to make Linux a viable option for "normal" users and
> >>want Linux to be able to replace Windows or Mac OS. The only way I see
> >>that happen is if Linux starts to get more userfriendly and safe.
>
> > Last time I checked, Windows and Mac OS come to a near total halt when
> > they see a disk error while doing a write on non-removable media, unless
> > the application goes to extraordinary lengths to handle the error itself.
>
> Actually no. :) Windows continue to run (ok, maybe now win9x or WinNT,
> but  these are old anyway). You can just remove a harddrive in Windows
> XP  and  the system continues to run. Or you can add new PCI cards and
> Windows will find those too.
>
>
Provided you first shut it down, then yes. I am not aware of PC hardware
that will allow you to savely do this with power on the board. Disk removal and
addition also worked using Win2K. And by the way, also using Linux -:)

If you get troubles with the system disk under windows, i do not know
what happens, likely to be interesting... And I have had Linux running
with 1 disk disconnected after it was mounted. unexpexted SCSI disconnect.
All kept working, except for the paritions that were unreachable. Which
happened to be reiserfs and were unharmed.

Cheers

Rudy

P.S. I am getting RAID for that particular system...



