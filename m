From: Sam Vilain <sam@vilain.net>
Subject: Re: Slightly off topic.
Date: Thu, 6 Mar 2003 05:24:33 +1300
Sender: Sam Vilain <sv@vilain.net>
Message-ID: <200303060524.33398.sam@vilain.net>
References: <15543129984.20030305115919@tnonline.net> <200303051704.44251.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303051704.44251.christian.mayrhuber@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

On Thu, 06 Mar 2003 05:04, Christian Mayrhuber wrote:
> Am Mittwoch, 5. M=E4rz 2003 11:59 schrieb Anders Widman:
> >    Does  anyone  know  where to find a driver for the new Promise SATA
> >    150  controller  for  2.4  or  2.5 kernels? So far I have not found
> >    anything  on  the promise website, nor does the built-in drivers in
> >    current kernels support the new promise controllers? The chip model
> >    is  PDC20376,  but  the  kernels  seem to only support PDC202xx not
> >    PDC203xx.
>
> No drivers exist for Promise SATA controllers and it seems that none
> will be written. See
> http://kt.dlut.edu.cn/kernel-traffic/kt20030223_206.html#6

Or wait for Serial SCSI.  IDE has always sucked :-).  My system running=20
with a Symbios SCSI controller and a 10MBps bus seems damned faster and=20
more responsive than when I was running on a UDMA66 HD.  I largely put it=20
down to Tagged Command Queuing and solid engineering as opposed to the=20
layer upon layer of bodges that is IDE/ATA/UDMA.

A good thing I didn't go out and buy that SATA drive to try out my shiny=20
new Asus motherboard's much-touted connector.  Picked up an entire SCSI=20
subsystem for half the price on an auction site...

Maybe my system is more responsive because I've stopped using reiserfs...=20
<ducks>
=2D-=20
Sam Vilain, sam@vilain.net

After all is said and done, a lot more has been said than done.
