From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 18 Feb 2003 22:50:57 +0300
Message-ID: <3E528EA1.60604@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <3E4D4129.8040103@namesys.com> <200302151551.12765.vitaly@namesys.com> <200302151600.35675.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302151600.35675.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Andreas Dilger <adilger@clusterfs.com>, Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Vitaly Fertman wrote:

>On Saturday 15 February 2003 15:51, Vitaly Fertman wrote:
>  
>
>>>>Ok, so the reiserfs kernel code detects an error on disk, what does it
>>>>do?  Print out an error message, maybe BUG?  There is an "error" field
>>>>in the reiserfs superblock, I hope it is set when the kernel detects
>>>>something bad.
>>>>
>>>>So, now what happens?  Maybe the user doesn't read their syslog and
>>>>doesn't see the error, or the error is just a prelude to memory
>>>>corruption which causes the system to crash.  When the system boots
>>>>again, it goes on its merry way, mounting the reiserfs filesystem with
>>>>_known_ errors on it, using bad allocation bitmaps, directories btrees,
>>>>etc and maybe double allocating blocks or overwriting blocks from other
>>>>files causing them to become corrupt, etc, etc, etc.  Until finally the
>>>>filesystem is totally corrupt, the system crashes miserably, the user
>>>>emails this list and reiserfsck has an impossible job trying to fix the
>>>>filesystem.
>>>>
>>>>Instead, what I propose is to have "reiserfsck -a" AS A STARTING POINT
>>>>simply check for a valid reiserfs superblock and the absence of the
>>>>"error" flag before declaring the filesystem clean and allowing the
>>>>system to boot.
>>>>
>>>>What's even worse, the reiserfs_read_super (at least 2.4.18 RH kernel)
>>>>code OVERWRITES the superblock error status at mount time, making it
>>>>worse than useless, since each mount hides any errors that were detected
>>>>before the crash:
>>>>
>>>>	s->u.reiserfs_sb.s_mount_state = SB_REISERFS_STATE(s);
>>>>	s->u.reiserfs_sb.s_mount_state = REISERFS_VALID_FS ;
>>>>        
>>>>
>>>Andreas seems reasonable, Vitaly, what are your thoughts?
>>>
>>>      
>>>
>>>>>>Next, add journal replay to reiserfsck if it isn't already there,
>>>>>>            
>>>>>>
>>>>>Why, when it is in the kernel?
>>>>>          
>>>>>
>>>>Because that is the next stage to allowing reiserfsck do checks on the
>>>>filesystem after a crash.  Do you tell me you would rather (and you
>>>>must, because it obviously currently does) have reiserfsck just throw
>>>>away everything in the journal, leaving possibly inconsistent data in
>>>>the filesystem for it to check?  Or maybe make the user mount the
>>>>filesystem (which obviously has problems or they wouldn't be running
>>>>reiserfsck to do a full check) just to clear out the journal and maybe
>>>>risk crashing or corruption if the filesystem is strangely corrupted?
>>>>        
>>>>
>>>Vitaly, answer this.
>>>      
>>>
>>Ok, so probably we should make the following changes. The kernel set
>>IO_ERROR and FS_ERROR flags.
>>In the case of IO_ERROR reiserfsck prints the message about hardware
>>problems and returns error, so the fs does not get mounted at boot. On
>>attempt mounting the fs with IO_ERROR flag set it is mounted ro with some
>>message about hardware problems. When you are sure that problems
>>disappeared you can mount it with a spetial option cleaning this flag and
>>probably reiserfstune will have some option cleaning these flags also.
>>In the case of FS_ERROR - search_by_key failed or beyond end of device
>>access or similar - reiserfsck gets -a option at boot, replays the journal
>>if needed and checks for the flag. No flag - returns OK. Else - run
>>fix-fixable. Errors left - returns 'errors left uncorrected' and the fs
>>does not get mounted at boot. On attempt mounting the fs with the flag just
>>print the message about mounting the fs with errors and mount it. Not ro
>>here as kernel will not do deep analysis of errors and it could be just a
>>small insignificant error.
>>    
>>
>
>If fix-fixable finds fatal corruptions it sets FS_FATAL what means that the
>second run of fix-fixable will not help to avoid another fsck run at the next 
>boot.
>
>  
>
Can you repeat what you said (more clearly).

-- 
Hans


