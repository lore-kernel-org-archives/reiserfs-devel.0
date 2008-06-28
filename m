From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Sat, 28 Jun 2008 11:23:09 -0400
Message-ID: <4866575D.1000305@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com>    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>    <485E788A.8020802@suse.com>    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>    <485FAF96.40608@suse.com>    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>    <48610B80.3020908@suse.com>    <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>    <48626E1B.6070604@suse.com> <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> I'm trying to install reiser4-0.1-20.2@x86_64 (sourced from
> http://download.opensuse.org/repositories/home:/jeff_mahoney/openSUSE_Factory/x86_64/)
> with smart package manager, BUT reiser4-0.1-20.2@x86_64 is missing access
> to a package.
> 
> The Error Message (from smart package manager) is:
> Can't install reiser4-0.1-20.2@x86_64: no package provides
> kernel(xen:lib_lzo) = 65ae9dc25d9919ce
> 
> Question:
> Where is the repository so I can install a package which provides
> kernel(xen:lib_lzo) = 65ae9dc25d9919ce ?

Are you running the Factory kernel or openSUSE 11? This is a sanity
check to ensure that symbols that modules need are met by the kernel.
It's to avoid breakage when you update the kernel and don't have
compatible modules.

- -Jeff


> Jeff wrote:
>> That RPM, no, since I didn't add the 11.0 repository to the project
>> until just now. The build is scheduled, though.
>>
>> Once that completes, you can use that RPM to do exactly what you
>> describe. It will be installed and loaded as if it were part of the
>> regular kernel package. You don't even need to reboot, just load the
>> module and go.
>>
>> - -Jeff
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkhmV10ACgkQLPWxlyuTD7K8oQCfSqYjUYnxK0rwMvA9v+ATG4rr
v2gAn3xRz6t2RtTDeZkXIUIMbkYP4UPY
=ws33
-----END PGP SIGNATURE-----
