From: Larry Weldon <larry@welcoin.com>
Subject: Re: rebuild-tree
Date: 09 Dec 2003 06:16:19 -0500
Message-ID: <1070968579.2988.29.camel@larry>
References: <1070829963.2789.528.camel@larry> <3FD49E01.9090502@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16297-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FD49E01.9090502@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs mailing list <reiserfs-list@namesys.com>

On Mon, 2003-12-08 at 10:51, Hans Reiser wrote:
> Larry Weldon wrote:
> 
> >A client's production file server is set up using RAID-1 with 2 IDE
> >disks and reiserfs. The operating system is Mandrake 9.1.
> >
> which kernel does it use?
> 

linux-2.4.19-32mdk
reiserfsck, 2002 - reiserfsprogs 3.6.3

[snip]

> With reiserfs, if you corrupt the internal nodes of the tree, you have 
> to run fsck before you can use it, and in this we are more fragile, but 
> once fsck has been run it is no more fragile than anything else 
> (assuming you use the latest fsck, because fsck took a long time to 
> stabilize).
> 

I would be wise, then to install the latest reiserfs on older servers as
well?

Thank you,
-- 
Larry Weldon <larry@welcoin.com>

