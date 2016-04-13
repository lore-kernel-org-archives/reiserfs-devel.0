From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: [PATCH] xattr: Export xattr_resolve_name
Date: Wed, 13 Apr 2016 19:20:26 +0100
Message-ID: <20160413182026.GR25498@ZenIV.linux.org.uk>
References: <1460552239-30041-1-git-send-email-agruenba@redhat.com>
 <1460562034-31461-1-git-send-email-agruenba@redhat.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460562034-31461-1-git-send-email-agruenba@redhat.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>

On Wed, Apr 13, 2016 at 05:40:34PM +0200, Andreas Gruenbacher wrote:
> Export xattr_resolve_name and make it easier to use by filesystems.
> Use it to remove reiserfs's own copy of the same functionality.

Nah - I've switched that sucker to generic_*xattr() already.  See
#work.xattr for the current state (commit 79a628d14 in there, should
propagate in a few).  Sorry, should've pushed that last week...
