From: Chris Mason <mason@suse.com>
Subject: Re: System freeze with data=ordered,journal
Date: 16 Jan 2003 10:32:06 -0500
Message-ID: <1042731126.31095.2191.camel@tiny.suse.com>
References: <187106764671.20030116161746@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12400-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <187106764671.20030116161746@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>
Cc: Reiserfs-List@namesys.com

On Thu, 2003-01-16 at 10:17, Anders Widman wrote:
>    Using 2.4.21-3 with data logging patches from
>    ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21
> 
>    Root  FS  is  ReiserFS. When mounting with data=ordered,journal the
>    system  freesez  after  a  few  minutes.  I get no kernel errors or
>    nothing  in  the  logs,  and  nothing on the screen. Keyboard stops
>    working - only hard reset works.
> 
>    When  not using these mount options (same kernel with patches) then
>    the systems runs just fine.

Thanks for giving the patches a try.  Just to confirm, it is the root FS
being mounted with data=ordered or data=journal, and you are doing this
through the /etc/fstab file?  

In other words, the root fs starts off mounted readonly and then gets
switched to data=ordered or data=journal?

-chris


