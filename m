From: Hans Reiser <reiser@namesys.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Tue, 24 Dec 2002 12:26:36 +0300
Message-ID: <3E08284C.4020906@namesys.com>
References: <3E06F360.7000708@namesys.com> <200212231421.52052.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12236-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212231421.52052.bofh@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <bofh@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote:

>On Mon, 23 Dec 2002 12:28, Hans Reiser wrote:
>  
>
>>We were discussing how to optimize reiser4 best, and came to realize
>>that us developers did not have a good enough intuition for what users
>>do that stresses their filesystem enough that they care about its
>>performance.
>>
>>Booting the machine seems like one activity that many users end up
>>waiting on the FS for.  Yes?
>>    
>>
>
>Yes, although there are other factors than the file system which determine 
>boot time.  Different types of init scripts can probably improve performance 
>more than anything you could do to a file system.
>
>Also if you have a rack-mount server then it'll probably take 2 minutes or 
>more to go through the BIOS checks so FS delays will seem like nothing by 
>comparison.
>
I mostly meant waiting for the fs to read all the binaries that get 
executed at startup, not just the journal replay time.



