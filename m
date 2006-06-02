From: Hans Reiser <reiser@namesys.com>
Subject: Re: Bad Hardware / Software Disk Detection for Production Systems
Date: Fri, 02 Jun 2006 09:47:06 -0700
Message-ID: <44806B8A.2090308@namesys.com>
References: <8bdd70ae0606020521o177b840eya5580b511f3526a3@mail.gmail.com>	 <20060602124045.GC16113@king.bitgnome.net> <8bdd70ae0606020610s1233668dgd6f53708d529e968@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <8bdd70ae0606020610s1233668dgd6f53708d529e968@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bill Rees <wsrees@gmail.com>
Cc: Mark Nipper <nipsy@bitgnome.net>, reiserfs-list@namesys.com

Bill Rees wrote:

> Believe it or not, we aren't that concerned with data loss in this
> application due to the way the data is stored on the disks.  We are
> more concerned with the becoming unresponsive due to problems writing
> to the filesystem. I would think that this could still happen in a
> RAID 5 implementation if the filesystem becomes corrupted. We haven't
> used RAID 5 in awhile but when we did, file system rebuilds that would
> take days were not uncommon.
>
> I am trying to maximize uptime and some data loss is not a problem. 
> Perhaps redundant RAID 5 systems would be the only answer to this problem?

Look into the reiserfs mount options regarding error handling.  If your
budget can justify it, we can write code to do whatever you want in this
area.

Hans

>
> On 6/2/06, * Mark Nipper* <nipsy@bitgnome.net
> <mailto:nipsy@bitgnome.net>> wrote:
>
>     On 02 Jun 2006, Bill Rees wrote:
>     >    This is a general question but I thought I'd post it to the
>     list to see if
>     >    anyone has any suggestions.
>
>             You cannot expect any sort of data integrity if you are
>     using JBOD mode on a RAID controller.  The very nature of JBOD
>     means that any time a single drive fails, you lose every
>     partition across that entire JBOD volume.
>
>             If your file systems are even coming back after such a
>     catastrophe, you have been extremely fortunate to date.  I still
>     cannot imagine that you aren't losing data though since there is
>     no mirroring going on whatsoever which means blocks are
>     inherently being lost during such failures.
>
>             If you are just looking for read performance, you should
>     seriously consider at least a RAID 1 volume.  If you can
>     sacrifice some overall performance, you will get the best space
>     optimization by going with a RAID 5.  Anything more exotic than
>     that, you should start at:
>     ---
>     http://en.wikipedia.org/wiki/Redundant_array_of_independent_disks
>
>     and go with whichever level of RAID makes the most sense for your
>     application.
>
>             The bottom line is, you are going to lose data in a JBOD
>     array (unless you also happen to be doing some sort of software
>     RAID on top of that).  There is really no gain through some sort
>     of software trick to try to avoid the data loss.  SMART enabled
>     hard drives may occasionally warn you of an imminent failure, but
>     then again, they may not.  Drives will just occasionally fail
>     entirely without any warning, hence the whole purpose of RAID
>     levels above 0.
>
>     --
>     Mark Nipper                                                e-contacts:
>     832 Tanglewood
>     Drive                                nipsy@bitgnome.net
>     <mailto:nipsy@bitgnome.net>
>     Bryan, Texas 77802-4013                     http://nipsy.bitgnome.net/
>     (979)575-3193                      AIM/Yahoo: texasnipsy ICQ: 66971617
>
>     -----BEGIN GEEK CODE BLOCK-----
>     Version: 3.1
>     GG/IT d- s++:+ a- C++$ UBL++++$ P--->+++ L+++$ !E---
>     W++(--) N+ o K++ w(---) O++ M V(--) PS+++(+) PE(--)
>     Y+ PGP t+ 5 X R tv b+++@ DI+(++) D+ G e h r++ y+(**)
>     ------END GEEK CODE BLOCK------
>
>     ---begin random quote of the moment---
>     Anyone who is capable of getting themselves made President
>     should on no account be allowed to do the job.
>     -- Douglas Adams, _The Hitchhiker's Guide to the Galaxy_
>     ----end random quote of the moment----
>
>

