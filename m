From: <doiggl@velocitynet.com.au>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4 --build-fs /dev/sdc
Date: Wed, 01 Feb 2012 12:16:10 +1100
Message-ID: <4a0ae9e43af128af1546a6c14bb5add3@mail.velocitynet.com.au>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au> <op.v8t5gqschogzsi@g17b> <3810d7a879b20a2003ac2e1cecd026da@mail.velocitynet.com.au> <4F25649B.7030309@gmail.com> <69e7bb2502ecd3951f2b7c72fe092a06@mail.velocitynet.com.au> <4F279D42.60708@gmail.com> <969c482756fd4751ecd068f39132c524@mail.velocitynet.com.au> <4F27F2BA.8090300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4F27F2BA.8090300@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

On Tue, 31 Jan 2012 14:55:06 +0100, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 01/31/2012 01:44 PM, doiggl@velocitynet.com.au wrote:
>> On Tue, 31 Jan 2012 08:50:26 +0100, Edward Shishkin
>> <edward.shishkin@gmail.com>  wrote:
>>> On 01/31/2012 02:06 AM, doiggl@velocitynet.com.au wrote:
>>>> On Sun, 29 Jan 2012 16:24:11 +0100, Edward Shishkin
>>>> <edward.shishkin@gmail.com>   wrote:
>>>>> On 01/29/2012 02:35 PM, doiggl@velocitynet.com.au wrote:
>>>>>> On Sun, 29 Jan 2012 08:51:53 +0100, Jon=C3=A1=C5=A1
>>>> Vidra<vidra.jonas@seznam.cz>
>>>>>> wrote:
>>>>>>> Dne Sun, 29 Jan 2012 05:15:48 +0100<doiggl@velocitynet.com.au>
>>>>>> napsal(a):
>>>>>>>
>>>>>>>> Hello,
>>>>>>>> I did a repair on a reiser4 partition as follows:
>>>>>>>> # fsck.reiser4 --build-fs  /dev/sdc
>>>>>>>>
>>>>>>>> =E2=80=A6
>>>>>>>>
>>>>>>>> # mount /dev/sdc  /media/disk2
>>>>>>>> mount: No such file or directory
>>>>>>>>
>>>>>>>> This did not work either
>>>>>>>> mount -t reiser4  /dev/sdc  /media/disk2
>>>>>>>> mount: No such file or directory
>>>>>>>>
>>>>>>>> Other details
>>>>>>>> -------------
>>>>>>>> # cd /media
>>>>>>>> # md disk2
>>>>>>>> # ll
>>>>>>>> total 3
>>>>>>>> drwxr-xr-x 79 root root 2520 Jan 24 01:20 disk
>>>>>>>> drwxr-xr-x  2 root root   40 Jan 29 14:01 disk2
>>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> I suppose "md" is an alias for mkdir, right? And "ll" for ls -l=
?
Did
>>>> the
>>>>>>> directory /media/disk2 exist at the time you were trying to mou=
nt
to
>>>> it?
>>>>>>> Does your syslog contain anything useful?
>>>>>> Hello
>>>>>> Did the directory /media/disk2 exist at the time you were trying=
 to
>>>> mount
>>>>>> to it? Yes
>>>>>>
>>>>>> Does your syslog contain anything useful?
>>>>>> # dmesg contans the following warnings:
>>>>>> [41535.199439] Loading Reiser4. See www.namesys.com for a
description
>>>> of
>>>>>> Reiser4.
>>>>>> [41535.205895] reiser4: sdc: found disk format 4.0.0.
>>>>>> [41644.512374] reiser4[mount(3109)]: traverse_tree
>>>>>>
>>>>
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/search.c:725)[nikita-373]:
>>>>>> [41644.512380] WARNING: not found on internal node: level: 6,
>>>> lock_level:
>>>>>> 1, stop_level: 1 lock_mode: read, bias: exact
>>>>>> [41644.512395] reiser4[mount(3109)]: key_warning
>>>>>>
>>>>
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/plugin/file_plugin_common.c:511)[nikita-717]:
>>>>>> [41644.512400] WARNING: Error for inode 42 (-2)
>>>>>> [44813.457093] reiser4: sdc: found disk format 4.0.0.
>>>>>> [44923.248153] reiser4[mount(13238)]: traverse_tree
>>>>>>
>>>>
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/search.c:725)[nikita-373]:
>>>>>> [44923.248158] WARNING: not found on internal node: level: 6,
>>>> lock_level:
>>>>>> 1, stop_level: 1 lock_mode: read, bias: exact
>>>>>> [44923.248173] reiser4[mount(13238)]: key_warning
>>>>>>
>>>>
>>
(/home/abuild/rpmbuild/BUILD/kernel-vanilla-3.0.13/linux-3.0/fs/reiser4=
/plugin/file_plugin_common.c:511)[nikita-717]:
>>>>>> [44923.248178] WARNING: Error for inode 42 (-2)
>>>>>>
>>>>>
>>>>> Looks like stat-data of root inode can not be found at mount time=
=2E
>>>>> Could you please run fsck.reiser4 --check /dev/sdc and send the
>> output?
>>>>>
>>>>> Thanks,
>>>>> Edward.
>>>> Hello,
>>>> I run the command [it took some time] and the result was as follow=
s:
>>>> # fsck.reiser4 --check /dev/sdc
>>>> ******************************************************************=
*
>>>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first=
=2E
>>>> ******************************************************************=
*
>>>>
>>>> Fscking the /dev/sdc block device.
>>>>
>>>> Will check the consistency of the Reiser4 SuperBlock.
>>>>
>>>> Will check the consistency of the Reiser4 FileSystem.
>>>>
>>>> Continue?
>>>>
>>>> (Yes/No): yes
>>>> ***** fsck.reiser4 started at Mon Jan 30 23:10:17 2012
>>>> Reiser4 fs was detected on /dev/sdc.
>>>>
>>>> Master super block (16):
>>>> magic:          ReIsEr4
>>>> blksize:        4096
>>>> format:         0x0 (format40)
>>>> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
>>>> label:<none>
>>>>
>>>> Format super block (17):
>>>> plugin:         format40
>>>> description:    Disk-format plugin.
>>>> version:        0
>>>> magic:          ReIsEr40FoRmAt
>>>> mkfs id:        0x1ddaf754
>>>> flushes:        0
>>>> blocks:         488378640
>>>> free blocks:    217146980
>>>> root block:     37017218
>>>> tail policy:    0x2 (smart)
>>>> next oid:       0xedade
>>>> file count:     188313
>>>> tree height:    6
>>>> key policy:     LARGE
>>>>
>>>>
>>>> CHECKING THE STORAGE TREE
>>>>
>>>>           Read nodes 197008413
>>>>
>>>>           Nodes left in the tree 197008413
>>>>                   Leaves of them 194764277, Twigs of them 2217790
>>>>           Time interval: Mon Jan 30 23:12:14 2012 - Tue Jan 31
07:48:37
>>>>           2012
>>>>
>>>> CHECKING EXTENT REGIONS.
>>>>
>>>>           Read twigs 2217790
>>>>
>>>>           Time interval: Tue Jan 31 07:48:37 2012 - Tue Jan 31
09:58:54
>>>>           2012
>>>>
>>>> CHECKING THE SEMANTIC TREE
>>>>
>>>> FSCK: semantic.c: 573: repair_semantic_dir_open: Failed to recogni=
ze
>> the
>>>> plugin for the directory [29:0:2a].
>>>> FSCK: semantic.c: 651: repair_semantic_root_prepare: No root
directory
>>>> opened.
>>>>           Time interval: Tue Jan 31 09:58:54 2012 - Tue Jan 31
09:58:54
>>>>           2012
>>>>
>>>> FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap an=
d
>>>> really
>>>> used block bitmap differ.
>>>> ***** fsck.reiser4 finished at Tue Jan 31 09:58:54 2012
>>>> Closing fs...done
>>>>
>>>> 2 fatal corruptions were detected in FileSystem. Run with --build-=
fs
>>>> option to fix them.
>>>
>>>
>>> Ok, thanks,
>>>
>>> now please, run "fsck.reiser4 --build-fs /dev/sdc",
>>> and after its completion run "fsck.reiser4 --check /dev/sdc" again,
>>> then send the both outputs.
>>>
>>> Edward.
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>> Hello,
>> Content of # fsck.reiser4 --build-fs  /dev/sdc
>> *******************************************************************
>> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
>> *******************************************************************
>>
>> Fscking the /dev/sdc block device.
>>
>> Will check the consistency of the Reiser4 SuperBlock.
>>
>> Will build the Reiser4 FileSystem.
>>
>> Continue?
>>
>> (Yes/No): yes
>> ***** fsck.reiser4 started at Tue Jan 31 12:48:54 2012
>> Reiser4 fs was detected on /dev/sdc.
>>
>> Master super block (16):
>> magic:          ReIsEr4
>> blksize:        4096
>>
>> format:         0x0 (format40)
>> uuid:           3006ced1-7490-4ea8-a9b8-d82143c6bede
>> label:<none>
>>
>> Format super block (17):
>> plugin:         format40
>> description:    Disk-format plugin.
>> version:        0
>> magic:          ReIsEr40FoRmAt
>> mkfs id:        0x1ddaf754
>> flushes:        0
>> blocks:         488378640
>> free blocks:    217146980
>> root block:     37017218
>> tail policy:    0x2 (smart)
>> next oid:       0xedade
>> file count:     188313
>> tree height:    6
>> key policy:     LARGE
>>
>>
>> CHECKING THE STORAGE TREE
>>
>>          Read nodes 197008413
>>
>>          Nodes left in the tree 197008413
>>                  Leaves of them 194764277, Twigs of them 2217790
>>          Time interval: Tue Jan 31 12:50:54 2012 - Tue Jan 31 21:23:=
12
>>          2012
>>
>> CHECKING EXTENT REGIONS.
>>
>>          Read twigs 2217790
>>
>>          Time interval: Tue Jan 31 21:23:12 2012 - Tue Jan 31 23:33:=
35
>>          2012
>>
>> LOOKING FOR UNCONNECTED NODES
>>
>> FSCK: node.c: 108: repair_node_items_check: Node (43828275), items (=
0)
>> and
>> (1): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (52697435), items (=
79)
>> and (80): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (63227569), items (=
24)
>> and (25): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (63227571), items (=
73)
>> and (74): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (116595727), items
(20)
>> and (21): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
(22)
>> and (23): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
(61)
>> and (62): Wrong order of keys.
>>          Read nodes 1481038
>>
>>          Good nodes 471512
>>                  Leaves of them 466164, Twigs of them 5348
>>          Time interval: Tue Jan 31 23:33:53 2012 - Tue Jan 31 23:37:=
46
>>          2012
>>
>> ***** fsck.reiser4 finished at Tue Jan 31 23:37:46 2012
>> Closing fs...done
>>
>> FS is consistent.
>>
>> - Next step fsck.reiser4 --check /dev/sdc
>=20
> Please, don't mount the fs and send the outputs
> of "fsck.reiser4 --check /dev/sdc"
>=20
> Edward.

Hello
I run the command and got the following output.
What is the next step ? -Glenn
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
***** fsck.reiser4 started at Wed Feb  1 00:46:45 2012
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
        Time interval: Wed Feb  1 00:48:41 2012 - Wed Feb  1 09:23:33 2=
012

CHECKING EXTENT REGIONS.                                               =
  =20
                                                               =20
        Read twigs 2217790                                             =
  =20
                                                               =20
        Time interval: Wed Feb  1 09:23:33 2012 - Wed Feb  1 11:33:50 2=
012

CHECKING THE SEMANTIC TREE                                             =
  =20
                                                               =20
=46SCK: semantic.c: 573: repair_semantic_dir_open: Failed to recognize =
the
plugin for the directory [29:0:2a].                               =20
=46SCK: semantic.c: 651: repair_semantic_root_prepare: No root director=
y
opened.=20
        Time interval: Wed Feb  1 11:33:50 2012 - Wed Feb  1 11:33:50 2=
012
                                                               =20
=46SCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and r=
eally
used block bitmap differ.                                       =20
***** fsck.reiser4 finished at Wed Feb  1 11:33:51 2012
Closing fs...done

2 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.


--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
