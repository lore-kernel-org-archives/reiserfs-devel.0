From: Vadim <vadim_t@teleline.es>
Subject: Re: vs-5150: search_by_key: invalid format found in block 30690. Fsck?
Date: Mon, 18 Aug 2003 10:00:16 +0200
Message-ID: <200308181000.23244.vadim_t@teleline.es>
References: <200308151939.03324.vadim_t@teleline.es> <20030818060852.GB16183@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15358-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030818060852.GB16183@namesys.com>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Monday 18 August 2003 08:08, Oleg Drokin wrote:
> Hello!
>
> On Fri, Aug 15, 2003 at 07:39:02PM +0200, Vadim wrote:
> > I just noticed quite a lot of those:
> > vs-5150: search_by_key: invalid format found in block 9170.
> > Fsck? vs-13070: reiserfs_read_inode2: i/o failure occurred
> > trying to find stat data of [3614 3618 0x0 SD]
> > is_tree_node: node level 65448 does not match to the
> > expected one 1
> > vs-5150: search_by_key: invalid format found in block 14568.
> > Fsck?
>
> Some of the blocks are got filled with garbage for some
> (unknown) reason.
>
> > The disk seems to be good, no errors, kernel is 2.4.21 with
> > LVM 1.0.7.
> > Why does this error happen? Is it a bug fixed in a later
> > version?
>
> Well, I am not sure there is a bug.
> What was happenning before you started to get those messsages?
> Were there any unexpected shutdowns and you do not have write
> cache disabled in your harddrives or something like that?
Yeah, there was a quite bad crash once. I tried using a Gentoo=20
kernel which seemed to have too many patches. Crashed quite=20
horribly, with lots of oopses scrolling by the screen. I ran=20
reiserfsck 3.6.11, and it found no errors, though.

Now, write cache sounds like a possibility. hdparm says:
        Enabled Supported:
           *    NOP cmd
           *    READ BUFFER cmd
           *    WRITE BUFFER cmd
           *    Host Protected Area feature set
           *    Look-ahead
           *    Write cache
           *    Power Management feature set
                Security Mode feature set
           *    SMART feature set
           *    Mandatory FLUSH CACHE command
           *    Automatic Acoustic Management feature set
                SET MAX security extension
           *    DOWNLOAD MICROCODE cmd

Excuse me if this is a stupid question, but hdparm doesn't seem=20
to have any arguments to disable write cache. How do I do that?

I did know ReiserFS is supposed to be used without write cache,=20
but for some reason I thought that my old disk probably wouldn't=20
have one. Perhaps ReiserFS should automatically disable write=20
cache on the disks it's used on?

> We merged a patch that does just this in 2.4.22-pre3
Ok, thanks

>
> Bye,
>     Oleg

Thanks for the help :-)
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQE/QIeWvCkUtBccqkoRAvFZAJ4s7lNIjVXDnxdUeUdIjH3IE+FoVACgtdTe
nGYed21uf5zXCO309xa/0lU=3D
=3DEWmq
=2D----END PGP SIGNATURE-----

