From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: data corruption on reiserfs
Date: Thu, 23 Dec 2004 13:18:50 +0100
Message-ID: <200412231318.50712.christian.mayrhuber@gmx.net>
References: <000001c4e8a3$39dc03d0$9e61a8c0@pcp40702>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22890-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <000001c4e8a3$39dc03d0$9e61a8c0@pcp40702>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sujeet.kumar@patni.com, reiserfs-list@namesys.com

On Thursday 23 December 2004 04:55, Sujeet Kumar wrote:
> patni Stationery
> 
> 
> Hi ,
> 
> My log file reported data corruption on reiserfs filesystem.
> 
> The reiserfs version used by log file was 3.6.2-41 where the reported
> 
> defect took place . I ran it again on reiserfs version 3.6.9-33 , but this
> time it ran all fine.
> 
> So can u tell me what all fixes have taken place between 3.6.2-41 and
> 3.6.9-33 which could have
> 
> resolved data corruption issues if any.

The changelog of the reiserfs filesystem itself can be found at
http://www.kernel.org/pub/linux/kernel in the various
kernel changelogs.
If you are using some distribution specific vendor kernel you will have 
to look at their changelogs.

The version numbers above indicate to be the one of the reiserfsprogs
utility programs. Usually their changelog can be found in
/usr/share/doc/reiserfsprogs/.

The versions for reiserfs usage are:
- Official Kernel 2.4.24 and later
- for vendor kernels ask the vendor
- latest reiserfsprogs, currently 3.6.19

Hope this helps.

-- 
lg, Chris
