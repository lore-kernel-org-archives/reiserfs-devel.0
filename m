From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 module and 2.6.29-x-default kernel
Date: Fri, 22 May 2009 17:47:46 +0200
Message-ID: <4A16C922.1090700@gmail.com>
References: <13991.202.168.22.19.1242997798.squirrel@webmail.velocity.net.au> <4A16AAA5.9040105@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4A16AAA5.9040105@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: doiggl@velocitynet.com.au, reiserfs-devel@vger.kernel.org

Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> doiggl@velocitynet.com.au wrote:
>   
>> Hello,
>> How can I manually create a installable reiser4 rpm module for a new
>> kernel, because the opensuse build service seems stuck on a older kernel .
>> I need all of the steps please, (commands please) so I can create the
>> installable rpm module.
>>     
>
> Hi Glenn -
>
>   

Hello everyone.

> I'm afraid it's not as simple as a series of commands. I do need to
> update the patch to the 2.6.29 version

 ah, you maintain 2.6.small_nr + series of patches..?

>  which doesn't have the
> - ->commit_write and ->prepare_write hooks that have been removed.

this goes here:
http://userweb.kernel.org/~akpm/mmotm/broken-out/reiser4-adjust-to-the-new-aops.patch

>  The
> other thing is that it needs more support in the kernel itself.
> Previously it was limited to exports and adding a new hook, which I
> could accept without much worry. I'm concerned about whether
> set_buffers_dirty_notag() will make it upstream and I'm uncertain of the
> interactions.
>   

I think it'll be pushed to upstream simultaneously with reiser4,
unless someone needs to not tag every dirty page in the radix tree..

> Edward - What's the reasoning behind it?

The reason is to reduce a cost of maintenance.

Since reiser4_set_page_internal() is not in vfs library
bad things are bound to happen. For example, set_page_dirty()
and friends were modified by vfs folks to update dirty pages
accounting and of course nobody knew that there are other
"friends" in reiser4 code, so I have spent a lot of time to figure
out why oom kills processes of dbench 190...

>  Has it been submitted upstream
> yet?

Nup, this is in -mm

> Is it possible to use reiser4_set_dirty_pages creatively to get
> the same effect?
>   

Sure.
Just modify it to update dirty page accounting
(2 strings or so need to be added).
Note, that there were 2 friends in reiser4 to modify:
reiser4_set_page_dirty() and reiser4_set_page_dirty_internal().

Edward.

> - -Jeff
>
>   
>> 2. In the past, I've used the reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3
>> (2.6.27.7-9-default) opensuse 11.1 with good success and has worked well
>> for me.
>>
>> # uname -a
>> Linux test 2.6.27.7-9-default #1 SMP 2008-12-04 18:10:04 +0100 x86_64 x86_64
>> x86_64 GNU/Linux
>>
>> # rpm -ivhU reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm
>> warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm: Header V3 DSA
>> signature: NOKEY, key ID 74de2879
>> Preparing...                ###########################################
>> [100%]
>>    1:reiser4-kmp-default    ###########################################
>> [100%]
>> 24831 blocks
>> 24831 blocks
>>
>> #  modprobe -v  reiser4
>> insmod
>> /lib/modules/2.6.27.7-9-default/kernel/lib/zlib_deflate/zlib_deflate.ko
>> insmod /lib/modules/2.6.27.7-9-default/kernel/lib/lzo/lzo_compress.ko
>> insmod /lib/modules/2.6.27.7-9-default/kernel/lib/lzo/lzo_decompress.ko
>> insmod /lib/modules/2.6.27.7-9-default/updates/reiser4.ko
>>
>> # rpm -qlp reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm
>> warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm: Header V3
>> DSA signature: NOKEY, key ID 74de2879
>> /lib/modules/2.6.27.7-9-default
>> /lib/modules/2.6.27.7-9-default/updates
>> /lib/modules/2.6.27.7-9-default/updates/reiser4.ko
>>
>> 3. My new system details with 11.2-Milestone1 (new)
>> ===================================================
>> I want to install reiser 4 on it reiser4-kmp-default with 2.6.29-XX-default
>>
>> 3a. System installed with 11.2-Milestone1 -
>> http://download.opensuse.org/distribution/11.2-Milestone1/iso/openSUSE-KDE4-LiveCD-Build0067-i686.iso
>> # uname -a
>> Linux linux 2.6.29-6-default #1 SMP 2009-03-24 15:38:18 +0100 x86_64
>> x86_64 x86_64 GNU/Linux
>>
>> How can I manually create a installable reiser4 rpm module.
>> I need all of the steps please, (commands please) so I can create the rpm
>> module with the three files (see below).
>>
>> Other references I looked at but I did not understand the reiser4.spec and
>> how the files (see below) are generated and packaged for a newer kernel..
>>
>> # rpm -qlp reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm
>> warning: reiser4-kmp-default-0.1_2.6.27.7_9.1-27.3.x86_64.rpm: Header V3
>> DSA signature: NOKEY, key ID 74de2879
>> /lib/modules/2.6.27.7-9-default
>> /lib/modules/2.6.27.7-9-default/updates
>> /lib/modules/2.6.27.7-9-default/updates/reiser4.ko
>>
>> https://build.opensuse.org/package/view_file?file=reiser4.spec&package=reiser4-kmp&project=drivers%3Afilesystems
>>
>> Thankyou for your help and time.
>> Glenn
>>
>>     
>
>
> - --
> Jeff Mahoney
> SUSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.9 (GNU/Linux)
> Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org
>
> iEYEARECAAYFAkoWqqUACgkQLPWxlyuTD7IPGACZAWHkFYlr/FwNCUbW4XaDOhPW
> qNkAn2XgJ2ycLXHzQ/pH1ETux6J3O2NH
> =nchX
> -----END PGP SIGNATURE-----
>
>   

