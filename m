From: =?iso-8859-1?Q?S=E6mund_Tausen?= <sta@farodane.fo>
Subject: VS: Dell/EMC AX100SC
Date: Thu, 30 Mar 2006 09:19:59 +0100
Message-ID: <D4C0C9DD6C362A4C925EC0C6029C2FAB6A80B2@mail.farodane.fo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,
Is it possible to get some advice for the problem mention below.

Best regard

Farodane PF

S=E6mund Tausen
Service Coordinator

sta@farodane.fo


-----Oprindelig meddelelse-----
Fra: John Jensen [mailto:JRJ@ft.fo]=20
Sendt: 24. mars 2006 11.16
Til: S=E6mund Tausen
Cc: Janus =ED Dali
Emne: Re: Dell/EMC AX100SC

Hej S=E6mund,
Problemerne er st=F8rre end f=F8rst antaget.

fsck melder om hardware fejl p=E5 devicen. (se nedenst=E5ende udskrift).
Der har v=E6ret en del problemer mht. str=F8mforsyning til det rack som,
devicen sad i tidligere. Derfor er den blevet t=E6ndt/slukket p=E5 en =
ret
uhensigtsm=E6ssig m=E5de ...

Er der en m=E5de at lave 'factory reset' p=E5 s=E5 devicen kommer =
tilbage
til normal ? Den indeholder pt ingen vigtige data.

/John





FSCK:
*-----


hactar:~ # fsck.reiserfs --check /dev/sdb1
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/sdb1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Ye
hactar:~ # fsck.reiserfs --rebuild-tree -S  /dev/sdb1
reiserfsck 3.6.19 (2003 www.namesys.com)

*************************************************************
** Do not  run  the  program  with  --rebuild-tree  unless **
** something is broken and MAKE A BACKUP  before using it. **
** If you have bad sectors on a drive  it is usually a bad **
** idea to continue using it. Then you probably should get **
** a working hard drive, copy the file system from the bad **
** drive  to the good one -- dd_rescue is  a good tool for **
** that -- and only then run this program.                 **
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will rebuild the filesystem (/dev/sdb1) tree
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you =
do):Yes
Replaying journal..
Reiserfs journal '/dev/sdb1' in blocks [18..8211]: 0 transactions =
replayed

The problem has occurred looks like a hardware problem. If you have
bad blocks, we advise you to get a new hard drive, because once you
get one bad block  that the disk  drive internals  cannot hide from
your sight,the chances of getting more are generally said to become
much higher  (precise statistics are unknown to us), and  this disk
drive is probably not expensive enough  for you to you to risk your
time and  data on it.  If you don't want to follow that follow that
advice then  if you have just a few bad blocks,  try writing to the
bad blocks  and see if the drive remaps  the bad blocks (that means
it takes a block  it has  in reserve  and allocates  it for use for
of that block number).  If it cannot remap the block,  use badblock
option (-B) with  reiserfs utils to handle this block correctly.

bread: Cannot read the block (492273664): (Input/output error).

Aborted



>>> S=E6mund Tausen <sta@farodane.fo> 03/23/06 2:33 pm >>>
Den mailen jeg har f=E5et videresendt fra Janus =ED Dali, er denne =
storagen fejlmeldt til DELL/Unisys???


