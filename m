From: Andreas Happe <andreashappe@gmx.net>
Subject: Re: [ANNOUNCE] reiser4 snaphots
Date: Tue, 5 Nov 2002 19:23:43 +0100
Sender: news <news@main.gmane.org>
Message-ID: <slrnasg35d.843.andreashappe@marvin.homelinux.net>
References: <3DC7D812.6070401@attbi.com> <3DC7FC9A.9010509@swissonline.ch> <15815.64953.87201.907213@laputa.namesys.com> <200211051828.20553.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Dieter N=FCtzel <Dieter.Nuetzel@hamburg.de> wrote:
>> Rowan Kl=F6ti writes:
>> Hard to say. Depends on Linus mostly. I am personally not very
>> optimistic about this.
>=20
> I'm not that hopeless.
> As I read Linus post right, he is very interessted in all the new=20
> functionality (atomicity).
>=20
> The more "numbers" we present (benchmarks) the better.
> (numbers count :-)

well, i've got a little problem with reiser4:

trying to copy my kerneltree from a reiserfs to a reiser4 partition
generated this lovely piece of output:

| Nov  5 19:11:32 marvin kernel: bad: scheduling while atomic!
| Nov  5 19:11:32 marvin kernel: Call Trace:
| Nov  5 19:11:32 marvin kernel: [<c01159e1>] schedule+0x3d/0x2c8
| Nov  5 19:11:32 marvin kernel: [<c015781d>] __wait_on_inode+0x71/0x90
| Nov  5 19:11:32 marvin kernel: [<c0115cb0>] default_wake_function+0x0/0x34
| Nov  5 19:11:32 marvin kernel: [<c0115cb0>] default_wake_function+0x0/0x34
| Nov  5 19:11:32 marvin kernel: [<c015c716>] __writeback_single_inode+0x4a=
/0x7c
| Nov  5 19:11:32 marvin kernel: [<c015c8d7>] sync_sb_inodes+0x18f/0x21c
| Nov  5 19:11:32 marvin kernel: [<c015ca62>] sync_inodes_sb+0x66/0x80
| Nov  5 19:11:32 marvin kernel: [<c015cb68>] sync_inodes+0x1c/0x80
| Nov  5 19:11:32 marvin kernel: [<d1abdaec>] state_mask.1743+0x1308/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<c01438ba>] sys_sync+0xe/0x2c
| Nov  5 19:11:32 marvin kernel: [<c0118945>] panic+0x65/0xe0
| Nov  5 19:11:32 marvin kernel: [<d19b113c>] preempt_point+0x0/0xa0 [reise=
r4]
| Nov  5 19:11:32 marvin kernel: [<d1abdaec>] state_mask.1743+0x1308/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ba59a0>] panic_buf+0x0/0x400 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1a5b7a0>] reiser4_writepages+0xc0/0x184=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1b358a0>] REISER4_MAGIC_OFFSET+0xe78/0x=
f4b4 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1b35886>] REISER4_MAGIC_OFFSET+0xe5e/0x=
f4b4 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1b3311f>] REISER4_SUPER_MAGIC+0xb8b3/0x=
ce01 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1b3587e>] REISER4_MAGIC_OFFSET+0xe56/0x=
f4b4 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<c013ea54>] do_writepages+0x18/0x2c
| Nov  5 19:11:32 marvin kernel: [<c015c5cd>] __sync_single_inode+0x69/0x168
| Nov  5 19:11:32 marvin kernel: [<c015c740>] __writeback_single_inode+0x74=
/0x7c
| Nov  5 19:11:32 marvin kernel: [<c015c8d7>] sync_sb_inodes+0x18f/0x21c
| Nov  5 19:11:32 marvin kernel: [<c015ca62>] sync_inodes_sb+0x66/0x80
| Nov  5 19:11:32 marvin kernel: [<c015cb68>] sync_inodes+0x1c/0x80
| Nov  5 19:11:32 marvin kernel: [<d1abdaec>] state_mask.1743+0x1308/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<c01438ba>] sys_sync+0xe/0x2c
| Nov  5 19:11:32 marvin kernel: [<c0118945>] panic+0x65/0xe0
| Nov  5 19:11:32 marvin kernel: [<d19b113c>] preempt_point+0x0/0xa0 [reise=
r4]
| Nov  5 19:11:32 marvin kernel: [<d1abdaec>] state_mask.1743+0x1308/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ba59a0>] panic_buf+0x0/0x400 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19b4650>] jnode_attach_page+0x174/0x280=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ac29a0>] state_mask.1743+0x61bc/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ac2971>] state_mask.1743+0x618d/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ac1d60>] state_mask.1743+0x557c/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ac298f>] state_mask.1743+0x61ab/0xebbc=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19b6917>] jinit_new+0x44b/0xd6c [reiser=
4]
| Nov  5 19:11:32 marvin kernel: [<d1ba40bc>] jnode_plugins+0x3c/0x130 [rei=
ser4]
| Nov  5 19:11:32 marvin kernel: [<d19be9f2>] zinit_new+0xa/0x10 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19c7966>] new_node+0x536/0x654 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19ceed3>] add_new_znode+0x143/0x690 [re=
iser4]
| Nov  5 19:11:32 marvin kernel: [<d19b140d>] check_stack+0x141/0x164 [reis=
er4]
| Nov  5 19:11:32 marvin kernel: [<d1a60b85>] node40_free_space+0x465/0x4e8=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19d4b9e>] make_space_by_new_nodes+0x36/=
0x19c [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19d4d65>] make_space_for_flow_insertion=
+0x61/0x74 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19d511e>] carry_insert_flow+0x3a6/0x404=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ba49e0>] node_plugins+0x0/0xc0 [reiser=
4]
| Nov  5 19:11:32 marvin kernel: [<d19cb60b>] carry_on_level+0x2db/0x77c [r=
eiser4]
| Nov  5 19:11:32 marvin kernel: [<d19cb0cb>] carry+0x39b/0x600 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19e3535>] insert_flow+0xc9/0xe4 [reiser=
4]
| Nov  5 19:11:32 marvin kernel: [<d1ba5518>] item_plugins+0x3d8/0x49c [rei=
ser4]
| Nov  5 19:11:32 marvin kernel: [<d1a867e4>] tail_write+0x198/0x340 [reise=
r4]
| Nov  5 19:11:32 marvin kernel: [<d1ab9223>] unix_file_setattr+0xd3/0x160 =
[reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ab7cc0>] append_and_or_overwrite+0x17c=
/0x400 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d19b140d>] check_stack+0x141/0x164 [reis=
er4]
| Nov  5 19:11:32 marvin kernel: [<d19b140d>] check_stack+0x141/0x164 [reis=
er4]
| Nov  5 19:11:32 marvin kernel: [<d1a5074a>] reiser4_inode_data+0xa/0x80 [=
reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1a50aee>] get_inode_oid+0x7e/0xa0 [reis=
er4]
| Nov  5 19:11:32 marvin kernel: [<d19b140d>] check_stack+0x141/0x164 [reis=
er4]
| Nov  5 19:11:32 marvin kernel: [<d1a0f93f>] build_sd_key+0x2d7/0x84c [rei=
ser4]
| Nov  5 19:11:32 marvin kernel: [<d1a0fe95>] build_sd_key+0x82d/0x84c [rei=
ser4]
| Nov  5 19:11:32 marvin kernel: [<d1ba4aa0>] file_plugins+0x0/0x2e0 [reise=
r4]
| Nov  5 19:11:32 marvin kernel: [<d19b140d>] check_stack+0x141/0x164 [reis=
er4]
| Nov  5 19:11:32 marvin kernel: [<d1a76cac>] unix_key_by_inode+0x324/0x330=
 [reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1ba4aa0>] file_plugins+0x0/0x2e0 [reise=
r4]
| Nov  5 19:11:32 marvin kernel: [<d1ba5518>] item_plugins+0x3d8/0x49c [rei=
ser4]
| Nov  5 19:11:32 marvin kernel: [<d1ab8649>] unix_file_write+0x211/0x274 [=
reiser4]
| Nov  5 19:11:32 marvin kernel: [<d1a53f5d>] reiser4_write+0x225/0x27c [re=
iser4]
| Nov  5 19:11:32 marvin kernel: [<d1ba5e04>] active_contexts+0x0/0x1c [rei=
ser4]
| Nov  5 19:11:32 marvin kernel: [<c0142121>] vfs_write+0xc5/0x144
| Nov  5 19:11:32 marvin kernel: [<c01423a2>] sys_write+0x2a/0x3c
| Nov  5 19:11:32 marvin kernel: [<c0106ec7>] syscall_call+0x7/0xb
| Nov  5 19:11:32 marvin kernel:=20

of course, the whole mounted partition is not accessable because cp and
"ktxnmgrd:wait" hangs.

andreas,
btw: sorry for the long post


