From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Mon, 23 Jun 2008 10:13:42 -0400
Message-ID: <485FAF96.40608@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com>    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>    <485E788A.8020802@suse.com> <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Jeff wrote,
>> I can do that sometime this week. I already have it set up a little bit,
>> I just haven't been tending to it. Do other distributions have something
>> similar to our Kernel Module Packages? Our kernels have the core support
>> needed for reiser4, but can generate external module packages to install
>>  reiser4 itself.
>>
>> - -Jeff
> 
> Thanks for letting me/us know,
> Your doing good valuable work for many, let us know of the progress of the
>  reiser4-enabled/installable kernel in the Opensuse service. I'm
> interested in doing some tests if that helps.

I only really have access to the openSUSE flavors. I'm glad to help with
this, but I'm not really looking to install other distributions to keep
them updated.

If you're interested in seeing a particular distribution supported,
please set up a build service account and create a derivative package by
 linking to drivers:filesystems/reiser4-kmp. Once you've gotten it
working on your distribution, let me know, and I'll pull the changes
into the drivers:filesystems project.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkhfr5YACgkQLPWxlyuTD7KSFwCeLkDKbSDlmyvHyE4OPrsWswQE
eTQAnRmDlU3ZQV9kd8TPXTPHhHwLRm2Z
=05fI
-----END PGP SIGNATURE-----
