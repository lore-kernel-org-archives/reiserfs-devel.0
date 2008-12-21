From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Xattrs in reiser4...
Date: Sun, 21 Dec 2008 16:41:53 +0300
Message-ID: <494E47A1.5030605@gmail.com>
References: <4943B62E.40706@gmail.com>	 <be789c640812171351k7e2dee9cg50a3803caca231d8@mail.gmail.com>	 <494988BB.4020908@gmail.com> <be789c640812180153t13f8e9bcn16565fdbc71c1729@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <be789c640812180153t13f8e9bcn16565fdbc71c1729@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Daniel Horne <daniel.horne@gmail.com>
Cc: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Daniel Horne wrote:
> 2008/12/17 Edward Shishkin <edward.shishkin@gmail.com>
>
>
>     Can you say more about this?
>     Do you know an application that requires xattrs of length longer then
>     4000 bytes?
>
>
> User xattrs. What I'm thinking is that if you can set arbitrary
> key:value pairs (which, of course, you can - through setfattr) the
> "high bound"  number of xattrs per inode, and therefore total data
> stored is pretty much unlimited.
>   

Yes, there is no doubt, that somebody will want to shove
a gigabyte of information by using setxattr(2) :)
The question is "whether it is really needed?"

Well, I think, we can implement xattrs with the mentioned
limit for now. If it won't be enough for serious applications
(it will be clear before xattrs release), then we'll think about
new stat-data plugin.

Edward.

>
>     >
>     > So, the temptation is to have something similar to the file plugin for
>     > individual xattrs, with the xattr functions on a vfs file acting like
>     > a directory of xattr-files. There'd be a large number of small objects
>     > in the tree, of course, but that's a situation I understand R4 handles
>     > well..
>     >
>     > So, what do you think?
>
>     Let's forget about file-as-dir stuff. All what we need is a new file plugin
>     with non-NULL methods, responsible for work with xattrs , and (maybe)
>     a new stat-data plugin, which can handle stat-data items of arbitrary
>     length.
>
>
> Agreed.
>
> --
> DH
>
>   

