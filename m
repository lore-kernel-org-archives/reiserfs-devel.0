From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: About direntries pointing to nowhere on reiserfs problem in 2.4
Date: Fri, 21 Feb 2003 08:11:16 +0100
Message-ID: <3E55D114.6040401@mb.tu-ilmenau.de>
References: <20030220175309.A23616@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12849-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list <reiserfs-list@namesys.com>

On 02/20/2003 03:53 PM, Oleg Drokin wrote:
> Hello!
> 
>     Vladimir have finally tracked the problem to a race between
>     two iget4 running on same file whose inode is not in cache.
>     The sequence of events is like this (UP case):
> 1st thread:
>     take inode_lock
>     search through inode cache, but found nothing.
>     alloc new inode, mark it as locaked.
>     release inode_lock
>     call reiserfs_read_inode2().
>          do some stuff.
>          call search_by_key()
>          schedule()
> 
> Now 2nd thread comes in:
>     take inode_lock
>     search through inode cache, found inode with same inode number.
>     check that there is find_actor defined for reiserfs.
>     call find_actor()
>          check that inode's primary key's dir_id is equal to expected one.
>                but at that time this part of inode is uninitialized yet!
>                so we return 0;
>     ... 
>     And we create second inode for the same file.
> 
>    This scenario seems possible for any filesystem that stores some "cookie" 
>    in private part of inode and whose read_inode2 can schedule. We checked and
>    coda seems safe because they take a semaphore in iget().
> 
>    So we solved that with patch below (Zygo, others who think they have this problem,
>    please check).
> 
>    But Vladimir is really unhappy with that comparison with zero and guessing (though
>    he agrees it is correct, if FS is undamaged).
> 
>    Andrew, Alan: Is there a possibility to have iget5_locked() kind of interface
>    in 2.4? We need some way to init parts inode under inode_lock to solve this problem
>    in more elegant way. (and inode_lock is not even exported, so I invented another spinlock
>    to guard atomicity of inode pkey update on SMP).
> 
> Bye,
>     Oleg
> 

Hi!

Is this fix safe for usage already?

Chris, can you, please, put out the latency-related patch/diff soon for 
data=ordered mode?

Mmmh. I have some hangs within KDE 2.2.2 Konqueror when copying over 
(existing) directory links for some weeks now. I don't copy often over 
links but when it stalls, a directory link is somewhere involved.
(No crashes, no messages in the logs, just "minutes" for copies or 
deletes that happened in seconds usually.)

Should I worry and use the patch
  -- or finally upgrade my KDE ;-))

Thanks,

Manuel

P.S.: My kernel is 2.4.21-pre4 + all Chris' data-logging patches + 
preempt-patch for -pre1 (in that order).

[PATCH - direntry-fix.diff]

