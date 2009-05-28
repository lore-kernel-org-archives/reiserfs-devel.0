From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Reiser4 module and 2.6.29-x-default kernel
Date: Wed, 27 May 2009 23:10:44 -0400
Message-ID: <4A1E00B4.1000706@suse.com>
References: <13991.202.168.22.19.1242997798.squirrel@webmail.velocity.net.au>    <4A16AAA5.9040105@suse.com> <4A16C922.1090700@gmail.com>    <4A16CF1B.30509@suse.com> <11576.202.168.22.19.1243470735.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <11576.202.168.22.19.1243470735.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> Any progress on the Reiser4 module and 2.6.29-x-default kernel ?
> Is this the one that will get updated at some point (see link)  ?
> http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_Factory/x86_64/
> Glenn

Yep, that's the one. Sorry, I've been swamped lately so it may be a while.

- -Jeff


> Edward Shishkin wrote:
>> Jeff Mahoney wrote:
>> Edward - What's the reasoning behind it?
>>
>>> The reason is to reduce a cost of maintenance.
>>> Since reiser4_set_page_internal() is not in vfs library
>>> bad things are bound to happen. For example, set_page_dirty()
>>> and friends were modified by vfs folks to update dirty pages
>>> accounting and of course nobody knew that there are other
>>> "friends" in reiser4 code, so I have spent a lot of time to figure
>>> out why oom kills processes of dbench 190...
>>  Has it been submitted upstream
>> yet?
>>
>>> Nup, this is in -mm
> 
> Ok, if that's the goal, I can just track it when I update the reiser4 patch.
> - -Jeff
> 
> 


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkoeALMACgkQLPWxlyuTD7LFjwCfVNrfHikX22XkENz9Q2dL1btJ
GmkAn3XJFypMMdSdJN9Z4Vx3aY0H5zFZ
=H2EI
-----END PGP SIGNATURE-----
