From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Fri, 14 Feb 2003 22:19:05 +0300
Message-ID: <3E4D4129.8040103@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com> <20030214120630.O22930@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030214120630.O22930@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Andreas Dilger wrote:

>On Feb 14, 2003  16:34 +0300, Hans Reiser wrote:
>  
>
>>Andreas Dilger wrote:
>>    
>>
>>>Yeah, I keep giving him good reasons to change his mind, even a little,
>>>like "have 'reiserfsck -a' just check the superblock and return with a
>>>code > 1 if there is an error" so that an admin can at least do something
>>>about it if the filesystem is broken, before it gets mounted/written to
>>>again and the brokenness multiplies unknown to the user...
>>>      
>>>
>>I don't understand you.
>>    
>>
>
>Ok, so the reiserfs kernel code detects an error on disk, what does it
>do?  Print out an error message, maybe BUG?  There is an "error" field
>in the reiserfs superblock, I hope it is set when the kernel detects
>something bad.
>
>So, now what happens?  Maybe the user doesn't read their syslog and
>doesn't see the error, or the error is just a prelude to memory corruption
>which causes the system to crash.  When the system boots again, it goes
>on its merry way, mounting the reiserfs filesystem with _known_ errors
>on it, using bad allocation bitmaps, directories btrees, etc and maybe
>double allocating blocks or overwriting blocks from other files causing
>them to become corrupt, etc, etc, etc.  Until finally the filesystem is
>totally corrupt, the system crashes miserably, the user emails this list
>and reiserfsck has an impossible job trying to fix the filesystem.
>
>Instead, what I propose is to have "reiserfsck -a" AS A STARTING POINT
>simply check for a valid reiserfs superblock and the absence of the
>"error" flag before declaring the filesystem clean and allowing the
>system to boot.
>
>What's even worse, the reiserfs_read_super (at least 2.4.18 RH kernel)
>code OVERWRITES the superblock error status at mount time, making it
>worse than useless, since each mount hides any errors that were detected
>before the crash:
>
>	s->u.reiserfs_sb.s_mount_state = SB_REISERFS_STATE(s);
>	s->u.reiserfs_sb.s_mount_state = REISERFS_VALID_FS ;
>
Andreas seems reasonable, Vitaly, what are your thoughts?

>
>  
>
>>>Next, add journal replay to reiserfsck if it isn't already there,
>>>
>>>      
>>>
>>Why, when it is in the kernel?
>>    
>>
>
>Because that is the next stage to allowing reiserfsck do checks on the
>filesystem after a crash.  Do you tell me you would rather (and you
>must, because it obviously currently does) have reiserfsck just throw
>away everything in the journal, leaving possibly inconsistent data in
>the filesystem for it to check?  Or maybe make the user mount the
>filesystem (which obviously has problems or they wouldn't be running
>reiserfsck to do a full check) just to clear out the journal and maybe
>risk crashing or corruption if the filesystem is strangely corrupted?
>
Vitaly, answer this.

>
>  
>
>>Maybe having some code to check whether fsck was run in the last 3 
>>months, and if not then if the user types y in the next 30 seconds 
>>during boot it will be run, would make sense.
>>    
>>
>
>Sure, that would be great, given the prevelance of memory errors and
>IDE DMA errors that show up these days, which the filesystem and the
>journal can do nothing about.
>
>  
>
>>The ext2 tradition of checking the number of mounts since the last fsck 
>>is simply counting the wrong thing.
>>    
>>
>
>It's only a matter of defaults safe vs. fast...  e2fsck defaults to safe,
>checking occasionally for possible corruption, vs. reiserfs waiting for
>fatal corruption before forcing the user to run reiserfsck (which is so
>heavily discouraged (on the list, documentation, when run), that nobody
>runs it for fear of damaging their filesystem further. 
>
It is probably not so dangerous anymore.

> You are well aware
>that the e2fsck check intervals can be tuned per-filesystem and even
>disabled if desired (it prints options for how to do this at mke2fs time
>and is clearly documented for the experienced user).  For a boot-once-a-day
>machine, the default is to check about once a month (at most 6 months for
>the time check), and if machines are crashing more often, then they should
>probably be checked more often because _something_ has to be causing crashes.
>
The idea that how often you boot determines how often it checks is just 
silly, sorry.

>
>Having reiserfsck just do read-only checks shouldn't force you to type
>"yes" (and we mean "yes" because this is so scary, mere mortals shouldn't
>be doing this).  Hans, you've always talked about making things easy for
>the average user (error messages and such), don't you think that making
>a data consistency check for the user a little less intimidating too?
>
>  
>
I think that you should have to agree that you have time to wait for 
fsck before you get stuck with a 1 day large server fsck.

-- 
Hans


