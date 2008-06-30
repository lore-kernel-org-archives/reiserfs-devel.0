From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Nightly Builds
Date: Mon, 30 Jun 2008 10:55:04 -0400
Message-ID: <4868F3C8.2090006@suse.com>
References: <66CE03FC-0D5A-4837-A2F5-1D00833EE70E@jasonandannette.us>    <485C0BA9.5090902@suse.com>    <28097.202.168.22.19.1214146293.squirrel@webmail.velocity.net.au>    <485E788A.8020802@suse.com>    <15568.202.168.22.19.1214194598.squirrel@webmail.velocity.net.au>    <485FAF96.40608@suse.com>    <27533.202.168.22.19.1214318654.squirrel@webmail.velocity.net.au>    <48610B80.3020908@suse.com>    <15208.202.168.22.19.1214398774.squirrel@webmail.velocity.net.au>    <48626E1B.6070604@suse.com>    <23129.202.168.22.19.1214638448.squirrel@webmail.velocity.net.au>    <4866575D.1000305@suse.com>    <14971.202.168.22.19.1214748124.squirrel@webmail.velocity.net.au>    <4867DC31.2030702@suse.com> <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <23784.202.168.22.19.1214826598.squirrel@webmail.velocity.net.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

doiggl@velocitynet.com.au wrote:
> Hello,
> I Installed the file (reiser4-0.1-23.1.x86_64.rpm) but it has a problem it
> contains no files that I can see and it was only 1858 bytes long.

That's not what you want. That's an artifact of the KMP process. You
want reiser4-kmp-<flavor>

- -Jeff


> # rpm -qlp reiser4-0.1-23.1.x86_64.rpm
> warning: reiser4-0.1-23.1.x86_64.rpm: Header V3 DSA signature: NOKEY, key
> ID 29ca2faf
> (contains no files)
> 
> # rpm -qa | grep -i reiser4
> reiser4progs-1.0.6-3.5
> reiser4-0.1-23.1
> 
> # rpm -qa | grep -i kernel
> kernel-syms-2.6.25.5-1.1
> nfs-kernel-server-1.1.2-9
> kernel-default-2.6.25.5-1.1
> kernel-xen-2.6.25.5-1.1
> kernel-source-2.6.25.5-1.1
> linux-kernel-headers-2.6.25-8.1
> 
> Jeff wrote:
>> No, you should be all set now, just download the same file you did
>> before. The problem was that I was trying to do double indirection with
>> the compliation (external kernel dir and external module dir), and it
>> ended up only packaging the last flavor to be built, which was -xen.
>>
>> Now that's fixed so downloading from
>> http://download.opensuse.org/repositories/drivers:/filesystems/openSUSE_11.0/
>> will contain the correct files.
>>
>> - -Jeff
> 
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

iEYEARECAAYFAkho88gACgkQLPWxlyuTD7JwUACeIZfcGgwJGZ4sfoXjtPScJ3Y8
zvQAnjJpnzkqqFmmf/v/y7FeMmp2VSXe
=1wUC
-----END PGP SIGNATURE-----
