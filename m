From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Thu, 6 Mar 2003 08:27:38 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C07A3@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	That's rather puzzling... I did not have the same problems with the
mii driver; however, I was unable to run the full extent of the 250GB drive
or the UDMA level 6 with mii under 2.4.13, so I was using a special patched
driver form Promise to support both the pdc20269 and 48LBA. In 2.4.19 the 48
LBA was added so I was able to get the full address range on the 250GB
drives without patches from Promise; however, was still unable to run UDMA
level 6 on the onboard Intel chip. 
	I still use the Promise pdc20269 and run UDMA level 6 on thousands
of deployed servers at this time. What is the cable length from drives to
controller? Eventhough you have several configured servers, I have thousands
without the problem you are seeing. Yes, I do get an occasional status error
under heavy loads but they've always been recoverable and the systems
continue to chug along.

-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Thursday, March 06, 2003 3:44 AM
To: reiserfs-list@namesys.com
Subject: Re: Error messages.


> Hello!

> On Thu, Mar 06, 2003 at 09:32:38AM +0100, Anders Widman wrote:

>> > And for this case I am sure this was a scratchy CD-ROM disk in my
CD-ROM drive.
>>    Well, have no CD-ROM. :)

> /dev/hdg is one of my CD-ROMs ;)

>> > Probably same stuff can be get when drive is busy remapping bad
sectors?
>> > Use smartctl to find out how these messages corellate with remapped bad
sectors counts?
>>   Very strange. Would mean all of my harddrives would be broken, or on
>>   their  way  to  get  broken.  I  do  not  believe that.  Most of the
>>   hardware, including the cabling has been replaced and changed.

> Well, seems as Wayne have noticed, you have one common part:
> Promise controllers. How about using different kind of controller
> on one of the boxes and see if it helps?

Perhaps,  but  the  same  happens on the internal controller. In fact,
the  internal  controller  (either VIA or the Intel) causes the system
to freeze when it happens to many times.

> Bye,
>     Oleg


   



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
