From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: reiserfs on Redhat Enterprise Linux
Date: Tue, 5 Oct 2004 18:05:38 +0200
Message-ID: <200410051805.38913.christian.mayrhuber@gmx.net>
References: <1096987891.4297.383.camel@ketil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1096987891.4297.383.camel@ketil>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Tuesday 05 October 2004 16:51, Ketil Froyn wrote:
> Hi,
> 
> I am investigating a migration of a system relying on reiserfs to Redhat
> Enterprise Linux 3. As I understand it, reiserfs is unsupported in
> RHEL3, but is available anyway in a kernel-unsupported package or
> something like that. However, it seems the reiserfs-utils package is not
> available.
> 
> Which version of reiserfsprogs should I use to make sure I have one that
> works for me? For instance, should I always go for the latest one (which
> is 3.6.18 today), or do I need to match reiserfs-utils version to kernel
> version in some fashion?
> 
> Thanks,
> 
> Ketil Froyn
> ketil@froyn.name
> http://ketil.froyn.name/
> 

Go with the latest reiserfsprogs version. It is mostly unrelated to kernel
versions. Newer reiserfsck versions are more mature fixes for features found 
only on recent kernels.

Be aware that RedHat managed to break reiserfs in their kernels in the past.
I don't know if this is still the case with EL3. If you want a commercial 
enterprise distro that supports all major linux filesystems (reiserfs, ext2, 
ext3, xfs, jfs) you'll have to use SuSE Enterprise Server.

-- 
lg, Chris

