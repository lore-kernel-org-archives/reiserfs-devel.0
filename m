From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: v3 experimental data=ordered and logging speedups for 2.6.1
Date: Mon, 19 Jan 2004 23:53:03 +0100
Message-ID: <200401192353.03670.Dieter.Nuetzel@hamburg.de>
References: <1074530725.29546.178.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16576-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074530725.29546.178.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, green@linuxhacker.ru, Gerd Knorr <kraxel@suse.de>, Jeff Mahoney <jeffm@suse.com>

Am Montag, 19. Januar 2004 17:45 schrieb Chris Mason:
> Hello everyone,
>
> I've got most of data=3Dordered finished, there are a few paths like
> writepage and O_DIRECT that need tweaking.  Thanks to Oleg's file_write
> work in 2.6.x, the data=3Djournal patch is much cleaner than 2.4, it is
> almost done but not included in the bunch of patches I just uploaded to
> ftp.suse.com.  Oleg is cc'd in case he wants to look over the changes to
> reiserfs_file_write in reiserfs-jh-2.
>
> The code has survived a weekend of moderate load, but you still want it
> very far away from production servers.  I'm headed off to linux world in
> NYC for the rest of the week, and I wanted to post this for review and
> the few brave souls out there who might want to give it a try.
>
> ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.1
>
> The README:
>
> Experimental reiserfs data=3Dordered and logging speedups against 2.6.1

Success.

I applied them against the SuSE 9.0 2.6.1-0 kernel from Gerd.

> Apply these in order:
>
> 01-reiserfs-journal-writer
> removes old stale debugging code, very safe
>
> 02-reiserfs-nesting
> Adds support for nested transactions in reiserfs, needed for the quota
> code, and ported from 2.4.x by Jeff Mahoney
>
> 03-reiserfs-iosize
> Changes reiserfs to tell userspace the default io size is 4k.  Works arou=
nd
> a bug in bdb hit by rpm users

02 and 03 where already applied.

So NOT need, here.

> 04-reiserfs-balance_dirty
> Changes reiserfs_file_write to throttle writers the way the rest of linux
> does.  This patch has already been sent for inclusion, it should get in
> soon

Goes in clean.

> 05-reiserfs-logging
> Logging speedups for small transactions and fsync heavy applications.  Mo=
st
> experimental patch of the bunch, since it changes the way the log does
> metadata writeback
>
> 06-reiserfs-jh-2
> Adds data=3Dordered support, along with a journal header attached to
> the buffer head.  This allows for more efficient data=3Dordered support
> than I had in 2.4.x.

05 and 06 needed some handwork 'cause the SuSE kernel inclues xattrs and po=
six=20
acl's but nothing special.

An EXPORT was missing in linux/fs/buffer.c to compile ReiserFS 3.x.x as mod=
ul=20
(inode.c, unresolved symbol):

[-]
int try_to_release_page(struct page *page, int gfp_mask)
{
        struct address_space * const mapping =3D page->mapping;

        if (!PageLocked(page))
                BUG();
        if (PageWriteback(page))
                return 0;

        if (mapping && mapping->a_ops->releasepage)
                return mapping->a_ops->releasepage(page, gfp_mask);
        return try_to_free_buffers(page);
}
EXPORT_SYMBOL(try_to_release_page);
[-]

Up and running.

Greetings,
	Dieter

BTW Gerd "released" 2.6.1-1 already...


=2D-=20
Dieter N=FCtzel
@home: <Dieter.Nuetzel () hamburg ! de>
