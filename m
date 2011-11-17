From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: What can be done to get the Linux 2.6.39.4 kernel patched with
 Reiser4 to build ?. The i586 build fails and  the x86_64 build passes.
Date: Thu, 17 Nov 2011 18:05:33 +0100
Message-ID: <4EC53EDD.5020502@gmail.com>
References: <d2f2094271e95561fffd7ca41bf3dc27@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <d2f2094271e95561fffd7ca41bf3dc27@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 11/17/2011 04:49 PM, doiggl@velocitynet.com.au wrote:
> Hello,
> I am finding problems in trying to compile a linux 2.6.39.4 kernel patched
> with Reiser4-for-2.6.39.patch.gz
> The i586 build failed[2], whereas the x86_64 build passes.[3]


Hello.
Fixed. Please try reiser4-for-2.6.39-1.patch.gz I have just uploaded:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-2.6/

Thanks,
Edward.


> What do I need to adjust so i586 builds properly.
> Has anyone else successfully built the with the i586 architecture ?
> Is so, what does your .config list ?
> My .config listing starts at line 3341 in [2]
> Thanks Glenn.
>
> fail[2]
> https://build.opensuse.org/package/rawlog?arch=i586&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.4
> pass[3]
> https://build.opensuse.org/package/rawlog?arch=x86_64&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.4
>
> Project/package listing
> https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl
>
>
>
> The following thread located at [0] is background I asked earlier from the
> opensuse-kernel team.
> [0]http://lists.opensuse.org/opensuse-kernel/2011-11/msg00041.html
>
> On Wed, 16 Nov 2011 14:09:20 +0100, Michal Hocko<mhocko@suse.cz>  wrote:
>> On Wed 16-11-11 23:59:41, doiggl@velocitynet.com.au wrote:
>>> Hello,
>>> What can be done to get the i585 packages to build in a patched kernel
> in
>>> this project [1].
>>> The i586 builds failed, whereas the x86_64 succeeded.
>>>
>>> Does a flag need to be set to 'N' in the .config file. If not, what
> needs
>>> to be changed so i586 packages compile ?
>>> Thanks Glenn
>>>
>>> [1]
>>> package
>>>
> https://build.opensuse.org/package/show?package=kernel-reiser4&project=home%3Adoiggl
>>>
>>> The failed i586 build logs show[2]:
>>> [2]
>>>
> https://build.opensuse.org/package/rawlog?arch=i586&package=kernel-reiser4&project=home%3Adoiggl&repository=openSUSE_11.4
>>>
>>>    LD      drivers/net/built-in.o
>>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/drivers/net/niu.c:
>>> In function 'niu_add_ethtool_tcam_entry':
>>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/drivers/net/niu.c:7510:33:
>>> warning: 'class' may be used uninitialized in this function
>>>    LD      drivers/built-in.o
>>> make[1]: *** [sub-make] Error 2
>>> make: *** [all] Error 2
>>> error: Bad exit status from /var/tmp/rpm-tmp.ioWHAW (%build)
>>
>> The real error is earlier in the output:
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:
>> In function 'check_struct_bnode':
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:801:2:
>> error: implicit declaration of function 'ext2_test_bit'
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:
>> In function 'search_one_bitmap_forward':
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:923:7:
>> error: implicit declaration of function 'ext2_find_next_zero_bit'
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:
>> In function 'apply_dset_to_commit_bmap':
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:1343:3:
>> error: implicit declaration of function 'ext2_clear_bit'
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:
>> In function 'reiser4_pre_commit_hook_bitmap':
>>
> /usr/src/packages/BUILD/kernel-reiser4-2.6.39/linux-2.6.39.4/fs/reiser4/plugin/space/bitmap.c:1409:5:
>> error: implicit declaration of function 'ext2_set_bit'
>>
>> I have no idea why reiserfs uses ext2 aliases but their current
>> definition should be something like:
>> #define ext2_set_bit    __test_and_set_bit_le
>> #define ext2_clear_bit  __test_and_clear_bit_le
>> #define ext2_test_bit   test_bit_le
>> #define ext2_find_first_zero_bit        find_first_zero_bit_le
>> #define ext2_find_next_zero_bit         find_next_zero_bit_le
>>
>> So you can either replace them by the proper definition or force
>> fs/ext2/ext2.h inclusion (which sounds really hackish).
>>
>> Regards
>> --
>> Michal Hocko
>> SUSE Labs
>> SUSE LINUX s.r.o.
>> Lihovarska 1060/12
>> 190 00 Praha 9
>> Czech Republic
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

