From: Anders Widman <andewid@tnonline.net>
Subject: Re[3]: Problem with my HDD
Date: Thu, 30 May 2002 15:35:46 +0200
Message-ID: <471328546.20020530153546@tnonline.net>
References: <10512850437.20020529194929@starfall.de>
 <Pine.LNX.4.44.0205300905050.22928-100000@avon.timetraveller.org>
 <20020530091410.B3922@namesys.com> <1782653645.20020530135824@starfall.de>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1782653645.20020530135824@starfall.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cookie-Monster <cookie.monster@starfall.de>
Cc: reiserfs-list@namesys.com

> Hi,

>>> If you can I'd consider getting an image of the drive.  It may help with 
>>> data recovery later.  something like:
>>> dd if=/dev/sda1 of=/bigfilesystem/diskimage

>> That does not work on bad hard drives, resulting image would be almost useless.
>> BTW, this way it stops on first read error.

> I made an image of the disk. It's 3GB. Can I do anything with this
> thing now? i.e.: formatting the HDD and putting the image back on it.
> Then there would be no unreadable blocks anymore.

Formatting  would  not  repair the broken sectors. If the drive itself
has spare sectors left, then they would be used instead.

If  there  are  bad sectors you should really have this disk replaced.
IBM  has  5  years warranty on all SCSI drives. You can fill out a RMA
form at http://www.storage.ibm.com/hdd/support/index.htm

And,  as  Oleg  wrote,  use ddrescue to make a complete backup of your
harddrive.  Make  a  backup of that image too, so you can recover data
from one of the images. 

//Anders

> --
> Cookie-Monster
> cookie.monster@starfall.de
> http://www.starfall.de/

