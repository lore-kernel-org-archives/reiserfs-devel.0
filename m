From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: Expand i_mutex to enclose lookup_one_len
Date: Fri, 1 May 2009 12:56:27 -0700
Message-ID: <20090501125627.e13ff38f.akpm@linux-foundation.org>
References: <49FB1F20.8040400@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49FB1F20.8040400@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, viro@ftp.linux.org.uk, a.beregalov@gmail.com, david@unsolicited.net, "Rafael J. Wysocki" <rjw@sisk.pl>

On Fri, 01 May 2009 12:11:12 -0400
Jeff Mahoney <jeffm@suse.com> wrote:

>  2.6.30-rc3 introduced some sanity checks in the VFS code to avoid NFS
>  bugs by ensuring that lookup_one_len is always called under i_mutex.
> 
>  This patch expands the i_mutex locking to enclose lookup_one_len. This was
>  always required, but not not enforced in the reiserfs code since it
>  does locking around the xattr interactions with the xattr_sem.

cool, so this will fix all those backtraces people have been reporting
coming out of the reiserfs xattr code lately?

>  This is obvious enough, but it survived an overnight 50 thread ACL test.

That sounds a bit pessimistic.  I think I'll s/but/and/ ;)
