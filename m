From: Hans Reiser <reiser@namesys.com>
Subject: Re: securely deleting files
Date: Mon, 12 May 2003 14:39:51 +0400
Message-ID: <3EBF79F7.8090501@namesys.com>
References: <Pine.LNX.4.44.0305060522270.20364-100000@potato.zayda.com> <20030512075022.GC21604@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14077-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030512075022.GC21604@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Jason Holt <jason@lunkwill.org>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Tue, May 06, 2003 at 05:37:13AM +0000, Jason Holt wrote:
>
>  
>
>>Now, a good friend of mine pointed out that part of the space on a filesystem
>>is kept aside just for root, so you may want to fill the disk up as root.  
>>(Is this actually a concern?  Can blocks which used to hold user data end up
>>being reserved?)  
>>    
>>
>
>Yes they can.
>No, we don't have such (supported) feature in reiserfsv3 yet.
>
You meant the reserved space for root?

>Also if the file was deleted, but something still have open filehandle to it (or hardlink),
>its blocks are not freed at rm time and therefore filling all the free space won't help.
>There are other caveats.
>
>  
>
>>Also, if your sensitive file was in memory recently it might have been swapped
>>out, in which case it may still be in the swap partition.  I have a program
>>which fills up all available *memory* as well, and I could post the source
>>here if everyone's interested.
>>    
>>
>
>If the program that used the file and still have the copy of it is still running,
>no matter how much you eat all the ram, the file still can end up in swap.
>
>The program that fills up all available memory is called "tail". Just run
>"tail /dev/zero" and enjoy ;) (this does not work on FreeBSD, though).
>
>Bye,
>    Oleg
>
>
>  
>


-- 
Hans


