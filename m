From: Hans Reiser <reiser@namesys.com>
Subject: Re: securely deleting files
Date: Tue, 06 May 2003 14:37:26 +0400
Message-ID: <3EB79066.3000205@namesys.com>
References: <Pine.LNX.4.44.0305060522270.20364-100000@potato.zayda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13960-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.44.0305060522270.20364-100000@potato.zayda.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jason Holt <jason@lunkwill.org>
Cc: reiserfs-list@namesys.com, Edward Shishkin <edward@namesys.com>

Jason Holt wrote:

>shred is a tool which is supposed to overwrite files so that they're
>unrecoverable, even with fairly involved recovery techniques.  
>
>But it isn't guaranteed to work - sensitive blocks may get moved around on the
>physical disk, stored in journals, etc.
>
>So here's how I get around it:
>
>$ cat >sensitive
>there's something sensitive in this file...
>
>$ rm sensitive
>$ cat /dev/zero    >foo ; sync ; rm foo  # Fill up the disk, then delete.
>$ cat /dev/urandom >foo ; sync ; rm foo  # For the *truly* paranoid
>
>Now, a good friend of mine pointed out that part of the space on a filesystem
>is kept aside just for root, so you may want to fill the disk up as root.  
>(Is this actually a concern?  Can blocks which used to hold user data end up
>being reserved?) 
>
Yes.

Edward, please put this in the faq, credit Jason, add a note that this 
will not protect against media scans using special equipment because 
writes and overwrites are not always equally aligned.

> 
>
>Also, if your sensitive file was in memory recently it might have been swapped
>out, in which case it may still be in the swap partition.  I have a program
>which fills up all available *memory* as well, and I could post the source
>here if everyone's interested.
>
>						-J
>
>
>
>  
>


-- 
Hans


