From: <doiggl@velocitynet.com.au>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4 --build-fs /dev/sdc
Date: Tue, 31 Jan 2012 12:06:35 +1100
Message-ID: <69e7bb2502ecd3951f2b7c72fe092a06@mail.velocitynet.com.au>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au> <op.v8t5gqschogzsi@g17b> <3810d7a879b20a2003ac2e1cecd026da@mail.velocitynet.com.au> <4F25649B.7030309@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4F25649B.7030309@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

On Sun, 29 Jan 2012 16:24:11 +0100, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 01/29/2012 02:35 PM, doiggl@velocitynet.com.au wrote:
>> On Sun, 29 Jan 2012 08:51:53 +0100, Jon=C3=A1=C5=A1
Vidra<vidra.jonas@seznam.cz>
>> wrote:
>>> Dne Sun, 29 Jan 2012 05:15:48 +0100<doiggl@velocitynet.com.au>
>> napsal(a):
>>>
>>>> Hello,
>>>> I did a repair on a reiser4 partition as follows:
>>>> # fsck.reiser4 --build-fs  /dev/sdc
>>>>
>>>> =E2=80=A6
>>>>
>>>> # mount /dev/sdc  /media/disk2
>>>> mount: No such file or directory
>>>>
>>>> This did not work either
>>>> mount -t reiser4  /dev/sdc  /media/disk2
>>>> mount: No such file or directory
>>>>
>>>> Other details
>>>> -------------
>>>> # cd /media
>>>> # md disk2
>>>> # ll
>>>> total 3
>>>> drwxr-xr-x 79 root root 2520 Jan 24 01:20 disk
>>>> drwxr-xr-x  2 root root   40 Jan 29 14:01 disk2
>>>
>>> Hello,
>>>
>>> I suppose "md" is an alias for mkdir, right? And "ll" for ls -l? Di=
d
the
>>> directory /media/disk2 exist at the time you were trying to mount t=
o
it?
>>> Does your syslog contain anything useful?
>> Hello
>> Did the directory /media/disk2 exist at the time you were trying to
mount
>> to it? Yes
>>
>> Does your syslog contain anything useful?
>> # dmesg contans the following warnings:
>> [41535.199439] Loading Reiser4. See www.namesys.com for a descriptio=
n
of
>> Reiser4.
>> [41535.205895] reiser4: sdc: found disk format 4.0.0.
>> [41644.512374] reiser4[mount(3109)]: traverse_tree
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/search.c:725)[nikita-373]:
>> [41644.512380] WARNING: not found on internal node: level: 6,
lock_level:
>> 1, stop_level: 1 lock_mode: read, bias: exact
>> [41644.512395] reiser4[mount(3109)]: key_warning
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/plugin/file_plugin_common.c:511)[nikita-717]:
>> [41644.512400] WARNING: Error for inode 42 (-2)
>> [44813.457093] reiser4: sdc: found disk format 4.0.0.
>> [44923.248153] reiser4[mount(13238)]: traverse_tree
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/search.c:725)[nikita-373]:
>> [44923.248158] WARNING: not found on internal node: level: 6,
lock_level:
>> 1, stop_level: 1 lock_mode: read, bias: exact
>> [44923.248173] reiser4[mount(13238)]: key_warning
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/plugin/file_plugin_common.c:511)[nikita-717]:
>> [44923.248178] WARNING: Error for inode 42 (-2)
>>
>=20
> Looks like stat-data of root inode can not be found at mount time.
> Could you please run fsck.reiser4 --check /dev/sdc and send the outpu=
t?
>=20
> Thanks,
> Edward.
Hello,
I run the command [it took some time] and the result was as follows:
# fsck.reiser4 --check /dev/sdc
*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

=46scking the /dev/sdc block device.                                   =
    =20
                                                                     =20
Will check the consistency of the Reiser4 SuperBlock.                  =
  =20
                                                                     =20
Will check the consistency of the Reiser4 FileSystem.                  =
  =20
                                                                     =20
Continue?                                                              =
  =20
                                                                     =20
(Yes/No): yes
***** fsck.reiser4 started at Mon Jan 30 23:10:17 2012
Reiser4 fs was detected on /dev/sdc.                                   =
  =20
                                                                     =20
Master super block (16):=20
magic:          ReIsEr4=20
blksize:        4096=20
format:         0x0 (format40)=20
uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede=20
label:          <none>=20
=20
=46ormat super block (17):=20
plugin:         format40=20
description:    Disk-format plugin.=20
version:        0=20
magic:          ReIsEr40FoRmAt=20
mkfs id:        0x1ddaf754=20
flushes:        0=20
blocks:         488378640=20
free blocks:    217146980=20
root block:     37017218=20
tail policy:    0x2 (smart)=20
next oid:       0xedade=20
file count:     188313=20
tree height:    6=20
key policy:     LARGE=20
=20
=20
CHECKING THE STORAGE TREE                                              =
  =20
                                                                     =20
        Read nodes 197008413                                           =
  =20
                                                                     =20
        Nodes left in the tree 197008413=20
                Leaves of them 194764277, Twigs of them 2217790=20
        Time interval: Mon Jan 30 23:12:14 2012 - Tue Jan 31 07:48:37 2=
012

CHECKING EXTENT REGIONS.                                               =
  =20
                                                                     =20
        Read twigs 2217790                                             =
  =20
                                                                     =20
        Time interval: Tue Jan 31 07:48:37 2012 - Tue Jan 31 09:58:54 2=
012

CHECKING THE SEMANTIC TREE                                             =
  =20
                                                                     =20
=46SCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize =
the
plugin for the directory [29:0:2a].                                    =
 =20
=46SCK: semantic.c: 651: repair_semantic_root_prepare: No root director=
y
opened.=20
        Time interval: Tue Jan 31 09:58:54 2012 - Tue Jan 31 09:58:54 2=
012
                                                                     =20
=46SCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and r=
eally
used block bitmap differ.                                             =20
***** fsck.reiser4 finished at Tue Jan 31 09:58:54 2012
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
