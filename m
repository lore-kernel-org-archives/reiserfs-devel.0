From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 16:34:02 +0300
Message-ID: <3E4CF04A.2030904@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030214035034.M22930@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Andreas Dilger wrote:

>On Feb 14, 2003  13:17 +0300, Oleg Drokin wrote:
>  
>
>>On Fri, Feb 14, 2003 at 03:13:16AM -0700, Andreas Dilger wrote:
>>    
>>
>>>>Currently we panic if write to journal area fails. We report IO error to
>>>>userspace if non-journaled write fails it seems (I will check it again).
>>>>        
>>>>
>>>I'm thinking "panic" isn't going to help the user's data any more than
>>>not commiting the change...  How about remount-ro, or have a mount option
>>>      
>>>
>>SuSE people work on this.
>>
>>    
>>
>>>like ext3 "errors={panic,remount-ro,warning}"?  If you marked the filesystem
>>>and/or journal in error and mount read-only, and force a full fsck at
>>>reboot time at least the user has a chance - otherwise the node might
>>>just panic in a loop.
>>>      
>>>
>>It hangs on panic ;) (because it does BUG() ), so no cyclical reboot.
>>    
>>
>
>Ah, you said panic, but panic != BUG...  There is a "reboot-on-panic" flag
>that is often set on servers so they don't sit stupidly when they could
>reboot and start working again.
>
>  
>
>>There is even big chance that everything not touching problematic fs will
>>survive and continue to work.
>>Given that nobody runfs reiserfsck at boot, "full fsck" aproach won't work.
>>Ah, and reiserfsck ignores -a command line switch because
>>"we do not trust our fsck yet" (c) Hans.
>>    
>>
>
>Yeah, I keep giving him good reasons to change his mind, even a little,
>like "have 'reiserfsck -a' just check the superblock and return with a
>code > 1 if there is an error" so that an admin can at least do something
>about it if the filesystem is broken, before it gets mounted/written to
>again and the brokenness multiplies unknown to the user...
>
I don't understand you.

>
>Next, add journal replay to reiserfsck if it isn't already there,
>
Why, when it is in the kernel?

> and
>_then_ do the same check as above, keeping a field in the journal header
>to synchronously write an error to in fatal cases, instead of into the
>superblock and where it is overwritten by journal replay.
>
>That is all e2fsck does for ext3 filesystems, and it only takes a fraction
>of a second to complete (no longer than it takes in-kernel journal replay
>to complete at mount time, really) but the user wins by being able to fix
>the filesystem before the whole system has booted and possibly corrupted
>more data.
>
>Regardless of whether reiserfsck is trusted or not to check/fix the
>whole filesystem automatically, the above is not a risky change.  If you
>wanted to go for more reliability, you could start adding quick "read
>only" checks at periodic intervals like ext2 even if you never fix the
>filesystem without user intervention.  The most common error we see on
>the ext3 these days is due to memory/disk corruption that is caught by
>the kernel or with a periodic check, which no amount of journaling can
>fix or prevent.
>
I hate it when booting causes me to get stuck waiting for an fsck.

Probably fsck is stable enough now that we should encourage people to 
run it readonly regularly, but it should not be forced on them.

Maybe having some code to check whether fsck was run in the last 3 
months, and if not then if the user types y in the next 30 seconds 
during boot it will be run, would make sense.

The ext2 tradition of checking the number of mounts since the last fsck 
is simply counting the wrong thing.

>
>Cheers, Andreas
>--
>Andreas Dilger
>http://sourceforge.net/projects/ext2resize/
>http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
>
>  
>


-- 
Hans


