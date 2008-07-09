From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Wed, 09 Jul 2008 11:11:22 -0400
Message-ID: <4874D51A.7020909@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com>    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>    <485E788A.8020802@suse.com>    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>    <485FAF96.40608@suse.com>    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>    <48610B80.3020908@suse.com>    <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>    <48626E1B.6070604@suse.com>    <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>    <4866575D.1000305@suse.com>    <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au>    <4867DC31.2030702@suse.com>    <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au>    <4868F3C8.2090006@suse.com> <
 20253.202.168.22.19.1215615647.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20253.202.168.22.19.1215615647.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> I get the following error message when I try to install
> reiser4-kmp-default via smart.
> "Can't install reiser4-kmp-default-0.1_2.6.25.7_1.5-23.1@x86_64: no
> package provides kernel(default:vmlinux) = 3db9af7df68368aa"
> 
> I got the file from
> http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_11.0/x86_64/
> 
> What is already installed:
> # rpm -qa | grep -i kernel
> kernel-syms-2.6.25.5-1.1
> nfs-kernel-server-1.1.2-9
> kernel-default-2.6.25.5-1.1
> kernel-xen-2.6.25.5-1.1
> kernel-source-2.6.25.5-1.1
> linux-kernel-headers-2.6.25-8.1
> 
> Question:
> What else do I need to install/change so I can install the reiser4 module ?.
> Thanks Glenn

Strange. That's not the file I see in that link. I see
reiser4-kmp-default-0.1_2.6.25.5_1.1-22.1.x86_64.rpm, which should match
your installation.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkh01RoACgkQLPWxlyuTD7IplwCeObhScfub1z9/7fHHa56zQAPm
87wAn1qS8UQwo2WplG9BUGyuGXeD/kSl
=dRYP
-----END PGP SIGNATURE-----
