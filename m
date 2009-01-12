From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: which kernel needed for      reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64.rpm
Date: Mon, 12 Jan 2009 11:21:41 -0500
Message-ID: <496B6E15.2020500@suse.com>
References: <21073.202.168.22.19.1231754587.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <21073.202.168.22.19.1231754587.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Question:
> Which kernel do I need to use for:
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64.rpm
> source:
> -http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64.rpm
> 
> 
> # rpm -ivhU reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64.rpm
> warning: reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64.rpm: Header V3
> DSA signature: NOKEY, key ID 74de2879
> error: Failed dependencies:
>         kernel(default:kernel) = 037fe4d3772ab0fb is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:mm) = 7b0d5e54461ff41b is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:vmlinux) = 6535f6c0489f55c0 is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:arch_x86_kernel) = 104ad34f4772270c is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:fs) = 8a2ea2f7b702a737 is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:fs_debugfs) = 33cc6cf4c644fb99 is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:block) = 8236e5907394d933 is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
>         kernel(default:lib) = 3da5922757d6e24e is needed by
> reiser4-kmp-default-0.1_2.6.27.10_1-27.8.x86_64
> 
> - Kernel currently used is as follows:
> 
> # uname -a
> Linux test 2.6.27.7-9-default #1 SMP 2008-12-04 18:10:04 +0100 x86_64
> x86_64 x86_64 GNU/Linux
> 
> # rpm -qa | grep -i kernel | sort
> kernel-default-2.6.27.7-9.1
> kernel-default-base-2.6.27.7-9.1
> kernel-default-extra-2.6.27.7-9.1

If you're using Factory, then you'll need to update your kernel to
2.6.27.10. If you're not using Factory, don't use the Factory repository
for the reiser4 module.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAklrbhUACgkQLPWxlyuTD7JeQwCaAvsXpfH4fpkO4JqnNq3zVM7Q
L6gAn290WDVXhOuLbPHeqUZzyc544BCU
=ci6a
-----END PGP SIGNATURE-----
