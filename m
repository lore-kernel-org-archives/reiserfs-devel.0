From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: ACL Support
Date: Thu, 1 Apr 2004 19:11:28 +0200
Message-ID: <200404011911.28771.christian.mayrhuber@gmx.net>
References: <200404011650.IAA23518@amber.he.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17649-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404011650.IAA23518@amber.he.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Mike Young <myoung@wildernessvoice.com>

On Thursday 01 April 2004 18:50, Mike Young wrote:
> Hi All,
>
>
>
> I've been trying to find out information on ACL support in Reiserfs, but
> haven't had much luck finding anything but a few exchanges here and there.
> There are numerous capabilities within Reiserfs, which I'd like to take
> advantage of, but this issue of ACL support is only growing.  The problem
> actually consists of trying to store ACLs in a Windows environment.  The
> number of ACEs can be quite sufficient that it can require multiple inodes
> to store everything.  As an example, XFS has a maximum inode size of 2K,
> which is normally fairly sufficient.  However, if I wish to support all of
> the Windows ACL set, then 2K is inadequate and 4K would actually be better.
> Again, I can use multiple inodes, but this has a significant affect on
> performance.  The bottom line is that I love Linux as a server and believe
> I should be able to seamlessly support a Windows client.  I just don't want
> to be as slow as a Windows server.
>
>
>
> With that in mind, can someone give me a quick synopsis of how ACLs are
> handled in Reiserfs v3 and v4?  Also, if there is a url to the information
> I'd appreciate a pointer to it.  Admittedly, I haven't read the man pages.
> So, if it's all there, please forgive me.
>
>
>
> Many thanks,
>
>
>
> Mike

Status of acl's under Linux (start with that, its very informative):
http://www.suse.de/~agruen/acl/linux-acls/

For ReiserfsV3, you have 2 possibilites:
1) use the SuSE distribution, it has ACL's for Reiserfs per default.
2) patch the linux kernel
For kernel 2.6; experimental
  ftp://ftp.suse.com/pub/people/mason/patches/data-logging/experimental/
For kernel 2.4
  http://acl.bestbits.at
  +
  ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/v2.4/

For the capabilities of Reiser4 read: http://www.namesys.com/

Notes:
* Reiser4 is incompatible with Reiser3.
* I don't know if ReiserfsV3 ACL's will ever be included in the official Linux
kernel. SuSE is supporting this stuff.

-- 
lg, Chris

