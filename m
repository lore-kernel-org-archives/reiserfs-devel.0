From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: FW: Problem with reiserfsck --rebuild-tree
Date: Fri, 30 Aug 2002 12:33:05 +0400
Message-ID: <200208301233.05764.vitaly@namesys.com>
References: <5C13D527041B9145AB3E6D5D040494AD09CB74@himl07.hickam.pacaf.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11348-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5C13D527041B9145AB3E6D5D040494AD09CB74@himl07.hickam.pacaf.ds.af.mil>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bingner Sam J Contractor PACAF CSS/SCHE <Sam.Bingner@hickam.af.mil>, "'reiserfs-list@namesys.com '" <reiserfs-list@namesys.com>
Cc: "'sam@dhs.org '" <sam@dhs.org>


Hi, 

Do you see anything related in your syslog, like I/O errors or similar?

please send me the metadata dump of your partition:
    debugreiserfs -p /dev/md0 | bzip -c > md0.bz2


On Friday 30 August 2002 12:19, Bingner Sam J Contractor PACAF CSS/SCHE wrote:
>  <<rebuild.log.gz>>
> I had some corruption on my drive, and it hammered the FS (and alot of
> the files I'm sure) ... so I had to run reiserfsck --rebuild-tree ...
> I'm attaching the output as well as the logfile, it looks like it's
> finding alot of good dirs etc, but it's getting a segfault...  any help
> would be greatly appreciated...
>
> my tape drive is FUBAR, so unfortunately, no I don't have a backup of
> everything ;)
>
> Lastly, I'm not subscribed to the list. Please CC me at either this
> address or sam@dhs.org on all replies... thanks :)
>
> Sam
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.3
>
>   **********************************************************
>   ** This  is  an  experimental  version  of  reiserfsck, **
>   **              !! MAKE A BACKUP FIRST !!               **
>   ** Don't run this program unless something  is  broken. **
>   ** Some types of random FS damage can be recovered from **
>   ** by  this  program,   which  basically   throws  away **
>   ** the internal nodes of the tree and then reconstructs **
>   ** them. This program is for use only by the desperate, **
>   ** and is  of only beta quality.  If you are using  the **
>   ** latest  reiserfsprogs  and  it  fails  please  email **
>   ** bug reports to reiserfs-list@namesys.com.            **
>   **********************************************************
>
> Will rebuild the filesystem (/dev/md0) tree
> Will put log info to 'rebuild.log'
>

-- 

Thanks,
Vitaly Fertman
