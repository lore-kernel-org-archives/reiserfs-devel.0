From: Oleg Drokin <green@namesys.com>
Subject: Re: Problem with my HDD
Date: Thu, 30 May 2002 09:17:29 +0400
Message-ID: <20020530091729.C3922@namesys.com>
References: <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org> <390726734.20020530020909@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10444-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <390726734.20020530020909@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello!

On Thu, May 30, 2002 at 02:09:09AM +0200, Anders Widman wrote:

> > If you can I'd consider getting an image of the drive.  It may help with 
> > data recovery later.  something like:
> > dd if=/dev/sda1 of=/bigfilesystem/diskimage
> I've  heard  of  something  called  dd_rescue,  but  "dd  if=/dev/sda1
> of=/path/image  conv=sync,noerror"  should  do the trick. The sync and

Our attempts show that dd (even with conv=sync,noerror,notrunc) does not
help and produces broken images, where no data inserted in image for sectors
that cannot be read.

dd_rescue is shipped with SuSE.
Also it can be obtained from here:
http://www.garloff.de/kurt/linux/ddrescue/

> noerror   causes  the disk-copy to continue when there are read errors
> and  fill in with blanks instead. If you don't do this you will end up

No, for some reason it does not fills the blanks.
At least for us.

> with  offset  errors  -  the  image  will be shorter than the original
> drive, and it would be impossible to fix.

This is also not true, it will be possible to fix, but that would be
more expensive ;)

Bye,
    Oleg
