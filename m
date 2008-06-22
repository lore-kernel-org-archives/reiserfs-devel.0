From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Sun, 22 Jun 2008 12:06:34 -0400
Message-ID: <485E788A.8020802@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com> <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> I tend to agree with Jeff on this one, and I would like it on the opensuse
> build service too.
> That would allow more people to access/use/test/try out a built kernel
> with those reiser4 features provided, and the build process can be
> automated as I understand and patches can go in as needed.
> Opensuse build service [for those that do not know] is located at
> https://build.opensuse.org/
> I have not got the expertise to put it on the Opensuse service myself.
> 
> Is there anyone else willing to have a go to make a Reiser4 based kernel
> on the Opensuse build service ?

I can do that sometime this week. I already have it set up a little bit,
I just haven't been tending to it. Do other distributions have something
similar to our Kernel Module Packages? Our kernels have the core support
needed for reiser4, but can generate external module packages to install
 reiser4 itself.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkheeIoACgkQLPWxlyuTD7K5MACfYpEEYK4hwlUJjnZBOv1BwE/9
ZVkAnjnsVNAdPjCUtUavCJMBlan0LpUg
=D2Qj
-----END PGP SIGNATURE-----
