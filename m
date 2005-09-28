From: Hans Reiser <reiser@namesys.com>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 11:11:24 -0700
Message-ID: <433ADCCC.2090903@namesys.com>
References: <1127914812.12894.96.camel@laptop>	 <200509281825.49873.vitaly@namesys.com> <1127921286.12894.106.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26311-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1127921286.12894.106.camel@laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com, vitaly@thebsh.namesys.com

Fionn Behrens wrote:

>On Mi, 2005-09-28 at 18:25 +0400, Vitaly Fertman wrote:
>
>  
>
>>>2.6.11 refused to boot the
>>>root partition, claiming that there were an inconsistency in the FS.
>>>      
>>>
>>the disk format got new parameters and old kernels cannot understand it right.
>>    
>>
>
>Ah, I see. So maybe it would be a good idea if the new fs version would
>put up a big fat warning to syslog when it detects a partition written
>by a previous version, telling the user that he is about to break
>compatibility to his older version (and that the must upgrade userland
>tools, too!)
>  
>
Good idea.  Vitaly, please fix it.

>  
>
>>>Sep 28 08:44:20 rtfm kernel: WARNING: wrong pset member (11) for 42
>>>Sep 28 08:44:20 rtfm kernel: WARNING: unused space in inode 42
>>>      
>>>
>
>  
>
>>which fsck version?
>>    
>>
>
>1.0.4
>
>  
>
>>>the man page said that this would be read-only. 
>>>      
>>>
>>it says:
>>" --check
>>the default action checks the consistency and reports, but does not 
>>repair any corruption that it finds. This option may be used on a 
>>read-only file system mount.
>>"
>>it does not mean 100% read-only check. 
>>    
>>
>
>Okay, you sound a bit like a lawyer, but: you right me wrong.
>  
>
Vitaly, fix the docs.

>  
>
>>>There was my fourth surprise: This fsck thing had LIED to me; it was not
>>>read-only. 
>>>      
>>>
>>why do you think --build-fs is read-only? 
>>    
>>
>
>Had not gone --build-fs yet. This was still about --check.
>
>  
>
>>>It may have checked the fs read-only but it must have 
>>>treacherously flipped some "error" bit somewhere on disk
>>>      
>>>
>
>  
>
>>>Warning, mounting filesystem with fatal errors, forcing read-only mount
>>>(followed by the error from above)
>>>      
>>>
>>do you see anything relevant in the syslog?
>>    
>>
>
>That line was in the syslog.
>
>  
>
>>>So much for --check being just a check. I grabbed a book and lost about
>>>two more precious working hours running the --build-fs thing.
>>>      
>>>
>
>  
>
>>you need to clarify what reiser4progs version you are running.
>>1.0.5 fixes the fs to the letest format, which is needed for 2.6.13.
>>1.0.3 to the 2.6.10's one. 
>>    
>>
>
>1.0.4 . As I am now back on 2.6.11, I guess I should not upgrade to
>1.0.5 or would that not do harm anyway?
>
>thanks for answering!
>
>kind regards,
>		Fionn
>  
>

