From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Subject: Re: [patch 0/4] reiserfs xattr fixups
Date: Sun, 10 May 2009 23:34:13 +0200
Message-ID: <4A074855.8070008@s5r6.in-berlin.de>
References: <20090510200535.893737918@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090510200535.893737918@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Al Viro <viro@ftp.linux.org.uk>, reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Jeff Mahoney wrote:
>  Here are my remaining patches for reiserfs in 2.6.30:
> 
>  - reiserfs-xattr-fixup: Cleans up some ifdefs
>  - reiserfs-xattr-root-fixup: Fixes an oops on open_xa_dir with
> 			      CONFIG_REISERFS_FS_XATTR=n
>  - reiserfs-xattrs-disabled-perms: Fixes warnings on delete with
> 			      CONFIG_REISERFS_FS_XATTR=n (bko#13122)
>  - reiserfs-expose-privroot: Adds a -oexpose_privroot that will allow
> 			     access to the privroot.

I rebooted into v2.6.30-rc5-96-ga4d7749 + these four patches now.
Looks good so far.
-- 
Stefan Richter
-=====-=-=== -=-= -==-=
http://arcgraph.de/sr/
