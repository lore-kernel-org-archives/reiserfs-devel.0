From: Anders Widman <andewid@tnonline.net>
Subject: Re[2]: Problem with my HDD
Date: Thu, 30 May 2002 02:09:09 +0200
Message-ID: <390726734.20020530020909@tnonline.net>
References: <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10441-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Cc: reiserfs-list@namesys.com

> On Wed, 29 May 2002, Cookie-Monster wrote:

>> So I can't get the files on this HDD and my life depends on them, so
>> can someone HELP ME PLEASE?

> Ok, it's too late to point out the virtue of backups (this time).  From
> your description I'm personally suspecting a hardware issue with the drive 
> but it's orth ruling out all other alternastives before accepting this.

> If you can I'd consider getting an image of the drive.  It may help with 
> data recovery later.  something like:

> dd if=/dev/sda1 of=/bigfilesystem/diskimage

I've  heard  of  something  called  dd_rescue,  but  "dd  if=/dev/sda1
of=/path/image  conv=sync,noerror"  should  do the trick. The sync and
noerror   causes  the disk-copy to continue when there are read errors
and  fill in with blanks instead. If you don't do this you will end up
with  offset  errors  -  the  image  will be shorter than the original
drive, and it would be impossible to fix.

IF  you  have damaged sectors you will need alot of time, perhaps many
hours, or even days to copy a bigger disk.

//Anders

> I don't believe it will be necessary to set a particular blocksize for 
> the dd here but perhaps others might comment.

> Keep this image aside (put it on another box infact).

> You may find it is actually impossible to get much of an image from the 
> drive.

> Now the main reason I posted was this:  If you find that all else has
> failed (and if I were you I'd wait for a few more suggestions from the
> learned people here to come in) then there are companies who will attempt
> data recovery even on physically broken drives.  These companies have
> decent success rates with respect to data recovery but be prepared to pay
> $$$.  The things they do to the drive are often time consuming and costly
> resource-wise.

> Ask local computer experts for a local establishment which would do this.
> Rob

> -- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
>    Linux counter project ID #16440 (http://counter.li.org)
>    blake: up 1 day,  3:50,  4 users,  load average: 0.49, 0.47, 0.61
>    "The earth is but one country and mankind its citizens" -Baha'u'llah

