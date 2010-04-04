From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfs + acl corruption
Date: Sun, 4 Apr 2010 13:38:16 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1004041324340.29272@bogon.housecafe.de>
References: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <54cce25c1003280829q2a173c91p55bc3297a3163452@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Gatti <marco.gatti@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Sun, 28 Mar 2010 at 17:29, Marco Gatti wrote:
> To reproduce the issue test it this way (using bash) in a separate
> disk, partition or virtual disk using loopback:

Thanks for sharing this testcase. One question though: which version of 
"acl" are you using, my setfacl 2.2.49 doesn't understand "-R".

> REISERFS warning (device sdc1): jdm-20002 reiserfs_xattr_get: Invalid
> hash for xattr (system.posix_acl_access) associated with [2 848 0x0
> SD]

I've reported something similar a while back for user.* ACLs, it looks 
like it's hitting the same issue: https://bugzilla.kernel.org/show_bug.cgi?id=14826

> then wierd things start to happen and the more you use this filesystem
> the more you disrupt it: this leads to a corrupted filesystem!
> If you try with less files, let's say 50000, no corruption or error
> occour to me.

I just tested again (with a variant of your script) and I was able to 
create 100000 files, set ACLs on each of them and then remove this very
ACL from each file. However, using "setfacl -b" (removing *all* ACLs from
a file) it instantly returned with:

  setfacl: ./1: Input/output error

And in the syslog:

REISERFS warning (device md0): jdm-20002 reiserfs_xattr_get: Invalid hash for xattr (system.posix_acl_access) associated with [2 5 0x0 SD]

See: http://nerdbynature.de/bits/2.6.34-rc2/reiserfs/

However, this does not happen on a freshly created reiserfs with e.g. just 
one file on it, I'm still figuring out when exactly this happens.

Thanks,
Christian.
-- 
BOFH excuse #308:

CD-ROM server needs recalibration
