From: Chris Mason <mason@suse.com>
Subject: Re: Re[2]: Problem with my HDD
Date: 30 May 2002 09:39:01 -0400
Message-ID: <1022765941.22608.1555.camel@tiny>
References: <10512850437.20020529194929@starfall.de>
	<Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
	<20020530091410.B3922@namesys.com>  <1782653645.20020530135824@starfall.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1782653645.20020530135824@starfall.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cookie-Monster <cookie.monster@starfall.de>
Cc: reiserfs-list@namesys.com

On Thu, 2002-05-30 at 07:58, Cookie-Monster wrote:
> Hi,
> 
> >> If you can I'd consider getting an image of the drive.  It may help with 
> >> data recovery later.  something like:
> >> dd if=/dev/sda1 of=/bigfilesystem/diskimage
> 
> > That does not work on bad hard drives, resulting image would be almost useless.
> > BTW, this way it stops on first read error.
> 
> I made an image of the disk. It's 3GB. Can I do anything with this
> thing now? i.e.: formatting the HDD and putting the image back on it.
> Then there would be no unreadable blocks anymore.

I would keep the original disk in its current state until you get all
the data back you can.  If you think you've got a good copy, take the
original out of the machine and put it somewhere safe.

I'd start by running the copy through the latest version of reiserfsck.

-chris


