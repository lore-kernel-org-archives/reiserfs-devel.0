From: Anders Widman <andewid@tnonline.net>
Subject: Re: Error messages. - Possible sollution.
Date: Mon, 10 Mar 2003 01:14:27 +0100
Message-ID: <13190438906.20030310011427@tnonline.net>
References: <7473069171.20030305201818@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13159-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <7473069171.20030305201818@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


   It  seems  as  there  is  a compatibility problem regarding certain
   series  of  the  Maxtor  harddrives  and  Promise  U100  Tx2 boards
   (perhaps all U1xx ?).

   The  problem  is  that Maxtors older/original series of 80, 120 and
   160GB  models  give  system  lockups, poor transfer speeds and fail
   SMART self test.

   Newer  drives from Maxtor (those originating in Quantum technology)
   do work. At least the 60GB 540DX model.

   Seagate  and IBM drives seem to have no problem with Promise cards.

   So,  all  in  all  I  believe to have found one source of problems,
   though  there  might  still be more. I will continue to investigate
   and post any more findings.

   Regards,
   Anders


>    This  has  come up on this list a number of times, and no one still
>    seem to have found the true answer to the problem.

>    kernel: status error: status=0x58 { DriveReady SeekComplete DataRequest }

>    Most  seem  to  say  this is a bad block on the harddrive. I am not
>    convinced  though.  Using  Linux on three machines here, and I have
>    seen  this error on all of them, with lots of disks. The error seem
>    to   come  random,  but  does  cause  system  lockups  and  broken
>    filesystems.

>    Have  about  20  disks, and have replaced and upgraded them several
>    times  too.  This error has shown on most of them. But when testing
>    them  with tools like IBM DFT, Maxtor Powermax, badblocks or chkdsk
>    in Windows none show up to be with errors on.

>    Sometimes  it  seem  to  help to disable DMA and or lower UDMA mode
>    (all  drives are ATA-100 or ATA-133). But then after a few days, or
>    a  few  minutes  the  kernel  starts spitting out these status=0x58
>    errors.

>    After  looking  online  on  different forums it does seem that many
>    people are experiencing them.

>    What  exactly does this status=0x58 error mean, and what can one do
>    to solve the problem?

>    //Anders


> --------
> PGP public key: https://tnonline.net/secure/pgp_key.txt


   



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

