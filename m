From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: reiser4 crash
Date: Thu, 25 Nov 2004 10:54:10 +0300
Message-ID: <1101369249.1628.13.camel@tribesman.namesys.com>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22553-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041119084757.GA2310@sk2-4.tky.hut.fi>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sami Liedes <sliedes@cc.hut.fi>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2004-11-19 at 11:47, Sami Liedes wrote:
> Attached are the oops and fsck.reiser4 output.
> 
> This happened after using reiser4 for only 1,5 days.
> 

Which kernel do you use?

> 	Sami
> 
> 
> --- oops ---------------------------------------------------
> kernel BUG at fs/reiser4/plugin/file/tail_conversion.c:32!
> invalid operand: 0000 [#1]
> PREEMPT
> Modules linked in: ide_cd cdrom ipt_MASQUERADE ipt_REJECT ipt_state iptable_filter i2c_viapro ehci_hcd uhci_hcd usbcore via_agp evdev dm_mod i2c_isa i2c_core snd_via82xx snd_ac97_codec snd_pcm snd_timer snd_page_alloc snd_mpu401_uart snd_rawmidi snd_seq_device snd soundcore radeon agpgart 8139too mii crc32 ip_nat_irc ip_nat_ftp iptable_nat ip_tables ip_conntrack_irc ip_conntrack_ftp ip_conntrack 3c59x lp parport af_packet
> CPU:    0
> EIP:    0060:[<c01c92f2>]    Not tainted VLI
> EFLAGS: 00210286   (2.6.10-rc1)
> EIP is at get_exclusive_access+0x32/0x40
> eax: ce4dfc60   ebx: c5a64a84   ecx: c5a64a78   edx: 00000000
> esi: 00000000   edi: c5a64a78   ebp: d9b97dec   esp: d9b97dec
> ds: 007b   es: 007b   ss: 0068
> Process aptitude (pid: 7704, threadinfo=d9b96000 task=c4bf6a00)
> Stack: d9b97ed8 c01c855c 00000001 d9b97e44 d9b97dfc d9b97dfc d9b97e00 dea45ba0
>        00000014 d9b96000 00000aa9 d9b96000 d9b96000 00000001 00000001 008a1470
>        00000000 00000000 00000008 c5a64ad0 b6f19000 ddc5fba0 00008000 008a1470
> Call Trace:
>  [<c0104e7a>] show_stack+0x7a/0x90
>  [<c0104ffd>] show_registers+0x14d/0x1b0
>  [<c01051e4>] die+0xe4/0x170
>  [<c0105674>] do_invalid_op+0xe4/0xf0
>  [<c0104ab9>] error_code+0x2d/0x38
>  [<c01c855c>] write_unix_file+0x1fc/0x4c0
>  [<c01a0bbd>] reiser4_write+0x6d/0xb0
>  [<c014c59f>] vfs_write+0xbf/0x110
>  [<c014c6a1>] sys_write+0x41/0x70
>  [<c01040af>] syscall_call+0x7/0xb
> Code: ff 21 e0 89 e5 8b 00 8b 80 b8 04 00 00 8b 40 3c 8b 40 08 85 c0 75 14 ba 01 00 ff ff 89 c8 0f c1 10 85 d2 0f 85 ce 0f 00 00 c9 c3 <0f> 0b 20 00 40 90 2b c0 eb e2 8d 74 26 00 55 89 e5 ba ff ff 00
> ------------------------------------------------------------
> 
> --- fsck.reiser4 -------------------------------------------
> # fsck.reiser4 /dev/hdd3
> *******************************************************************
> This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
> *******************************************************************
> 
> Fscking the /dev/hdd3 block device.
> Will check the consistency of the Reiser4 SuperBlock.
> Will check the consistency of the Reiser4 FileSystem.
> Continue?
> (Yes/No): y
> ***** fsck.reiser4 started at Fri Nov 19 10:13:55 2004
> Reiser4 journal (journal40) on /dev/hdd3: 0 transactions replayed of the total 0 blocks.
> Reiser4 fs was detected on /dev/hdd3.
> Master super block (16):
> magic:          ReIsEr4
> blksize:        4096
> format:         0x0 (format40)
> uuid:           bff15455-f079-4543-abff-da68ef05fcbe
> label:          <none>
> 
> Format super block (17):
> plugin:         format40
> description:    Disk-format for reiser4, ver. 1.0.0
> magic:          ReIsEr40FoRmAt
> flushes:        0
> mkfs id:        0x4a43a302
> blocks:         49596671
> free blocks:    34064528
> root block:     15337898
> tail policy:    0x2 (smart)
> next oid:       0x98aa0
> file count:     518379
> tree height:    4
> key policy:     LARGE
> 
> 
> CHECKING STORAGE TREE
>         Read nodes 357991
>         Nodes left in the tree 357991
>                 Leaves of them 352551, Twigs of them 5356
>         Time interval: Fri Nov 19 10:14:09 2004 - Fri Nov 19 10:16:42 2004
> CHECKING EXTENT REGIONS.
>         Read twigs 5356
>         Time interval: Fri Nov 19 10:16:42 2004 - Fri Nov 19 10:17:11 2004
> CHECKING SEMANTIC TREE
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [37]: entry has wrong offset
> [7d8ff:0(NAME):130365f62657374:6d616e5f6c756b65:226514768dc110cd]. Should be
> [7d8ff:0(NAME):130365f62657374:6d616e5f6c756b65:2265147666480f1d].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [44]: entry has wrong offset
> [7d8ff:0(NAME):132365f68e4e470:6172695f6d616c6a:92d8f19d65d95be]. Should be
> [7d8ff:0(NAME):132365f68e4e470:6172695f6d616c6a:92d2e1933fbf67e].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [47]: entry has wrong offset
> [7d8ff:0(NAME):133305f53757669:5f6c61756c61615f:bd25b6a72855fe86]. Should be
> [7d8ff:0(NAME):133305f53757669:5f6c61756c61615f:bd2555a4d3c14cb6].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [51]: entry has wrong offset
> [7d8ff:0(NAME):133365f41737472:69645f6ae46e6e69:16db1dfa6f08ba]. Should be [7d8ff:0(NAME):133365f41737472:69645f6ae46e6e69:16db1dd2f6070a].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [52]: entry has wrong offset
> [7d8ff:0(NAME):133375f69686d65:656c6c6973656e5f:9b778ff47749f37e]. Should be
> [7d8ff:0(NAME):133375f69686d65:656c6c6973656e5f:d80e781b2fea179e].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [55]: entry has wrong offset
> [7d8ff:0(NAME):134305f796c6ce4:7479736d756e6961:40640ac5d13ba022]. Should be
> [7d8ff:0(NAME):134305f796c6ce4:7479736d756e6961:4063a8f81c2f3c82].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [56]: entry has wrong offset
> [7d8ff:0(NAME):134315f796c6ce4:74796b73657373e4:1bd83c4b92407]. Should be [7d8ff:0(NAME):134315f796c6ce4:74796b73657373e4:1b4b2452fa157].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [57]: entry has wrong offset
> [7d8ff:0(NAME):134325f41737472:69645f6a616b6161:d15a16be63d261bd]. Should be
> [7d8ff:0(NAME):134325f41737472:69645f6a616b6161:a86ba0c7a2097cad].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316682], item [1], unit [58]: entry has wrong offset
> [7d8ff:0(NAME):134335f41737472:69645f6a616b6161:f394bffd7800956b]. Should be
> [7d8ff:0(NAME):134335f41737472:69645f6a616b6161:9adefe5be00c50db].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [1]: entry has wrong offset
> [7d8ff:0(NAME):134375f52697374:6f5f7475746b6969:f9c07c6a924c893]. Should be
> [7d8ff:0(NAME):134375f52697374:6f5f7475746b6969:da3b247a1b994e3].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [3]: entry has wrong offset
> [7d8ff:0(NAME):134395f796c6569:736b7576615f68e4:3eb28bdf41f7c]. Should be [7d8ff:0(NAME):134395f796c6569:736b7576615f68e4:ffffb751cef2d5ec].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [4]: entry has wrong offset
> [7d8ff:0(NAME):135305f796c6569:736b7576615f68e4:1da264211f344b2]. Should be
> [7d8ff:0(NAME):135305f796c6569:736b7576615f68e4:ffdda5ab1a577fa2].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [6]: entry has wrong offset
> [7d8ff:0(NAME):135335f43796265:72746f702d6d6965:b20dc6112b27f52]. Should be
> [7d8ff:0(NAME):135335f43796265:72746f702d6d6965:ccfc58ed8054c342].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [8]: entry has wrong offset
> [7d8ff:0(NAME):135355f4b696d6d:6f5f6a6f6e676cf6:74232d69e18ad511]. Should be
> [7d8ff:0(NAME):135355f4b696d6d:6f5f6a6f6e676cf6:6de148b3d7414451].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [9]: entry has wrong offset
> [7d8ff:0(NAME):135365f746f696e:656e5f6c61686a61:4aa9262d28f]. Should be [7d8ff:0(NAME):135365f746f696e:656e5f6c61686a61:3dd30c60acf].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [13]: entry has wrong offset
> [7d8ff:0(NAME):136305f73756c68:6173656e5f7279f6:920d173e51c09120]. Should be
> [7d8ff:0(NAME):136305f73756c68:6173656e5f7279f6:123bb47cc8f6ecb0].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [14]: entry has wrong offset
> [7d8ff:0(NAME):136315f726f7376:6f6a6f756b6f6e5f:10a171aa582999fd]. Should be
> [7d8ff:0(NAME):136315f726f7376:6f6a6f756b6f6e5f:a9800daf3c0bd7bd].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [16]: entry has wrong offset
> [7d8ff:0(NAME):136335f41737472:69645f7469656e61:6a200ab82eeb86b5]. Should be
> [7d8ff:0(NAME):136335f41737472:69645f7469656e61:b84c800b0213e2f5].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [17]: entry has wrong offset
> [7d8ff:0(NAME):136345f41737472:69645f6d79796de4:64e2323fe411e0]. Should be
> [7d8ff:0(NAME):136345f41737472:69645f6d79796de4:d7766c3b7e1b2cd0].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [25]: entry has wrong offset
> [7d8ff:0(NAME):138325f6e79745f:5069726a6f6e5f68:64bc351919bfc2b]. Should be
> [7d8ff:0(NAME):138325f6e79745f:5069726a6f6e5f68:9b6fa2f69d3a3b5b].
> FSCK: Directory [7d8e0:6173747269645f:7d8ff] (dir40), node [4316683], item [0], unit [26]: entry has wrong offset
> [7d8ff:0(NAME):138335f74616e73:73696e5f7079f672:be4c8ad1d6bf024]. Should be
> [7d8ff:0(NAME):138335f74616e73:73696e5f7079f672:be09da7adf42944].
> FSCK: Directory [7da90:6ce4e46b000000:7daa0] (dir40), node [4318266], item [1], unit [2]: entry has wrong offset
> [7daa0:0(NAME):132303032313232:302d796c6569736c:5ea48bc52d18]. Should be [7daa0:0(NAME):132303032313232:302d796c6569736c:fffff4bfe92140a8].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [34]: entry has wrong offset
> [7dc25:0(NAME):130365f62657374:6d616e5f6c756b65:226514768dc110cd]. Should be
> [7dc25:0(NAME):130365f62657374:6d616e5f6c756b65:2265147666480f1d].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [41]: entry has wrong offset
> [7dc25:0(NAME):132365f68e4e470:6172695f6d616c6a:92d8f19d65d95be]. Should be
> [7dc25:0(NAME):132365f68e4e470:6172695f6d616c6a:92d2e1933fbf67e].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [44]: entry has wrong offset
> [7dc25:0(NAME):133305f53757669:5f6c61756c61615f:bd25b6a72855fe86]. Should be
> [7dc25:0(NAME):133305f53757669:5f6c61756c61615f:bd2555a4d3c14cb6].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [48]: entry has wrong offset
> [7dc25:0(NAME):133365f41737472:69645f6ae46e6e69:16db1dfa6f08ba]. Should be [7dc25:0(NAME):133365f41737472:69645f6ae46e6e69:16db1dd2f6070a].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [49]: entry has wrong offset
> [7dc25:0(NAME):133375f69686d65:656c6c6973656e5f:9b778ff47749f37e]. Should be
> [7dc25:0(NAME):133375f69686d65:656c6c6973656e5f:d80e781b2fea179e].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [52]: entry has wrong offset
> [7dc25:0(NAME):134305f796c6ce4:7479736d756e6961:40640ac5d13ba022]. Should be
> [7dc25:0(NAME):134305f796c6ce4:7479736d756e6961:4063a8f81c2f3c82].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [53]: entry has wrong offset
> [7dc25:0(NAME):134315f796c6ce4:74796b73657373e4:1bd83c4b92407]. Should be [7dc25:0(NAME):134315f796c6ce4:74796b73657373e4:1b4b2452fa157].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [54]: entry has wrong offset
> [7dc25:0(NAME):134325f41737472:69645f6a616b6161:d15a16be63d261bd]. Should be
> [7dc25:0(NAME):134325f41737472:69645f6a616b6161:a86ba0c7a2097cad].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [55]: entry has wrong offset
> [7dc25:0(NAME):134335f41737472:69645f6a616b6161:f394bffd7800956b]. Should be
> [7dc25:0(NAME):134335f41737472:69645f6a616b6161:9adefe5be00c50db].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [58]: entry has wrong offset
> [7dc25:0(NAME):134375f52697374:6f5f7475746b6969:f9c07c6a924c893]. Should be
> [7dc25:0(NAME):134375f52697374:6f5f7475746b6969:da3b247a1b994e3].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319242], item [0], unit [60]: entry has wrong offset
> [7dc25:0(NAME):134395f796c6569:736b7576615f68e4:3eb28bdf41f7c]. Should be [7dc25:0(NAME):134395f796c6569:736b7576615f68e4:ffffb751cef2d5ec].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [0]: entry has wrong offset
> [7dc25:0(NAME):135305f796c6569:736b7576615f68e4:1da264211f344b2]. Should be
> [7dc25:0(NAME):135305f796c6569:736b7576615f68e4:ffdda5ab1a577fa2].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [2]: entry has wrong offset
> [7dc25:0(NAME):135335f43796265:72746f702d6d6965:b20dc6112b27f52]. Should be
> [7dc25:0(NAME):135335f43796265:72746f702d6d6965:ccfc58ed8054c342].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [4]: entry has wrong offset
> [7dc25:0(NAME):135355f4b696d6d:6f5f6a6f6e676cf6:74232d69e18ad511]. Should be
> [7dc25:0(NAME):135355f4b696d6d:6f5f6a6f6e676cf6:6de148b3d7414451].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [5]: entry has wrong offset
> [7dc25:0(NAME):135365f746f696e:656e5f6c61686a61:4aa9262d28f]. Should be [7dc25:0(NAME):135365f746f696e:656e5f6c61686a61:3dd30c60acf].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [9]: entry has wrong offset
> [7dc25:0(NAME):136305f73756c68:6173656e5f7279f6:920d173e51c09120]. Should be
> [7dc25:0(NAME):136305f73756c68:6173656e5f7279f6:123bb47cc8f6ecb0].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [10]: entry has wrong offset
> [7dc25:0(NAME):136315f726f7376:6f6a6f756b6f6e5f:10a171aa582999fd]. Should be
> [7dc25:0(NAME):136315f726f7376:6f6a6f756b6f6e5f:a9800daf3c0bd7bd].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [12]: entry has wrong offset
> [7dc25:0(NAME):136335f41737472:69645f7469656e61:6a200ab82eeb86b5]. Should be
> [7dc25:0(NAME):136335f41737472:69645f7469656e61:b84c800b0213e2f5].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [13]: entry has wrong offset
> [7dc25:0(NAME):136345f41737472:69645f6d79796de4:64e2323fe411e0]. Should be
> [7dc25:0(NAME):136345f41737472:69645f6d79796de4:d7766c3b7e1b2cd0].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [21]: entry has wrong offset
> [7dc25:0(NAME):138325f6e79745f:5069726a6f6e5f68:64bc351919bfc2b]. Should be
> [7dc25:0(NAME):138325f6e79745f:5069726a6f6e5f68:9b6fa2f69d3a3b5b].
> FSCK: Directory [7dbf9:6173747269645f:7dc25] (dir40), node [4319243], item [0], unit [22]: entry has wrong offset
> [7dc25:0(NAME):138335f74616e73:73696e5f7079f672:be4c8ad1d6bf024]. Should be
> [7dc25:0(NAME):138335f74616e73:73696e5f7079f672:be09da7adf42944].
> FSCK: Directory [7ddec:6ce4e46b000000:7ddfd] (dir40), node [4319483], item [0], unit [2]: entry has wrong offset
> [7ddfd:0(NAME):132303032313232:302d796c6569736c:5ea48bc52d18]. Should be [7ddfd:0(NAME):132303032313232:302d796c6569736c:fffff4bfe92140a8].
> FSCK: Directory [7f92e:526563656e7444:7f944] (dir40), node [7188029], item [11], unit [4]: entry has wrong offset
> [7f944:0(NAME):14d696e756c6c61:206f6e20797374e4:bc7f7f4bc705cca]. Should be
> [7f944:0(NAME):14d696e756c6c61:206f6e20797374e4:9cfa275b505291a].
> FSCK: Directory [7f92e:526563656e7444:7f944] (dir40), node [7188029], item [11], unit [12]: entry has wrong offset
> [7f944:0(NAME):154756c656e204a:6565737573206c75:95832fa214e08a05]. Should be
> [7f944:0(NAME):154756c656e204a:6565737573206c75:ceb11f7d288b9d5].
> FSCK: Directory [7fa6a:61000000000000:7fbe8] (dir40), node [7191155], item [0], unit [12]: entry has wrong offset
> [7fbe8:0(NAME):17777772e616d69:63612e66695f416d:8051b6899d4702e7]. Should be
> [7fbe8:0(NAME):17777772e616d69:63612e66695f416d:7a0fd1d3ba7673d7].
> FSCK: Directory [699e3:62696c00000000:8105d] (dir40), node [7256456], item [1], unit [31]: entry has wrong offset
> [8105d:0(NAME):c770656c695f746f:696d69695f696c6d:28df05cd90c6]. Should be [8105d:0(NAME):c770656c695f746f:696d69695f696c6d:28df057a0d96].
> FSCK: Directory [699e3:6d757300000000:81549] (dir40), node [7443626], item [0], unit [7]: entry has wrong offset
> [81549:0(NAME):14d61726b6f204c:696e64726f6f7320:e9d3007d6f1fe370]. Should be
> [81549:0(NAME):14d61726b6f204c:696e64726f6f7320:fb729772ed747540].
> FSCK: Directory [699e3:7363616e000000:7f794] (dir40), node [6994496], item [1], unit [32]: entry has wrong offset
> [7f794:0(NAME):170616c76656c75:6b7365656e617374:e9cfcc19483f769a]. Should be
> [7f794:0(NAME):170616c76656c75:6b7365656e617374:e595dd5f5d0656ca].
> FSCK: Directory [793e6:73616b73610000:79d95] (dir40), node [4068633], item [1], unit [13]: entry has wrong offset
> [79d95:0(NAME):14175665f64656d:5f5765675f7a755f:fe396dc2d9a86340]. Should be
> [79d95:0(NAME):14175665f64656d:5f5765675f7a755f:3f712c128f979300].
> FSCK: Directory [793e6:73616b73610000:79d95] (dir40), node [4068633], item [1], unit [15]: entry has wrong offset
> [79d95:0(NAME):147657472696562:655f696e5f496e73:9759d81a5a3f407]. Should be
> [79d95:0(NAME):147657472696562:655f696e5f496e73:9759d6d4b3f1547].
> FSCK: Directory [7ec5d:45786974000000:7edf2] (dir40), node [4729297], item [0], unit [14]: entry has wrong offset
> [7edf2:0(NAME):145786974202d20:5669696d65696e65:146826bcf51840]. Should be [7edf2:0(NAME):145786974202d20:5669696d65696e65:145f538b388300].
> FSCK: Directory [7ec5d:6f676700000000:7ed07] (dir40), node [4494618], item [2], unit [11]: entry has wrong offset
> [7ed07:0(NAME):1457474e45f6865:5f6b61696b6b695f:efca38f3f0afcc]. Should be [7ed07:0(NAME):1457474e45f6865:5f6b61696b6b695f:efca38f3efff1c].
> FSCK: Directory [7eca2:46696e6c616e64:7eca9] (dir40), node [4416947], item [5], unit [31]: entry has wrong offset
> [7eca9:0(NAME):154e4e46c6ce45f:506f686a616e5f54:142d1c7c01f117cf]. Should be
> [7eca9:0(NAME):154e4e46c6ce45f:506f686a616e5f54:fe817006b055df3f].
> FSCK: Directory [7eca2:50657472695f4c:7ecc9] (dir40), node [4447434], item [0], unit [10]: entry has wrong offset
> [7ecc9:0(NAME):14b61696b6b695f:6f646f7475735f6a:6775041f08f4fd8f]. Should be
> [7ecc9:0(NAME):14b61696b6b695f:6f646f7475735f6a:6774a31e8e0c5fff].
> FSCK: Directory [7eca2:50657472695f4c:7ecc9] (dir40), node [4447434], item [0], unit [12]: entry has wrong offset
> [7ecc9:0(NAME):14e6f7374616e5f:6b61747365656e5f:e5990e04b555d6]. Should be [7ecc9:0(NAME):14e6f7374616e5f:6b61747365656e5f:e598fb5c8389a6].
> FSCK: Directory [7eca2:506f686a616e5f:7ece4] (dir40), node [4486474], item [0], unit [19]: entry has wrong offset
> [7ece4:0(NAME):14d696c6c6f696e:5f506f686f6c616e:638c310b1f019ea9]. Should be
> [7ece4:0(NAME):14d696c6c6f696e:5f506f686f6c616e:61937a8b9cadcd69].
> FSCK: Directory [7ec5d:168616e64656c2d:7eddc] (dir40), node [4710749], item [0], unit [7]: entry has wrong offset
> [7eddc:0(NAME):142616368202d20:496368206c696562:983d3c1400f94d73]. Should be
> [7eddc:0(NAME):142616368202d20:496368206c696562:d5fe2a670525a993].
> FSCK: Directory [7ec5d:168616e64656c2d:7eddc] (dir40), node [4710749], item [0], unit [8]: entry has wrong offset
> [7eddc:0(NAME):142616368202d20:4963682073746568:8735774f54413df8]. Should be
> [7eddc:0(NAME):142616368202d20:4963682073746568:7189cada02a60568].
> FSCK: Directory [7ef25:6ce4e46b000000:7ef39] (dir40), node [4766650], item [2], unit [2]: entry has wrong offset
> [7ef39:0(NAME):132303032313232:302d796c6569736c:5ea48bc52d18]. Should be [7ef39:0(NAME):132303032313232:302d796c6569736c:fffff4bfe92140a8].
> FSCK: Directory [8221a:7575732d6f6767:82270] (dir40), node [7690347], item [1], unit [21]: entry has wrong offset
> [82270:0(NAME):154756c656e204a:6565737573206c75:b3b9cc5f603a3ef0]. Should be
> [82270:0(NAME):154756c656e204a:6565737573206c75:c5596354de8ed0c0].
> FSCK: Directory [6815d:76656e616a6100:681b8] (dir40), node [3079481], item [0], unit [29]: entry has wrong offset
> [681b8:0(NAME):154756c656e204a:6565737573206c75:b3b9cc5f603a3ef0]. Should be
> [681b8:0(NAME):154756c656e204a:6565737573206c75:c5596354de8ed0c0].
>         Found 519392 objects.
>         Time interval: Fri Nov 19 10:17:11 2004 - Fri Nov 19 10:21:12 2004
> ***** fsck.reiser4 finished at Fri Nov 19 10:21:12 2004
> Closing fs...done
> 
> 19 fatal corruptions were detected in FileSystem. Run with --build-fs option to fix them.
> ------------------------------------------------------------
> 

