From: Hans Reiser <reiser@namesys.com>
Subject: Re: testing/questions about latest Reiser4
Date: Tue, 13 Apr 2004 10:10:30 -0700
Message-ID: <407C1F06.6080101@namesys.com>
References: <4070E534.9010509@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4070E534.9010509@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: reiserfs-list@namesys.com, vs <vs@thebsh.namesys.com>

Grant Miner wrote:

> Does Reiser4 store stat data in real files, or some special way?

It presents stat data to user space as a file (or via stat()), but below 
the fs interface it stores it in a stat item, which you can think of as 
a compressed format for stat files.

>   Are pseudo files just representation of stat data stored a special 
> way?  Is it possible to do streams/forks with a plugin easily?
>
> I mounted latest Reiser4 snapshot + linux 2.6.4 with acl and xattr 
> options but when I tried "getfattr" I received "operation not supported"?
>
> I'm using Reiser4 as root fs for some days now, and it is great!  Only 
> problem is whenever I run 'make' it always recompiles everything; 
> perhaps this has to do with time stamps?

Probably, talk to vs about it, ok?

>   Oh and fibration is cool :) How do I switch to the other fibration 
> plugins for a directory?
>
>


-- 
Hans

