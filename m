From: Billy Transue <bill@black9.net>
Subject: Re: Problem with my HDD
Date: 31 May 2002 00:15:48 -0500
Message-ID: <1022822148.334.18.camel@threshold>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10460-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020530091729.C3922@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu, 2002-05-30 at 00:17, Oleg Drokin wrote:
> Hello!
> 
> On Thu, May 30, 2002 at 02:09:09AM +0200, Anders Widman wrote:
> 
> > > If you can I'd consider getting an image of the drive.  It may help with 
> > > data recovery later.  something like:
> > > dd if=/dev/sda1 of=/bigfilesystem/diskimage
> > I've  heard  of  something  called  dd_rescue,  but  "dd  if=/dev/sda1
> > of=/path/image  conv=sync,noerror"  should  do the trick. The sync and
> 
> Our attempts show that dd (even with conv=sync,noerror,notrunc) does not
> help and produces broken images, where no data inserted in image for sectors
> that cannot be read.
> 
> dd_rescue is shipped with SuSE.
> Also it can be obtained from here:
> http://www.garloff.de/kurt/linux/ddrescue/
> 
> > noerror   causes  the disk-copy to continue when there are read errors
> > and  fill in with blanks instead. If you don't do this you will end up
> 
> No, for some reason it does not fills the blanks.
> At least for us.
> 
> > with  offset  errors  -  the  image  will be shorter than the original
> > drive, and it would be impossible to fix.
> 
> This is also not true, it will be possible to fix, but that would be
> more expensive ;)
> 
> Bye,
>     Oleg

I've suffered a very similar problem and posted to the list earlier, I
did, dd_resuce -l dd.log /dev/hdd5 ./hdd5 and winded up w/ this:
dd_rescue: (info): ipos:         0.0k, opos:         0.0k,
xferd:         0.0k
                   errs:      0, errxfer:         0.0k,
succxfer:         0.0k
             +curr.rate:        0kB/s, avg.rate:        0kB/s,
avg.load:  0.0%

it never changed, the file created hdd5 was 65536 bytes large.  The log
file was empty.  Am I doing something wrong?  Any info would be
appreciated.  Thanks in advance.




