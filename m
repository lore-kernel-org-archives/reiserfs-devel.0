From: Oleg Drokin <green@namesys.com>
Subject: Re: File Corruption
Date: Tue, 1 Oct 2002 10:10:50 +0400
Message-ID: <20021001101050.A5833@namesys.com>
References: <20020930195227.71240.qmail@web10501.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11583-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020930195227.71240.qmail@web10501.mail.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jeff leads <jleads@yahoo.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Sep 30, 2002 at 12:52:27PM -0700, jeff leads wrote:
> Ok, I'm running RedHat 7.1, gcc 2.96-85, kernel
> 2.4.9-21 (redhat's version) and ReiserFSProgs 3.6.3 (

I do not know what is included into 2.4.9-21, but can you upgrade to
2.4.18-10 (I think this is latest RedHat errata kernel for 7.x series of
their distro).

> I'm starting to get file corruption here and there. 
> My next question is, where do I go from here?  What

You need to upgrade kernel to something that includes all of our fixes at least
up to 2.4.18.

> can I do to rectify this issue?  Do I run a rebuild at
> this point?  What caused this?  

This is hard to tell what have caused this.
Can you please send us reiserfsck output from the same partition,
but take reiserfsck from ReiserFSProgs 3.6.3?

> Sep 30 14:03:11 goku kernel: is_tree_node: node level
> 64680 does not match to the expected one 1

This is on disk metadata corruption, but the reason is unknown

> [root@goku /root]# reiserfsck /dev/ida/c0d0p5
> <-------------reiserfsck, 2001------------->
> reiserfsprogs 3.x.0j

This is too old to be used today.

Bye, 
    Oleg 
