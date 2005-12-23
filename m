From: Peter van Hardenberg <pvh@uvic.ca>
Subject: Re: reiser4: writing plugins
Date: Fri, 23 Dec 2005 00:50:09 -0800
Message-ID: <200512230050.09477.pvh@uvic.ca>
References: <1134763128.18089.10.camel@localhost.localdomain>
 <b14e81f00512221624q67927794ya1e813fcecedf3dd@mail.gmail.com>
 <1135301844.18109.12.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1135301844.18109.12.camel@gentoo>
Content-disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On December 22, 2005 05:37 pm, Jake Maciejewski wrote:
> Being able to use "df" or "zfs list" instead of "du" is a side effect.
> The real reason for the "unusual abstraction" is to have finer grained
> control over quotas, reservations, snapshots, checksums, compression,
> NFS sharing, etc.
>

It seems to me that although it could be very valuable in certain situations, 
for general purpose consumption the performance hit would be too painful. If 
the data isn't kept up-to-date, it's not a lot better than not having it. You 
would always have to check if a deep child-directory is out of date before 
giving quota permission, which means still paying for those disk reads 
anyway. On the other hand, if the information is always kept correct, you're 
paying for a lot more writes and reads every time you touch a file...

Also, the speed benefits for moving this in-kernel are not significant. The 
kernel also needs to essentially do a "du -s" -- the information is kept in 
the same place and has to be calculated the same way, which is by opening 
each file's inode and reading the file-size field.

I wonder how Reiser4 would fare performance-wise on that kind of operation. 
The tree-based nature of the storage makes lookup() very fast, but I have 
noticed that the "seekable hashed dir" is described in the comments as a hack 
to work around the fact that real directories aren't actually seekable. This 
is why B-tree indexed databases maintain leafs in strict increasing order, 
which can cost a TON to maintain under certain kinds of load.

-pvh

-- 
Peter van Hardenberg (pvh@pvh.ca)
Victoria, BC, Canada
