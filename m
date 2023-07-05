From: Jeff Layton <jlayton@kernel.org>
Subject: Re: [PATCH v2 00/89] fs: new accessors for inode->i_ctime
Date: Wed, 05 Jul 2023 17:57:46 -0400
Message-ID: <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel__49422.3166418792$1688594307$gmane$org@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688594285;
        bh=JlErKO6ytzrETfJF10RJ07fFyXoxaUt5+ApLH28Eksk=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=ox9UCUOCrMoArAN2UWINeG7QvaXvn/rW6VX3bNg/iJYSvDmftw/A4NpK1NYTdX1NF
         gVgMoqKe4Wy+YcaUy/Dyaq00MJKT04z3nDqfKuQM4SFZsRbASIDWrt/F1bfZ/Sk9IA
         IlCUdLT6kxy2jL8SF3nViHjnNHXzs55XV4F3VEYsgVxzqxUcCiE9JSR2Z8IfDFpjTE
         aAs5GOvVMsx8Eye0YwI4OGGuVtit0IDRpyx+/wLT78cg1mMMLjGSPd8pWmdQxt1+Az
         UpvwRSPwHQIIqvl4d9BIKKNlv96fZDtb/zFnJIHpMrXV8Xk+YsvNrTXbO+lqW0MMpc
         fXzU6mvU9YhKA==
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, brauner@kernel.org, cmllamas@google.com, surenb@google.com, dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com, dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com, viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org, salah.triki@gmail.com, aivazian.tigran@gmail.com, ebiederm@xmission.com, kees

On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> v2:
> - prepend patches to add missing ctime updates
> - add simple_rename_timestamp helper function
> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> - drop individual inode_ctime_set_{sec,nsec} helpers
>=20
> I've been working on a patchset to change how the inode->i_ctime is
> accessed in order to give us conditional, high-res timestamps for the
> ctime and mtime. struct timespec64 has unused bits in it that we can use
> to implement this. In order to do that however, we need to wrap all
> accesses of inode->i_ctime to ensure that bits used as flags are
> appropriately handled.
>=20
> The patchset starts with reposts of some missing ctime updates that I
> spotted in the tree. It then adds a new helper function for updating the
> timestamp after a successful rename, and new ctime accessor
> infrastructure.
>=20
> The bulk of the patchset is individual conversions of different
> subsysteme to use the new infrastructure. Finally, the patchset renames
> the i_ctime field to __i_ctime to help ensure that I didn't miss
> anything.
>=20
> This should apply cleanly to linux-next as of this morning.
>=20
> Most of this conversion was done via 5 different coccinelle scripts, run
> in succession, with a large swath of by-hand conversions to clean up the
> remainder.
>=20

A couple of other things I should note:

If you sent me an Acked-by or Reviewed-by in the previous set, then I
tried to keep it on the patch here, since the respun patches are mostly
just renaming stuff from v1. Let me know if I've missed any.

I've also pushed the pile to my tree as this tag:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/tag/?=
h=3Dctime.20230705

In case that's easier to work with.

Cheers,
--=20
Jeff Layton <jlayton@kernel.org>
