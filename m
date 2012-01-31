From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4
 --build-fs /dev/sdc
Date: Tue, 31 Jan 2012 08:50:26 +0100
Message-ID: <4F279D42.60708@gmail.com>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au> <op.v8t5gqschogzsi@g17b> <3810d7a879b20a2003ac2e1cecd026da@mail.velocitynet.com.au> <4F25649B.7030309@gmail.com> <69e7bb2502ecd3951f2b7c72fe092a06@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=nflqgp1sbqEQ1+stlP51u9NNqdhNkzYpbBMAVvwGNJ0=;
        b=fQAwaKLA+Ecbv5GvE9Eb9mu/HkpTo0xZ7oJ8YzT+SWFCKxok7/Amtnw9GIIEnACZ1D
         OdbXZEZ0QEk5HHFfDj6/EavNj5a1NJ3a/3ofUeouGjxif1wSETlMTA2jzqHT2ORJdt/N
         f7blHvOVIcOnKMKPl6eVWpjRtbSlPIYXLGQwU=
In-Reply-To: <69e7bb2502ecd3951f2b7c72fe092a06@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 01/31/2012 02:06 AM, doiggl@velocitynet.com.au wrote:
> On Sun, 29 Jan 2012 16:24:11 +0100, Edward Shishkin
> <edward.shishkin@gmail.com>  wrote:
>> On 01/29/2012 02:35 PM, doiggl@velocitynet.com.au wrote:
>>> On Sun, 29 Jan 2012 08:51:53 +0100, Jon=C3=A1=C5=A1
> Vidra<vidra.jonas@seznam.cz>
>>> wrote:
>>>> Dne Sun, 29 Jan 2012 05:15:48 +0100<doiggl@velocitynet.com.au>
>>> napsal(a):
>>>>
>>>>> Hello,
>>>>> I did a repair on a reiser4 partition as follows:
>>>>> # fsck.reiser4 --build-fs  /dev/sdc
>>>>>
>>>>> =E2=80=A6
>>>>>
>>>>> # mount /dev/sdc  /media/disk2
>>>>> mount: No such file or directory
>>>>>
>>>>> This did not work either
>>>>> mount -t reiser4  /dev/sdc  /media/disk2
>>>>> mount: No such file or directory
>>>>>
>>>>> Other details
>>>>> -------------
>>>>> # cd /media
>>>>> # md disk2
>>>>> # ll
>>>>> total 3
>>>>> drwxr-xr-x 79 root root 2520 Jan 24 01:20 disk
>>>>> drwxr-xr-x  2 root root   40 Jan 29 14:01 disk2
>>>>
>>>> Hello,
>>>>
>>>> I suppose "md" is an alias for mkdir, right? And "ll" for ls -l? D=
id
> the
>>>> directory /media/disk2 exist at the time you were trying to mount =
to
> it?
>>>> Does your syslog contain anything useful?
>>> Hello
>>> Did the directory /media/disk2 exist at the time you were trying to
> mount
>>> to it? Yes
>>>
>>> Does your syslog contain anything useful?
>>> # dmesg contans the following warnings:
>>> [41535.199439] Loading Reiser4. See www.namesys.com for a descripti=
on
> of
>>> Reiser4.
>>> [41535.205895] reiser4: sdc: found disk format 4.0.0.
>>> [41644.512374] reiser4[mount(3109)]: traverse_tree
>>>
> (/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reise=
r4/search.c:725)[nikita-373]:
>>> [41644.512380] WARNING: not found on internal node: level: 6,
> lock_level:
>>> 1, stop_level: 1 lock_mode: read, bias: exact
>>> [41644.512395] reiser4[mount(3109)]: key_warning
>>>
> (/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reise=
r4/plugin/file_plugin_common.c:511)[nikita-717]:
>>> [41644.512400] WARNING: Error for inode 42 (-2)
>>> [44813.457093] reiser4: sdc: found disk format 4.0.0.
>>> [44923.248153] reiser4[mount(13238)]: traverse_tree
>>>
> (/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reise=
r4/search.c:725)[nikita-373]:
>>> [44923.248158] WARNING: not found on internal node: level: 6,
> lock_level:
>>> 1, stop_level: 1 lock_mode: read, bias: exact
>>> [44923.248173] reiser4[mount(13238)]: key_warning
>>>
> (/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reise=
r4/plugin/file_plugin_common.c:511)[nikita-717]:
>>> [44923.248178] WARNING: Error for inode 42 (-2)
>>>
>>
>> Looks like stat-data of root inode can not be found at mount time.
>> Could you please run fsck.reiser4 --check /dev/sdc and send the outp=
ut?
>>
>> Thanks,
>> Edward.
> Hello,
> I run the command [it took some time] and the result was as follows:
> # fsck.reiser4 --check /dev/sdc
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
>
> Fscking the /dev/sdc block device.
>
> Will check the consistency of the Reiser4 SuperBlock.
>
> Will check the consistency of the Reiser4 FileSystem.
>
> Continue?
>
> (Yes/No): yes
> ***** fsck.reiser4 started at Mon Jan 30 23:10:17 2012
> Reiser4 fs was detected on /dev/sdc.
>
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
> label:<none>
>
> Format super block (17):
> plugin:         format40
> description:    Disk-format plugin.
> version:        0
> magic:          ReIsEr40FoRmAt
> mkfs id:        0x1ddaf754
> flushes:        0
> blocks:         488378640
> free blocks:    217146980
> root block:     37017218
> tail policy:    0x2 (smart)
> next oid:       0xedade
> file count:     188313
> tree height:    6
> key policy:     LARGE
>
>
> CHECKING THE STORAGE TREE
>
>          Read nodes 197008413
>
>          Nodes left in the tree 197008413
>                  Leaves of them 194764277, Twigs of them 2217790
>          Time interval: Mon Jan 30 23:12:14 2012 - Tue Jan 31 07:48:3=
7 2012
>
> CHECKING EXTENT REGIONS.
>
>          Read twigs 2217790
>
>          Time interval: Tue Jan 31 07:48:37 2012 - Tue Jan 31 09:58:5=
4 2012
>
> CHECKING THE SEMANTIC TREE
>
> FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize =
the
> plugin for the directory [29:0:2a].
> FSCK: semantic.c: 651: repair_semantic_root_prepare: No root director=
y
> opened.
>          Time interval: Tue Jan 31 09:58:54 2012 - Tue Jan 31 09:58:5=
4 2012
>
> FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and r=
eally
> used block bitmap differ.
> ***** fsck.reiser4 finished at Tue Jan 31 09:58:54 2012
> Closing fs...done
>
> 2 fatal corruptions were detected in FileSystem. Run with --build-fs
> option to fix them.


Ok, thanks,

now please, run "fsck.reiser4 --build-fs /dev/sdc",
and after its completion run "fsck.reiser4 --check /dev/sdc" again,
then send the both outputs.

Edward.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
