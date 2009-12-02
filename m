From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4: newbie help needed?
Date: Wed, 02 Dec 2009 10:21:18 +0100
Message-ID: <4B16318E.7010504@gmail.com>
References: <20091202192143.48ece851.buchner.johannes@gmx.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753253AbZLBJWk@vger.kernel.org>
In-Reply-To: <20091202192143.48ece851.buchner.johannes@gmx.at>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Johannes Buchner <buchner.johannes@gmx.at>
Cc: reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org

Johannes Buchner wrote:
> Hi!
>
> I am possibly interested in helping out. Who is currently working on
> reiser4?

Nobody.
Because there is no bugreports.

>  I took a look at the TODO lists, are there any simple tasks to
> do for newbies?
>   

If you mean the "todo for inclusion", then no.

Reiser4 has only one technical issue. It can
be resolved only by very experienced people.

> Also, where is the latest code development going on?
>   

in -mm

> I also believe that on 'sync', reiser4 currently does absolutely
> nothing.

this is not good: a file system should respond on sync (1).

>  The comment in reiser4_sync_inodes says reiser4 does its own
> flush elsewhere. Should this be different?
>   

you might want to ask such question _before_ sending patches to akpm. 

BTW excellent comment, what is not clear?

/**
 * reiser4_sync_inodes - sync_inodes of super operations
 * @super:
 * @wbc:
 *
 * This method is called by background and non-backgound writeback. 
Reiser4's
 * implementation uses generic_sync_sb_inodes to call reiser4_writepages for
 * each of dirty inodes. Reiser4_writepages handles pages dirtied via shared
 * mapping - dirty pages get into atoms. Writeout is called to flush some
 * atoms.
 */
 
Edward.
