From: Hans Reiser <reiser@namesys.com>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Tue, 18 Feb 2003 21:21:54 +0300
Message-ID: <3E5279C2.3090702@namesys.com>
References: <3E4AA902.86F15815@interface-ag.com> <b2h7dc$ipp$1@satsuki.furryterror.org> <3E4C392A.2070909@namesys.com> <20030214111829.A21849@namesys.com> <20030214031316.L22930@schatzie.adilger.int> <20030214131746.H10351@namesys.com> <20030214035034.M22930@schatzie.adilger.int> <3E4CF04A.2030904@namesys.com> <20030214120630.O22930@schatzie.adilger.int> <3E4D4129.8040103@namesys.com> <20030215153710.A1723@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030215153710.A1723@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>
Cc: Oleg Drokin <green@namesys.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

Andreas Dilger wrote:

>On Feb 14, 2003  22:19 +0300, Hans Reiser wrote:
>  
>
>>Andreas Dilger wrote:
>>    
>>
>>>You are well aware
>>>that the e2fsck check intervals can be tuned per-filesystem and even
>>>disabled if desired (it prints options for how to do this at mke2fs time
>>>and is clearly documented for the experienced user).  For a boot-once-a-day
>>>machine, the default is to check about once a month (at most 6 months for
>>>the time check), and if machines are crashing more often, then they should
>>>probably be checked more often because _something_ has to be causing crashes.
>>>
>>>      
>>>
>>The idea that how often you boot determines how often it checks is just 
>>silly, sorry.
>>    
>>
>
>I guess the shortcoming in the ext2 case is that it counts mounts and
>not crashes.  If it were counting the number of times the filesystem
>was uncleanly shut down instead of normal shutdowns, would that be more
>acceptable?  The reason I'm still interested in crashes, even if they
>are not filesystem-related crashes, is because there had to be _something_
>which caused a crash (bad code, bad hardware, whatever), and once you have
>any driver corrupting memory the chance that it is also corrupting filesystem
>memory exists.
>
This is at least arguably legitimate;-)....

>
>  
>
>>>Having reiserfsck just do read-only checks shouldn't force you to type
>>>"yes" (and we mean "yes" because this is so scary, mere mortals shouldn't
>>>be doing this).  Hans, you've always talked about making things easy for
>>>the average user (error messages and such), don't you think that making
>>>a data consistency check for the user a little less intimidating too?
>>>      
>>>
>>I think that you should have to agree that you have time to wait for 
>>fsck before you get stuck with a 1 day large server fsck.
>>    
>>
>
>That is definitely true.  However, my assumption would be that if someone
>is running a system with terabytes of data they will read the man page
>after waiting a day for fsck to complete, or lose their job.
>
How much does a terabyte of disk cost?  A thousand dollars?  How much 
does a qualified sysadmin cost?  $100-200k in Silicon Valley (but 
rapidly reducing).

Yet this is still the wrong attitude....  our job is to make the 
software so that it works without hassle.   They don't need more items 
on their checklists, they need software that manages the checklists for 
them.

Also,  whether a sysadmin is willing to wait a day for fsck might depend 
on the day you ask him.

So I completely reject the argument you make.

>  It is entirely
>possible for administrators to disable the per-mount e2fsck checking, and
>the time-based (6 months by default) checking too, and do fsck themselves.
>My experience would be that, like backups, people don't do that, so leaving
>the 6 month check in protects users from themselves.
>
Most users don't know that they can do it, and those that do don't need 
us giving them more things they need to set when installing the OS.

>
>The other thing to keep in mind is that you can have different "levels" of
>automated fsck at boot time, depending on how long they take.  You never
>necessarily have to try and fix anything with "fsck -a", just detect errors
>and leave it up to the user to decide what to do if you find a problem:
>- always recover journal, validate superblock, error flag (< 1s)
>
>Don't know how long it takes these things to run, so it is up to you to
>trade off checks vs. speed, and you could even round-robin them (storing
>the last checked item in the superblock or something):
>- check block allocation bitmaps match superblock counts
>- walk directory structure from root, checking for directory corruption
>- check btree validity on inodes for up to 10 seconds (or whatever, storing
>  last checked inode in superblock for restarting this test at next one)
>
>By all means, don't do checks for an hour, or allow users to set the maximum
>boot check duration in the superblock.  I'm sure users don't mind waiting
>5s at boot time if it means they don't lose data.
>
I doubt that there is a lot we can check in 5 seconds on a filesystem 
with lots of small files, but I could be wrong.

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


