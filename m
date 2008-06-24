From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Tue, 24 Jun 2008 10:58:08 -0400
Message-ID: <48610B80.3020908@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com>    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>    <485E788A.8020802@suse.com>    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>    <485FAF96.40608@suse.com> <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello Jeff,
> - I just interested in the Opensuse 11 or Factory.
> - I do have a build service account.
> - Ive set up a sample project 'Reiser4-experimental' with (home:doiggl)
> 
> I'm stuck on how to do the next bit which is -
> Question: How do I create a derivative package by linking to
> rivers:filesystems/reiser4-kmp ?

In your home project, you can do "link package from other project."

> Questions:
> - So what is the next step I can do ?
> - Do you have a sample spec file I can use to compile a reiser4 kernel ?

No, I don't build entire kernels - just the kernel module package. The
package will just contain
/lib/modules/$VERSION/kernel/fs/reiser4/reiser4.ko. If you want to boot
using reiser4, put the module in your initramfs.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkhhC4AACgkQLPWxlyuTD7I33gCfcP1oIyVdPK5YfoAto/I7QdDF
k8UAn29i5OMG7STA4sjJk7wa9QO5wJCm
=dF66
-----END PGP SIGNATURE-----
