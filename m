From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 13 Feb 2003 11:13:56 +0100
Message-ID: <13345098656.20030213111356@tnonline.net>
References: <200302121515.46953.russell@coker.com.au>
 <11104354750.20030212144219@tnonline.net>
 <200302121515.46953.russell@coker.com.au>
 <46110589437.20030212162613@tnonline.net> <b2f47f$oms$1@satsuki.furryterror.org>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b2f47f$oms$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> In article <46110589437.20030212162613@tnonline.net>,
> Anders Widman  <andewid@tnonline.net> wrote:
>>The  others  want to make Linux a viable option for "normal" users and
>>want Linux to be able to replace Windows or Mac OS. The only way I see
>>that happen is if Linux starts to get more userfriendly and safe.

> Last time I checked, Windows and Mac OS come to a near total halt when
> they see a disk error while doing a write on non-removable media, unless
> the application goes to extraordinary lengths to handle the error itself.

Actually no. :) Windows continue to run (ok, maybe now win9x or WinNT,
but  these are old anyway). You can just remove a harddrive in Windows
XP  and  the system continues to run. Or you can add new PCI cards and
Windows will find those too.


> Frankly, I used to mount my ext3 filesystems on servers with
> 'errors=panic', causing a reboot at the very first sign of trouble (past
> tense as I now use reiserfs which doesn't like that option ;-).
> The sooner the server goes out of production and starts running fsck,
> the sooner it will finish running fsck and come back into production
> (or, in the worst case, the sooner an admin person will start pulling
> out backup tapes and ordering replacement disks).








