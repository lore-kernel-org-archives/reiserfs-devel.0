From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: File Undeletion on ReiserFS 3.6
Date: Wed, 25 Jun 2003 14:45:01 +0400
Message-ID: <200306251445.01378.vitaly@namesys.com>
References: <Pine.LNX.4.33.0306241958320.9813-100000@shellx.tical.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14695-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.33.0306241958320.9813-100000@shellx.tical.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ray Barnes <rrb@shellx.tical.net>
Cc: reiserfs-list@namesys.com


Hi, 

On Wednesday 25 June 2003 04:04, Ray Barnes wrote:
> Hello All,
>
> I recently did a rm -rf * in the wrong directory, and accidentally erased
> a whole heap of information.  Being unsure of what to do about it, I
> checked the FAQ on www.namesys.com and did several Google searches, but
> did not find any useful information.  Finally, I searched the mailing list
> archive and found a post along with a suggestion for recovery.  Here's
> what I did:
>
> dd if=/dev/hdsomething of=backupfie
> losetup /dev/loop5 backupfile
>
> with that in hand, I tried:
>
> reiserfsck --rebuild-tree --scan-whole-partition /dev/loop5
> mount /dev/loop5 <mountpoint>
>
> According to the poster, it worked for him.  However, it did not work for
> me.  I believe one of the subdirectories got recovered (which happened to
> be the last thing that the rm -rf deleted, i'm assuming).. but it did not
> recover anything else.  The total amount of information that I lost was 30
> gigs or so, out of a 40 gig drive.  I'm thinking that it *might* have had
> something to do with the amount of free space on the drive, which would
> have been about 95% utilization.  Also, as a hint, when I look at 'df'
> with the repaired partition mounted, the utilization now says 95% where as
> before it said 5%.  Additionally, as another hint, I did not immediately
> dismount that partition as I should have.  I left the box up for about 14
> hours after the 'rm' incident, and it would have been making entries into
> the syslog, as well as running MRTG processes every couple of minutes,
> etc.
>
> Any ideas?

--scan-whole-partition is not an undelete option, it just tries to recover 
data from unsed blocks of fs, not from used only. And as links between 
'/' and your data could be lost - specially in the case of working with the 
fs after removing - all recovered data go to lost+found directory. As you 
have got +90% of partition used, it seems that there are a lot of data in 
lost+found, just look it through and check for some recovered subtrees.

-- 
Thanks,
Vitaly Fertman
