From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsck --rebuild-tree aborted
Date: Tue, 14 Mar 2006 22:27:27 +0300
Message-ID: <200603142227.28096.vitaly@namesys.com>
References: <33411075.1142359382625.JavaMail.ngmail@webmail13> <8706922.1142360996567.JavaMail.ngmail@webmail13>
Reply-To: vitaly@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28254-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <8706922.1142360996567.JavaMail.ngmail@webmail13>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: j_kanev@arcor.de

On Tuesday 14 March 2006 21:29, j_kanev@arcor.de wrote:
> 
> (sorry for multiple posts)
> 
> After a crash my reiserfs partition behaved strangely (space usage 100%, 
> root wasn't allowed to see some files or write into some directories, 
> and some error messages when accessing files).  
> fsck.reiserfs found errors which it said must be corrected with --rebuild-tree. 
> fsck.reiserfs --rebuild-tree aborted with the message "low on disk space". 
> Why is this? And: 

which pass does fsck abort on? 

there were made several improvements in reiserfsprogs regarding 
running out of disk space, you can try it if you want. the code 
is not released yet, so probably you will prefere to enlarge your 
partition and fs to allow fsck to complete.

> What should I do now? 
> 
> Lots of regards, Jacob.
> 
> P.S.:
> I don't really have a larger partition.
> 
> P.P.S.: 
> The reiserfs-partition was used last with a 2.6.15-1 kernel, 
> and fsckreiserfs (see above) was run with a 2.6.14 kernel from Kanotix. 
> The reiserfsprogs version was 3.6.19-1. Output of debugreiserfs was the following:   

-- 
Vitaly
