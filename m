From: Robert Brockway <robert@timetraveller.org>
Subject: Re: Problem with my HDD
Date: Thu, 30 May 2002 09:45:50 +1000 (EST)
Message-ID: <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
References: <10512850437.20020529194929@starfall.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <10512850437.20020529194929@starfall.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cookie-Monster <cookie.monster@starfall.de>
Cc: reiserfs-list@namesys.com

On Wed, 29 May 2002, Cookie-Monster wrote:

> So I can't get the files on this HDD and my life depends on them, so
> can someone HELP ME PLEASE?

Ok, it's too late to point out the virtue of backups (this time).  From
your description I'm personally suspecting a hardware issue with the drive 
but it's orth ruling out all other alternastives before accepting this.

If you can I'd consider getting an image of the drive.  It may help with 
data recovery later.  something like:

dd if=/dev/sda1 of=/bigfilesystem/diskimage

I don't believe it will be necessary to set a particular blocksize for 
the dd here but perhaps others might comment.

Keep this image aside (put it on another box infact).

You may find it is actually impossible to get much of an image from the 
drive.

Now the main reason I posted was this:  If you find that all else has
failed (and if I were you I'd wait for a few more suggestions from the
learned people here to come in) then there are companies who will attempt
data recovery even on physically broken drives.  These companies have
decent success rates with respect to data recovery but be prepared to pay
$$$.  The things they do to the drive are often time consuming and costly
resource-wise.

Ask local computer experts for a local establishment which would do this.
Rob

-- Robert Brockway B.Sc. email: robert@timetraveller.org  ICQ: 104781119
   Linux counter project ID #16440 (http://counter.li.org)
   blake: up 1 day,  3:50,  4 users,  load average: 0.49, 0.47, 0.61
   "The earth is but one country and mankind its citizens" -Baha'u'llah


