From: Hans Reiser <reiser@namesys.com>
Subject: Re: Final test on v4 reiserfs ?
Date: Mon, 23 Jun 2003 13:12:05 +0400
Message-ID: <3EF6C465.6020703@namesys.com>
References: <53797.203.186.23.91.1056328735.squirrel@sml.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <53797.203.186.23.91.1056328735.squirrel@sml.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Graham <lkthomas@sml.dyndns.org>
Cc: reiserfs-list@namesys.com

Thomas Graham wrote:

>anyone did a final test yet ? what's known problem right now ?
>Thanks
>
>
>  
>
Sigh, releasing by LinuxTag will be tight.

Current issues off the top of my head.

extent overwrite code writes data twice  needlessly (no need to get more 
exact, it is being fixed).

we need to steal on capture (that is, if a block is in a transaction 
being committed, we need to copy it if another transaction wants it 
rather than wait on the commit)

we need to figure out why experimental code written last week to order 
filebodies by filenames isn't working.

I need to perform complete reading from beginning to end of all code.  
Who knows what I will find.

All FIXMEs in the code need to get fixed.

delete performance needs to be fixed at least up to reiser3 levels.

It would be nice if CPU consumption could drop a bit, and it would be 
nice to test on a highly smp machine.

It would be nice if our txnmgr code improved in regards to locking.

For us to (beta) release at LinuxTag three conditions have to be met:

1) I have to feel that I would choose to use it over V3 in regards to 
performance.

2) We have to be unable to crash it inside Namesys using all of our 
testing scripts.

3) I have to be sure that the right key assignment algorithm is chosen 
as the default.

-- 
Hans


