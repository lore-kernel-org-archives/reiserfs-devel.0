From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: resizefs.reiser4 ?
Date: Thu, 04 May 2006 12:01:45 +0400
Message-ID: <1146729705.6514.8.camel@tribesman.namesys.com>
References: <20060502212820.GA5615@raven.londonmet.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28555-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060502212820.GA5615@raven.londonmet.ac.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ild0012@londonmet.ac.uk
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2006-05-02 at 22:28 +0100, ild0012@londonmet.ac.uk wrote:
> >hello reiserfs team!
> 
> i have installed the latest reiser4progs-1.0.5
> 
> i couldn't find resizefs.reiser4 anywhere apart of the manpage
> 
> does this util exist at all or not ?
> 

it does not exist.

> is it too far from beeing published ?
> 

nobody currently works on it.

> i realy need it to icrease my LVM2 volumes .
> 
> 
> also i had few hangs using patch for 2.14.6 ,
> now i installed 2.6.16.12 and the patch for 2.6.16 applied to it.
> 

do hangs appear on 2.6.16? If yes, can you please provide more
information about how to reproduce them?

> is 2.6.16.12 &patch bettr for the moment ?
> 

reiser4 patch for 2.6.16 is
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-2.patch.gz

> ps:
> also i want to let you know that TestDisk from cgsecurity.org (partition table recovery utility now supports reiser4 - recovered a couple of my partitions )
> 
> thank you for your work.
> bye.
> 
> Ilya d85
> 

