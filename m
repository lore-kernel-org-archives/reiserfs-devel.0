From: Chris Mason <mason@suse.com>
Subject: Re: OOPS-ERRORS
Date: Tue, 06 Apr 2004 08:46:53 -0400
Message-ID: <1081255613.4977.89.camel@watt.suse.com>
References: <200404051400.42345.michael@corp.mercuryin.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404051400.42345.michael@corp.mercuryin.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Schwietering <michael@corp.mercuryin.es>
Cc: reiserfs-list@namesys.com

On Mon, 2004-04-05 at 08:00, Michael Schwietering wrote:
> I get this on reiserfs, and sync does not come back again... Anyone has ideas? 
> Or do you need more specific infos?
> 
> Unable to handle kernel paging request at virtual address 00100000
                                                           ^^^^^^^^^^
> c1a1140c
> *pde = 00000000
> Oops: 0002 2.4.21-198-default #1 Thu Mar 11 17:43:56 UTC 2004

Looks like a suse kernel.  This looks like a single bit flip in ram,
you're probably on this line:
    
    acl = inode->u.reiserfs_i.i_acl_default;
    if (acl && !IS_ERR (acl))
        posix_acl_release (acl);
    inode->u.reiserfs_i.i_acl_default = NULL;

acl is supposed to be zero but a ram error made it 00100000 instead. 
You should run memtest86 on the machine for at least 8 hours, it's
included with suse and you can boot directly into it.

-chris


