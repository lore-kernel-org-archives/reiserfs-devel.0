From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Wed, 5 Mar 2003 16:07:06 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C0799@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	Anders, which kernel are you running and what Promise driver? I am
very familiar with these errors occurring on this hardware. There are issues
with the driver in lk 2.4.13, for a fact. I am currently using lk 2.4.19
which has these problems fixed. I believe the problems were fixed in lk
2.4.16-pre7.
Regards,
Wayne

email:       Berthiaume_Wayne@emc.com

"One man can make a difference, and every man should try."  - JFK


-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Wednesday, March 05, 2003 3:51 PM
To: reiserfs-list@namesys.com
Subject: Re: Error messages.


> On Wed, Mar 05, 2003 at 08:18:18PM +0100, Anders Widman wrote:
>>    What  exactly does this status=0x58 error mean, and what can one do
>>    to solve the problem?

> You said you tried changing the disks - next step is cables and
> controllers.  There's absolutely no question that's a hardware failure -
> you just have to figure out what piece has gone bad.

   This  is  what  I  also  have been thinking.. But it would mean the
   hardware is broken on all three machines, and 20 harddrives. So far
   I have tested with the following:

   New 80w IDE cables
   New 40w IDE cables (running DMA-33 only)
   New harddrives
       Maxtor
       IBM
       Seagate
   New mainboards
       MSI with VIA KT400 chipset
       MSI with VIA KT266A chipset
       MSI with Intel 440BX chipset
       MSI with Intel 440BX chipset with dual CPU
   Different RAM
   Different Power-supply
   New Promise controllers
       PDC20268 (Ultra 100Tx2)

   So..  What  more  can  I do? I seriously do not believe all of this
   hardware  is  broken.  They  all  run  without  problems in Windows
   2000/XP   and   all   drives  pass  check  through  badblocks  and
   IBM/Maxtor/Seagate Drive Fitness tools.

   I  made  a  quick  search on Google and found multiple forums where
   users have this same problems - and without any error reported from
   DFT tools...




--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
