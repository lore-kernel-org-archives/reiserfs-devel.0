From: Hans Reiser <reiser@namesys.com>
Subject: Re: libaal documentation: fact or fiction?
Date: Thu, 09 Oct 2003 14:19:02 +0400
Message-ID: <3F853616.8010808@namesys.com>
References: <3F82F657.8040605@mbl.ca> <3F83B424.90107@namesys.com> <20031008163202.GA2185@mbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15821-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031008163202.GA2185@mbl.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geoff Oakham <g@mbl.ca>
Cc: Yury Umanets <umka@namesys.com>, reiserfs-list@namesys.com, demidov <demidov@thebsh.namesys.com>

Geoff Oakham wrote:

>Hi Yury,
>
>Thanks for getting back to me!
>
>On Wed, Oct 08, 2003 at 10:52:20AM +0400, Yury Umanets wrote:
>  
>
>>Libaal has been developed as a try of standard interface between 
>>corresponding FS userspace library (currently libreiser4) and 
>>application that wants to use that library (currently reiser4progs).
>>    
>>
>
>Is this library the userland interface applications use to write to
>files in atomic operations?
>
No, sys_reiser4 is.  sys_reiser4 is currently in a quite raw state.  You 
might want to contact us again in 3 months.

We do not support isolation in transactions yet.  We only support 
atomicity.  Atomicity is easier to implement without complications 
regarding performance and deadlock than isolation.

>
>  
>
>>BTW, why do you interested in documenting it?
>>    
>>
>
>A number of reasons: I'm interested in ReiserFs4 and I want to start
>playing with it.  As I understand it, Reiserfs4 will offer data
>journalling and plugin support.. both things I'd like to play with.
>Since neither seems to have been documented yet, I thought I'd start by
>attempting that.
>
>I'm also intersted because data-journalling has the potential to become
>a standard interface for Linux filesystems.. and as an outsider I was
>hoping I would be able to offer suggestions on how to clean up that API
>and speed up its acceptance.  Futhermore, I want to see if it's possible
>to implement the equivalent functionality (at least from a programmer's
>perspective) on a traditional UNIX filesystem using old-fasioned
>file-locking.
>
>Cheers,
>
>Geoff
>
>  
>


-- 
Hans


