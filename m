From: Christoph Hellwig <hch@infradead.org>
Subject: Re: I oppose Chris and Jeff's patch to add an unnecessary additional namespace to ReiserFS
Date: Mon, 26 Apr 2004 20:33:14 +0100
Message-ID: <20040426203314.A6973@infradead.org>
References: <1082750045.12989.199.camel@watt.suse.com> <408D3FEE.1030603@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18233-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <408D3FEE.1030603@namesys.com>; from reiser@namesys.com on Mon, Apr 26, 2004 at 09:59:26AM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Linus Torvalds <torvalds@osdl.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, akpm@osdl.org

On Mon, Apr 26, 2004 at 09:59:26AM -0700, Hans Reiser wrote:
> The xattr namespace offers zero functional advantage over the file 
> namespace.  The use of '.' instead of '/' is idiotic, see the very short 
> paper "The Hideous Name" by Rob Pike  ( www.cs.bell-labs.com/cm/cs/doc/ 
> ) for why mindlessly varying the separators in hierarchical names 
> throughout an OS is a bad idea. 

Hans, where have you been the last three years?  Hiding under a rock?
If Linux wants to support additional attributes and ACLs they better
have a common API for _all_ filesystems.  People have discussed the xattr
issue to death, see the -fsdevel and acl-devel archives.  I haven't
seen you input anywhere, so better shut up now.

If you don't want to suport xattrs and acls at all in your filesystem
that's your business, but adding random new APIs is not.  If you want
your magic files included send them to -fsdevel, including how to
deal with them at the VFS level and using one set of entry points for
them and xattrs.  If not keep on dreaming your pipe dreams and don't
anoy us with your 'research' fantasies.

As for ACLs in v3 that's a decision of the maintainer, currently you're
the formal maintainer, but I don't remember a single patch from you.
Most of the linux 2.6 work has been done by Chris and quite a bit of
work by your employees.  Chris is paid for doing a stable and working
reiserfs variant for SuSE so he seems to be qualified for doing that, to..
