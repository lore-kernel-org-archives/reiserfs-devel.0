From: Hans Reiser <reiser@namesys.com>
Subject: Re: question about a possible deadlock
Date: Fri, 26 Apr 2002 18:06:47 +0400
Message-ID: <3CC95EF7.2000903@namesys.com>
References: <20020426150726.A25444@castle.nmd.msu.ru> <1019822456.6770.59.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Andrey Savochkin <saw@saw.sw.com.sg>, reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2002-04-26 at 07:07, Andrey Savochkin wrote:
>  
>
>>Hi,
>>
>>I've found a call sequence leading to what looks like a deadlock:
>>open
>>  reiserfs_create
>>    journal_begin
>>    reiserfs_new_inode
>>      failure by one of multiple reasons
>>      iput [note that inode->i_nlink == 0]
>>        reiserfs_delete_inode
>>          journal_begin
>>            deadlock, waiting for previous journal_begin to end
>>The code was checked by the mainstream 2.4.18 kernel.
>>Any reasons why this deadlock can't happen?
>>    
>>
>
>Nope, you are exactly right.  We've got a patch in testing that should
>fix this, let me know if you are interested in trying it out.
>
>-chris
>
>
>
>
>  
>
Thanks a lot Andrey.

Hans


