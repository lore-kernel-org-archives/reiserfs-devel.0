From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [RFC] reiserfs 3.7
Date: Sun, 21 Nov 2010 09:53:14 -0500
Message-ID: <4CE9325A.4020200@suse.com>
References: <4CE7F1C3.2010701@suse.com> <4CE9074A.8050608@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4CE9074A.8050608@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/21/2010 06:49 AM, Edward Shishkin wrote:
> Jeff Mahoney wrote:
>> Hi all -
>>
>> I recently posted about wanting to extend the maximum supported file
>> size from the 2 TB limit it currently has to the advertised maximum of 8
>> TB. This turned out to be a flop since the file system format uses 512
>> byte blocks in the stat data's sd_blocks field.
> 
> So what do you want to keep in sd_blocks of 3.7 disks?

It would be kept in file system blocksize blocks.

>> The format supports
>> larger file sizes in general, but this field is a stumbling block. Users
>> are trying to work within reiserfs's advertised limits and discovering
>> that the limits aren't as accurate as we thought.
>>
>> I commented during that thread about how I should have created a v3.7
>> years ago when I first wrote the hack that is extended attributes.
>>
>> So, I have. See the following posts. The initial version doesn't have
>> any extended features - it just adds a new magic number and the feature
>> bitmasks to the superblock. It follows the ext[234] system of feature
>> bits to define which features are supported on the file system.
>>
>> I also have fsck support written but it is pretty untested still. Before
>> I invest more effort in this, I'd like to get a consensus of whether or
>> not this is desirable feature.
>>
>> My intention is that, once this is upstream, to backport it to our
>> earlier products to enable things like the 8 TB limit.
>>
>> The idea is to be able to convert an existing 3.6 file system to 3.7 ,
>> just like the 3.5->3.6 conversion.
> 
> You want to prohibit mounting of 3.6 disks to 3.7 kernels?
> I am afraid it will be a shock therapy: mandatory fsck can be
> rather painful for someone..

No, that's not the idea at all. The idea is that 3.7 would be a superset
of the 3.6 implementation. Anything else would create a flag day in
which your file system is totally dependent on which version of the
kernel you're running, even if you didn't take any action to change
anything. That's obviously completely unacceptable. Kernels with 3.7
support will be able to mount versions <= 3.7. Kernels with 3.6 support
would be able to mount versions <= 3.6(jr).

On a system without any 3.7 features enabled, it should also be possible
to revert back to 3.6 if desired. We actually have this ability vs the
3.5->3.6 conversion because the feature bits indicate which features
beyond those offered in 3.6 are in use. The code to back out feature
bits hasn't been implemented yet as I expect only a small subset of
users would ever want that functionality.

- -Jeff

>> For features like the blocksize
>> sd_blocks field, fsck --fix-fixable would adjust all the sd_blocks
>> values on the file system.
>>
>> -Jeff
>>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org/

iEYEARECAAYFAkzpMloACgkQLPWxlyuTD7I5UgCghVxEItWELM21JZV29zcUCI68
H2IAnAtEfyEywSSX7Hy+Tbgr1+rt4WFc
=8mEh
-----END PGP SIGNATURE-----
