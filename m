From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Wed, 25 Jun 2008 12:11:07 -0400
Message-ID: <48626E1B.6070604@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com>    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>    <485E788A.8020802@suse.com>    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>    <485FAF96.40608@suse.com>    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>    <48610B80.3020908@suse.com> <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Questions:
> -If I install rpm reiser4-kmp-0.1-18.2.x86_64.rpm in Opensuse 11,
> will it install /lib/modules/$VERSION/kernel/fs/reiser4/reiser4.ko in the
> correct place ?
> - Would I be able to restart the pc and run Reiser4 commands to format and
> set up a Reiser4 partition and use that ?

That RPM, no, since I didn't add the 11.0 repository to the project
until just now. The build is scheduled, though.

Once that completes, you can use that RPM to do exactly what you
describe. It will be installed and loaded as if it were part of the
regular kernel package. You don't even need to reboot, just load the
module and go.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkhibhsACgkQLPWxlyuTD7J+UwCfX696IYJTjtYurOrjMJXtZTLG
Sw0Aniqmu0us9S9SGioakFsB9Cwbe6fP
=bP7L
-----END PGP SIGNATURE-----
