From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: new v3 2.6.4  logging/xattr patches
Date: Fri, 19 Mar 2004 13:42:51 +0100
Message-ID: <200403191342.51144.christian.mayrhuber@gmx.net>
References: <1079679539.11055.101.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17318-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079679539.11055.101.camel@watt.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Friday 19 March 2004 07:58, Chris Mason wrote:
> Hello everyone,
>
> I've just uploaded all the reiserfs patches from the suse 2.6 kernel to:
>
> ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.4
>
> (they should also apply to 2.6.5-rc1 and 2.6.5-rc1-mm2)
>
> These include:
> Latency fixes
> Logging performance fixes
> data=ordered support
> quota support
> xattrs and acls from Jeff Mahoney
>
> and a few random bug fixes.  There's a README file in the directory with
> a some more details.
>
> The names of the files no longer start with numbers to help you figure
> out the order the patches get applied.  The directory includes a file
> called series that has a list of all the patches in the proper order.
>
> There are various shell tricks to apply things in order.  Or a few
> different patch management tools that understand a series file.  I use
> quilt (http://savannah.nongnu.org/projects/quilt/) which is very nice.

The patches are looking good so far.

Especially the latency has improved. I only can make xmms stutter when
using bonnie+ plus some other io intense task.

ACL's seem to work fine, too.

-- 
lg, Chris
