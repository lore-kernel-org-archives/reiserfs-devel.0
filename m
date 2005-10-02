From: Chris Bainbridge <chris.bainbridge@gmail.com>
Subject: 2.6.13 + reiser4 = scheduling while atomic
Date: Sun, 2 Oct 2005 17:49:17 +0000
Message-ID: <623652d50510021049l66c481d4v@mail.gmail.com>
Reply-To: Chris Bainbridge <chris.bainbridge@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26375-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,

Today I updated from vanilla 2.6.12.5 + reiser4 to vanilla 2.6.13 +
reiser4-for-2.6.13-1.patch + spin_macros patch from this list.

I'm now seeing the following errors which I have not seen before.
Kernel config follows error log.

Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c02d202a>] synaptics_process_byte+0x2a/0xa0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a1152>] squeeze_right_twig+0x112/0x130
Oct  2 18:11:03 host [<c01a1316>] squeeze_right_twig_and_advance_coord+0x16=
=3D
/0x50
Oct  2 18:11:03 host [<c01a1afd>] handle_pos_end_of_twig+0x9d/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c011a327>] __wake_up_common+0x37/0x70
Oct  2 18:11:03 host [<c03611fa>] __down+0x7a/0x100
Oct  2 18:11:03 host [<c011a2e0>] default_wake_function+0x0/0x10
Oct  2 18:11:03 host [<c010208c>] __up+0x1c/0x20
Oct  2 18:11:03 host [<c03613bb>] __down_failed+0x7/0xc
Oct  2 18:11:03 host [<c019773d>] .text.lock.lock+0x12/0x15
Oct  2 18:11:03 host [<c01972ff>] longterm_lock_znode+0x26f/0x2e0
Oct  2 18:11:03 host [<c01ab8e5>] lock_neighbor+0xa5/0x150
Oct  2 18:11:03 host [<c01ab9c6>] reiser4_get_parent_flags+0x36/0x60
Oct  2 18:11:03 host [<c01a15a0>] lock_parent_and_allocate_znode+0x40/0xb0
Oct  2 18:11:03 host [<c01a1c77>] handle_pos_end_of_twig+0x217/0x2b0
Oct  2 18:11:03 host [<c01a1fd6>] squalloc+0x26/0x60
Oct  2 18:11:03 host [<c01a055e>] jnode_flush+0x20e/0x370
Oct  2 18:11:03 host [<c01a08f9>] flush_current_atom+0x119/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01d488b>] item_key_by_coord+0xb/0x10
Oct  2 18:11:03 host [<c0196e98>] longterm_unlock_znode+0xa8/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c019c261>] grabbed2free_mark+0x41/0x60
Oct  2 18:11:03 host [<c01a22dd>] shift_one_internal_unit+0xad/0x150
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a1133>] squeeze_right_twig+0xf3/0x130
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18
Oct  2 18:11:03 host scheduling while atomic: pdflush/0x00000001/146
Oct  2 18:11:03 host [<c036196e>] schedule+0x57e/0x660
Oct  2 18:11:03 host [<c02604ad>] cfq_may_queue+0x2d/0x70
Oct  2 18:11:03 host [<c0260480>] cfq_may_queue+0x0/0x70
Oct  2 18:11:03 host [<c0257289>] elv_may_queue+0x29/0x40
Oct  2 18:11:03 host [<c0259a0f>] get_request+0x4f/0x2e0
Oct  2 18:11:03 host [<c036229e>] io_schedule+0xe/0x20
Oct  2 18:11:03 host [<c0259da7>] get_request_wait+0x107/0x130
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025e970>] cfq_merge+0x0/0xc0
Oct  2 18:11:03 host [<c025a6d8>] __make_request+0x98/0x510
Oct  2 18:11:03 host [<c01405c9>] __alloc_pages+0x269/0x400
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c025ae38>] generic_make_request+0x68/0x1e0
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c01316a0>] autoremove_wake_function+0x0/0x50
Oct  2 18:11:03 host [<c0107b2c>] timer_interrupt+0x7c/0x90
Oct  2 18:11:03 host [<c025b004>] submit_bio+0x54/0xe0
Oct  2 18:11:03 host [<c0122575>] irq_exit+0x35/0x40
Oct  2 18:11:03 host [<c010545e>] do_IRQ+0x1e/0x30
Oct  2 18:11:03 host [<c0103a8a>] common_interrupt+0x1a/0x20
Oct  2 18:11:03 host [<c01a425a>] write_jnodes_to_disk_extent+0x2ba/0x2f0
Oct  2 18:11:03 host [<c01a4341>] write_jnode_list+0xb1/0xe0
Oct  2 18:11:03 host [<c01a8f50>] write_fq+0x70/0xa0
Oct  2 18:11:03 host [<c01a092a>] flush_current_atom+0x14a/0x210
Oct  2 18:11:03 host [<c019d8f1>] flush_some_atom+0x1c1/0x360
Oct  2 18:11:03 host [<c01adc4a>] writeout+0x10a/0x1d0
Oct  2 18:11:03 host [<c01aa477>] reiser4_sync_inodes+0x57/0xc0
Oct  2 18:11:03 host [<c01aa420>] reiser4_sync_inodes+0x0/0xc0
Oct  2 18:11:03 host [<c017d259>] sync_sb_inodes+0x19/0x20
Oct  2 18:11:03 host [<c017d31c>] writeback_inodes+0xbc/0xf0
Oct  2 18:11:03 host [<c0141b96>] background_writeout+0x86/0xc0
Oct  2 18:11:03 host [<c0142570>] __pdflush+0xc0/0x1c0
Oct  2 18:11:03 host [<c011a5d2>] set_user_nice+0xb2/0xd0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c014268a>] pdflush+0x1a/0x20
Oct  2 18:11:03 host [<c0141b10>] background_writeout+0x0/0xc0
Oct  2 18:11:03 host [<c0142670>] pdflush+0x0/0x20
Oct  2 18:11:03 host [<c01311a6>] kthread+0x96/0xe0
Oct  2 18:11:03 host [<c0131110>] kthread+0x0/0xe0
Oct  2 18:11:03 host [<c010136d>] kernel_thread_helper+0x5/0x18

#
# Automatically generated make config: don't edit
# Linux kernel version: 2.6.13
# Sun Oct  2 10:59:20 2005
#
CONFIG_X86=3Dy
CONFIG_MMU=3Dy
CONFIG_UID16=3Dy
CONFIG_GENERIC_ISA_DMA=3Dy
CONFIG_GENERIC_IOMAP=3Dy

#
# Code maturity level options
#
CONFIG_EXPERIMENTAL=3Dy
# CONFIG_CLEAN_COMPILE is not set
CONFIG_BROKEN=3Dy
CONFIG_BROKEN_ON_SMP=3Dy
CONFIG_LOCK_KERNEL=3Dy
CONFIG_INIT_ENV_ARG_LIMIT=3D32

#
# General setup
#
CONFIG_LOCALVERSION=3D""
CONFIG_SWAP=3Dy
CONFIG_SYSVIPC=3Dy
CONFIG_POSIX_MQUEUE=3Dy
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_SYSCTL=3Dy
# CONFIG_AUDIT is not set
CONFIG_HOTPLUG=3Dy
CONFIG_KOBJECT_UEVENT=3Dy
# CONFIG_IKCONFIG is not set
# CONFIG_EMBEDDED is not set
CONFIG_KALLSYMS=3Dy
# CONFIG_KALLSYMS_EXTRA_PASS is not set
CONFIG_PRINTK=3Dy
CONFIG_BUG=3Dy
CONFIG_BASE_FULL=3Dy
CONFIG_FUTEX=3Dy
CONFIG_EPOLL=3Dy
CONFIG_SHMEM=3Dy
CONFIG_CC_ALIGN_FUNCTIONS=3D0
CONFIG_CC_ALIGN_LABELS=3D0
CONFIG_CC_ALIGN_LOOPS=3D0
CONFIG_CC_ALIGN_JUMPS=3D0
# CONFIG_TINY_SHMEM is not set
CONFIG_BASE_SMALL=3D0

#
# Loadable module support
#
CONFIG_MODULES=3Dy
CONFIG_MODULE_UNLOAD=3Dy
CONFIG_MODULE_FORCE_UNLOAD=3Dy
CONFIG_OBSOLETE_MODPARM=3Dy
CONFIG_MODVERSIONS=3Dy
# CONFIG_MODULE_SRCVERSION_ALL is not set
CONFIG_KMOD=3Dy

#
# Processor type and features
#
CONFIG_X86_PC=3Dy
# CONFIG_X86_ELAN is not set
# CONFIG_X86_VOYAGER is not set
# CONFIG_X86_NUMAQ is not set
# CONFIG_X86_SUMMIT is not set
# CONFIG_X86_BIGSMP is not set
# CONFIG_X86_VISWS is not set
# CONFIG_X86_GENERICARCH is not set
# CONFIG_X86_ES7000 is not set
# CONFIG_M386 is not set
# CONFIG_M486 is not set
# CONFIG_M586 is not set
# CONFIG_M586TSC is not set
# CONFIG_M586MMX is not set
# CONFIG_M686 is not set
# CONFIG_MPENTIUMII is not set
# CONFIG_MPENTIUMIII is not set
CONFIG_MPENTIUMM=3Dy
# CONFIG_MPENTIUM4 is not set
# CONFIG_MK6 is not set
# CONFIG_MK7 is not set
# CONFIG_MK8 is not set
# CONFIG_MCRUSOE is not set
# CONFIG_MEFFICEON is not set
# CONFIG_MWINCHIPC6 is not set
# CONFIG_MWINCHIP2 is not set
# CONFIG_MWINCHIP3D is not set
# CONFIG_MGEODEGX1 is not set
# CONFIG_MCYRIXIII is not set
# CONFIG_MVIAC3_2 is not set
# CONFIG_X86_GENERIC is not set
CONFIG_X86_CMPXCHG=3Dy
CONFIG_X86_XADD=3Dy
CONFIG_X86_L1_CACHE_SHIFT=3D6
CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
CONFIG_X86_WP_WORKS_OK=3Dy
CONFIG_X86_INVLPG=3Dy
CONFIG_X86_BSWAP=3Dy
CONFIG_X86_POPAD_OK=3Dy
CONFIG_X86_GOOD_APIC=3Dy
CONFIG_X86_INTEL_USERCOPY=3Dy
CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
# CONFIG_HPET_TIMER is not set
# CONFIG_SMP is not set
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=3Dy
CONFIG_PREEMPT_BKL=3Dy
CONFIG_X86_UP_APIC=3Dy
CONFIG_X86_UP_IOAPIC=3Dy
CONFIG_X86_LOCAL_APIC=3Dy
CONFIG_X86_IO_APIC=3Dy
CONFIG_X86_TSC=3Dy
# CONFIG_X86_MCE is not set
# CONFIG_TOSHIBA is not set
# CONFIG_I8K is not set
# CONFIG_X86_REBOOTFIXUPS is not set
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
# CONFIG_X86_CPUID is not set

#
# Firmware Drivers
#
# CONFIG_EDD is not set
# CONFIG_NOHIGHMEM is not set
CONFIG_HIGHMEM4G=3Dy
# CONFIG_HIGHMEM64G is not set
CONFIG_HIGHMEM=3Dy
CONFIG_SELECT_MEMORY_MODEL=3Dy
CONFIG_FLATMEM_MANUAL=3Dy
# CONFIG_DISCONTIGMEM_MANUAL is not set
# CONFIG_SPARSEMEM_MANUAL is not set
CONFIG_FLATMEM=3Dy
CONFIG_FLAT_NODE_MEM_MAP=3Dy
# CONFIG_HIGHPTE is not set
# CONFIG_MATH_EMULATION is not set
CONFIG_MTRR=3Dy
# CONFIG_EFI is not set
CONFIG_HAVE_DEC_LOCK=3Dy
CONFIG_REGPARM=3Dy
# CONFIG_SECCOMP is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=3Dy
# CONFIG_HZ_1000 is not set
CONFIG_HZ=3D250
CONFIG_PHYSICAL_START=3D0x100000
# CONFIG_KEXEC is not set

#
# Power management options (ACPI, APM)
#
CONFIG_PM=3Dy
# CONFIG_PM_DEBUG is not set
# CONFIG_SOFTWARE_SUSPEND is not set

#
# ACPI (Advanced Configuration and Power Interface) Support
#
CONFIG_ACPI=3Dy
CONFIG_ACPI_BOOT=3Dy
CONFIG_ACPI_INTERPRETER=3Dy
CONFIG_ACPI_SLEEP=3Dy
CONFIG_ACPI_SLEEP_PROC_FS=3Dy
# CONFIG_ACPI_SLEEP_PROC_SLEEP is not set
CONFIG_ACPI_AC=3Dy
CONFIG_ACPI_BATTERY=3Dy
CONFIG_ACPI_BUTTON=3Dy
CONFIG_ACPI_VIDEO=3Dy
# CONFIG_ACPI_HOTKEY is not set
# CONFIG_ACPI_FAN is not set
CONFIG_ACPI_PROCESSOR=3Dy
CONFIG_ACPI_THERMAL=3Dy
# CONFIG_ACPI_ASUS is not set
CONFIG_ACPI_IBM=3Dy
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_ACPI_BLACKLIST_YEAR=3D0
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_BUS=3Dy
CONFIG_ACPI_EC=3Dy
CONFIG_ACPI_POWER=3Dy
CONFIG_ACPI_PCI=3Dy
CONFIG_ACPI_SYSTEM=3Dy
# CONFIG_X86_PM_TIMER is not set
# CONFIG_ACPI_CONTAINER is not set

#
# APM (Advanced Power Management) BIOS Support
#
# CONFIG_APM is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
CONFIG_CPU_FREQ_TABLE=3Dy
# CONFIG_CPU_FREQ_DEBUG is not set
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
# CONFIG_CPU_FREQ_GOV_PERFORMANCE is not set
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy

#
# CPUFreq processor drivers
#
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
# CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI is not set
CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
# CONFIG_X86_SPEEDSTEP_ICH is not set
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_CPUFREQ_NFORCE2 is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set

#
# shared options
#
# CONFIG_X86_SPEEDSTEP_LIB is not set

#
# Bus options (PCI, PCMCIA, EISA, MCA, ISA)
#
CONFIG_PCI=3Dy
# CONFIG_PCI_GOBIOS is not set
# CONFIG_PCI_GOMMCONFIG is not set
# CONFIG_PCI_GODIRECT is not set
CONFIG_PCI_GOANY=3Dy
CONFIG_PCI_BIOS=3Dy
CONFIG_PCI_DIRECT=3Dy
CONFIG_PCI_MMCONFIG=3Dy
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCI_MSI=3Dy
# CONFIG_PCI_LEGACY_PROC is not set
CONFIG_PCI_NAMES=3Dy
CONFIG_ISA_DMA_API=3Dy
# CONFIG_ISA is not set
# CONFIG_MCA is not set
# CONFIG_SCx200 is not set

#
# PCCARD (PCMCIA/CardBus) support
#
# CONFIG_PCCARD is not set

#
# PCI Hotplug Support
#
# CONFIG_HOTPLUG_PCI is not set

#
# Executable file formats
#
CONFIG_BINFMT_ELF=3Dy
# CONFIG_BINFMT_AOUT is not set
# CONFIG_BINFMT_MISC is not set

#
# Networking
#
CONFIG_NET=3Dy

#
# Networking options
#
CONFIG_PACKET=3Dy
# CONFIG_PACKET_MMAP is not set
CONFIG_UNIX=3Dy
# CONFIG_NET_KEY is not set
CONFIG_INET=3Dy
CONFIG_IP_MULTICAST=3Dy
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_FIB_HASH=3Dy
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE is not set
# CONFIG_IP_MROUTE is not set
# CONFIG_ARPD is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_TUNNEL is not set
# CONFIG_IP_TCPDIAG is not set
# CONFIG_IP_TCPDIAG_IPV6 is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_BIC=3Dy

#
# IP: Virtual Server Configuration
#
# CONFIG_IP_VS is not set
# CONFIG_IPV6 is not set
CONFIG_NETFILTER=3Dy
# CONFIG_NETFILTER_DEBUG is not set

#
# IP: Netfilter Configuration
#
# CONFIG_IP_NF_CONNTRACK is not set
# CONFIG_IP_NF_CONNTRACK_MARK is not set
# CONFIG_IP_NF_QUEUE is not set
# CONFIG_IP_NF_IPTABLES is not set
# CONFIG_IP_NF_ARPTABLES is not set

#
# SCTP Configuration (EXPERIMENTAL)
#
# CONFIG_IP_SCTP is not set
# CONFIG_ATM is not set
# CONFIG_BRIDGE is not set
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_NET_DIVERT is not set
# CONFIG_ECONET is not set
# CONFIG_WAN_ROUTER is not set
# CONFIG_NET_SCHED is not set
# CONFIG_NET_CLS_ROUTE is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_HAMRADIO is not set
# CONFIG_IRDA is not set
CONFIG_BT=3Dy
CONFIG_BT_L2CAP=3Dm
CONFIG_BT_SCO=3Dm
CONFIG_BT_RFCOMM=3Dm
CONFIG_BT_RFCOMM_TTY=3Dy
CONFIG_BT_BNEP=3Dm
CONFIG_BT_BNEP_MC_FILTER=3Dy
CONFIG_BT_BNEP_PROTO_FILTER=3Dy
CONFIG_BT_HIDP=3Dm

#
# Bluetooth device drivers
#
CONFIG_BT_HCIUSB=3Dm
CONFIG_BT_HCIUSB_SCO=3Dy
# CONFIG_BT_HCIUART is not set
# CONFIG_BT_HCIBCM203X is not set
# CONFIG_BT_HCIBPA10X is not set
# CONFIG_BT_HCIBFUSB is not set
# CONFIG_BT_HCIVHCI is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_STANDALONE=3Dy
CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
CONFIG_FW_LOADER=3Dy

#
# Memory Technology Devices (MTD)
#
# CONFIG_MTD is not set

#
# Parallel port support
#
CONFIG_PARPORT=3Dy
CONFIG_PARPORT_PC=3Dy
# CONFIG_PARPORT_PC_FIFO is not set
# CONFIG_PARPORT_PC_SUPERIO is not set
# CONFIG_PARPORT_GSC is not set
# CONFIG_PARPORT_1284 is not set

#
# Plug and Play support
#
# CONFIG_PNP is not set

#
# Block devices
#
# CONFIG_BLK_DEV_FD is not set
# CONFIG_PARIDE is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=3Dy
CONFIG_BLK_DEV_CRYPTOLOOP=3Dy
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_SX8 is not set
# CONFIG_BLK_DEV_UB is not set
# CONFIG_BLK_DEV_RAM is not set
CONFIG_BLK_DEV_RAM_COUNT=3D16
CONFIG_INITRAMFS_SOURCE=3D""
# CONFIG_LBD is not set
CONFIG_CDROM_PKTCDVD=3Dy
CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
# CONFIG_CDROM_PKTCDVD_WCACHE is not set

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=3Dy
# CONFIG_IOSCHED_AS is not set
# CONFIG_IOSCHED_DEADLINE is not set
CONFIG_IOSCHED_CFQ=3Dy
# CONFIG_ATA_OVER_ETH is not set

#
# ATA/ATAPI/MFM/RLL support
#
CONFIG_IDE=3Dy
CONFIG_BLK_DEV_IDE=3Dy

#
# Please see Documentation/ide.txt for help/info on IDE drives
#
# CONFIG_BLK_DEV_IDE_SATA is not set
# CONFIG_BLK_DEV_HD_IDE is not set
CONFIG_BLK_DEV_IDEDISK=3Dy
CONFIG_IDEDISK_MULTI_MODE=3Dy
CONFIG_BLK_DEV_IDECD=3Dy
# CONFIG_BLK_DEV_IDETAPE is not set
# CONFIG_BLK_DEV_IDEFLOPPY is not set
# CONFIG_BLK_DEV_IDESCSI is not set
# CONFIG_IDE_TASK_IOCTL is not set

#
# IDE chipset support/bugfixes
#
# CONFIG_IDE_GENERIC is not set
# CONFIG_BLK_DEV_CMD640 is not set
CONFIG_BLK_DEV_IDEPCI=3Dy
CONFIG_IDEPCI_SHARE_IRQ=3Dy
# CONFIG_BLK_DEV_OFFBOARD is not set
# CONFIG_BLK_DEV_GENERIC is not set
# CONFIG_BLK_DEV_OPTI621 is not set
# CONFIG_BLK_DEV_RZ1000 is not set
CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
# CONFIG_BLK_DEV_IDEDMA_FORCED is not set
CONFIG_IDEDMA_PCI_AUTO=3Dy
# CONFIG_IDEDMA_ONLYDISK is not set
# CONFIG_BLK_DEV_AEC62XX is not set
# CONFIG_BLK_DEV_ALI15X3 is not set
# CONFIG_BLK_DEV_AMD74XX is not set
# CONFIG_BLK_DEV_ATIIXP is not set
# CONFIG_BLK_DEV_CMD64X is not set
# CONFIG_BLK_DEV_TRIFLEX is not set
# CONFIG_BLK_DEV_CY82C693 is not set
# CONFIG_BLK_DEV_CS5520 is not set
# CONFIG_BLK_DEV_CS5530 is not set
# CONFIG_BLK_DEV_HPT34X is not set
# CONFIG_BLK_DEV_HPT366 is not set
# CONFIG_BLK_DEV_SC1200 is not set
CONFIG_BLK_DEV_PIIX=3Dy
# CONFIG_BLK_DEV_IT821X is not set
# CONFIG_BLK_DEV_NS87415 is not set
# CONFIG_BLK_DEV_PDC202XX_OLD is not set
# CONFIG_BLK_DEV_PDC202XX_NEW is not set
# CONFIG_BLK_DEV_SVWKS is not set
# CONFIG_BLK_DEV_SIIMAGE is not set
# CONFIG_BLK_DEV_SIS5513 is not set
# CONFIG_BLK_DEV_SLC90E66 is not set
# CONFIG_BLK_DEV_TRM290 is not set
# CONFIG_BLK_DEV_VIA82CXXX is not set
# CONFIG_IDE_ARM is not set
CONFIG_BLK_DEV_IDEDMA=3Dy
# CONFIG_IDEDMA_IVB is not set
CONFIG_IDEDMA_AUTO=3Dy
# CONFIG_BLK_DEV_HD is not set

#
# SCSI device support
#
CONFIG_SCSI=3Dy
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=3Dy
# CONFIG_CHR_DEV_ST is not set
# CONFIG_CHR_DEV_OSST is not set
CONFIG_BLK_DEV_SR=3Dy
# CONFIG_BLK_DEV_SR_VENDOR is not set
CONFIG_CHR_DEV_SG=3Dy
# CONFIG_CHR_DEV_SCH is not set

#
# Some SCSI devices (e.g. CD jukebox) support multiple LUNs
#
# CONFIG_SCSI_MULTI_LUN is not set
# CONFIG_SCSI_CONSTANTS is not set
# CONFIG_SCSI_LOGGING is not set

#
# SCSI Transport Attributes
#
# CONFIG_SCSI_SPI_ATTRS is not set
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set

#
# SCSI low-level drivers
#
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC7XXX_OLD is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_SCSI_SATA is not set
# CONFIG_SCSI_BUSLOGIC is not set
# CONFIG_SCSI_CPQFCTS is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_EATA is not set
# CONFIG_SCSI_EATA_PIO is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_GDTH is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_PPA is not set
# CONFIG_SCSI_IMM is not set
# CONFIG_SCSI_SYM53C8XX_2 is not set
# CONFIG_SCSI_IPR is not set
# CONFIG_SCSI_QLOGIC_ISP is not set
# CONFIG_SCSI_QLOGIC_FC is not set
# CONFIG_SCSI_QLOGIC_1280 is not set
CONFIG_SCSI_QLA2XXX=3Dy
# CONFIG_SCSI_QLA21XX is not set
# CONFIG_SCSI_QLA22XX is not set
# CONFIG_SCSI_QLA2300 is not set
# CONFIG_SCSI_QLA2322 is not set
# CONFIG_SCSI_QLA6312 is not set
# CONFIG_SCSI_QLA24XX is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_NSP32 is not set
# CONFIG_SCSI_DEBUG is not set

#
# Multi-device support (RAID and LVM)
#
CONFIG_MD=3Dy
# CONFIG_BLK_DEV_MD is not set
CONFIG_BLK_DEV_DM=3Dy
CONFIG_DM_CRYPT=3Dy
# CONFIG_DM_SNAPSHOT is not set
# CONFIG_DM_MIRROR is not set
# CONFIG_DM_ZERO is not set
# CONFIG_DM_MULTIPATH is not set

#
# Fusion MPT device support
#
# CONFIG_FUSION is not set
# CONFIG_FUSION_SPI is not set
# CONFIG_FUSION_FC is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_IEEE1394 is not set

#
# I2O device support
#
# CONFIG_I2O is not set

#
# Network device support
#
CONFIG_NETDEVICES=3Dy
# CONFIG_DUMMY is not set
# CONFIG_BONDING is not set
# CONFIG_EQUALIZER is not set
CONFIG_TUN=3Dm

#
# ARCnet devices
#
# CONFIG_ARCNET is not set

#
# Ethernet (10 or 100Mbit)
#
# CONFIG_NET_ETHERNET is not set

#
# Ethernet (1000 Mbit)
#
# CONFIG_ACENIC is not set
# CONFIG_DL2K is not set
CONFIG_E1000=3Dy
# CONFIG_E1000_NAPI is not set
# CONFIG_NS83820 is not set
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
# CONFIG_R8169 is not set
# CONFIG_SKGE is not set
# CONFIG_SK98LIN is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2 is not set

#
# Ethernet (10000 Mbit)
#
# CONFIG_IXGB is not set
# CONFIG_S2IO is not set

#
# Token Ring devices
#
# CONFIG_TR is not set

#
# Wireless LAN (non-hamradio)
#
CONFIG_NET_RADIO=3Dy

#
# Obsolete Wireless cards support (pre-802.11)
#
# CONFIG_STRIP is not set

#
# Wireless 802.11b ISA/PCI cards support
#
# CONFIG_HERMES is not set
# CONFIG_ATMEL is not set

#
# Prism GT/Duette 802.11(a/b/g) PCI/Cardbus support
#
# CONFIG_PRISM54 is not set
CONFIG_NET_WIRELESS=3Dy

#
# Wan interfaces
#
# CONFIG_WAN is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set
# CONFIG_NET_FC is not set
# CONFIG_SHAPER is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set

#
# ISDN subsystem
#
# CONFIG_ISDN is not set

#
# Telephony Support
#
# CONFIG_PHONE is not set

#
# Input device support
#
CONFIG_INPUT=3Dy

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=3Dy
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1400
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D1050
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_TSDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=3Dy
CONFIG_KEYBOARD_ATKBD=3Dy
# CONFIG_KEYBOARD_SUNKBD is not set
# CONFIG_KEYBOARD_LKKBD is not set
# CONFIG_KEYBOARD_XTKBD is not set
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_INPUT_MOUSE=3Dy
CONFIG_MOUSE_PS2=3Dy
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=3Dy
CONFIG_SERIO_I8042=3Dy
# CONFIG_SERIO_SERPORT is not set
# CONFIG_SERIO_CT82C710 is not set
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=3Dy
# CONFIG_SERIO_RAW is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_VT=3Dy
CONFIG_VT_CONSOLE=3Dy
CONFIG_HW_CONSOLE=3Dy
# CONFIG_SERIAL_NONSTANDARD is not set

#
# Serial drivers
#
# CONFIG_SERIAL_8250 is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_JSM is not set
CONFIG_UNIX98_PTYS=3Dy
# CONFIG_LEGACY_PTYS is not set
# CONFIG_PRINTER is not set
# CONFIG_PPDEV is not set
# CONFIG_TIPAR is not set

#
# IPMI
#
# CONFIG_IPMI_HANDLER is not set

#
# Watchdog Cards
#
# CONFIG_WATCHDOG is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_NVRAM is not set
CONFIG_RTC=3Dy
# CONFIG_DTLK is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_SONYPI is not set

#
# Ftape, the floppy tape device driver
#
# CONFIG_FTAPE is not set
CONFIG_AGP=3Dy
# CONFIG_AGP_ALI is not set
CONFIG_AGP_ATI=3Dy
# CONFIG_AGP_AMD is not set
# CONFIG_AGP_AMD64 is not set
# CONFIG_AGP_INTEL is not set
# CONFIG_AGP_NVIDIA is not set
# CONFIG_AGP_SIS is not set
# CONFIG_AGP_SWORKS is not set
# CONFIG_AGP_VIA is not set
# CONFIG_AGP_EFFICEON is not set
# CONFIG_DRM is not set
# CONFIG_MWAVE is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set

#
# TPM devices
#
# CONFIG_TCG_TPM is not set

#
# I2C support
#
CONFIG_I2C=3Dy
# CONFIG_I2C_CHARDEV is not set

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=3Dy
# CONFIG_I2C_ALGOPCF is not set
# CONFIG_I2C_ALGOPCA is not set

#
# I2C Hardware Bus support
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_I810 is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_ISA is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_PARPORT is not set
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_PROSAVAGE is not set
# CONFIG_I2C_SAVAGE4 is not set
# CONFIG_SCx200_ACB is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_STUB is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set
# CONFIG_I2C_VOODOO3 is not set
# CONFIG_I2C_PCA_ISA is not set
# CONFIG_I2C_SENSOR is not set

#
# Miscellaneous I2C Chip support
#
# CONFIG_SENSORS_DS1337 is not set
# CONFIG_SENSORS_DS1374 is not set
# CONFIG_SENSORS_EEPROM is not set
# CONFIG_SENSORS_PCF8574 is not set
# CONFIG_SENSORS_PCA9539 is not set
# CONFIG_SENSORS_PCF8591 is not set
# CONFIG_SENSORS_RTC8564 is not set
# CONFIG_SENSORS_MAX6875 is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# CONFIG_I2C_DEBUG_CHIP is not set

#
# Dallas's 1-wire bus
#
# CONFIG_W1 is not set

#
# Hardware Monitoring support
#
# CONFIG_HWMON is not set

#
# Misc devices
#
# CONFIG_IBM_ASM is not set

#
# Multimedia devices
#
# CONFIG_VIDEO_DEV is not set

#
# Digital Video Broadcasting Devices
#
# CONFIG_DVB is not set

#
# Graphics support
#
# CONFIG_FB is not set
CONFIG_VIDEO_SELECT=3Dy

#
# Console display driver support
#
CONFIG_VGA_CONSOLE=3Dy
CONFIG_DUMMY_CONSOLE=3Dy

#
# Sound
#
CONFIG_SOUND=3Dy

#
# Advanced Linux Sound Architecture
#
CONFIG_SND=3Dy
CONFIG_SND_TIMER=3Dy
CONFIG_SND_PCM=3Dy
# CONFIG_SND_SEQUENCER is not set
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
CONFIG_SND_RTCTIMER=3Dy
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set

#
# Generic devices
#
# CONFIG_SND_DUMMY is not set
# CONFIG_SND_MTPAV is not set
# CONFIG_SND_SERIAL_U16550 is not set
# CONFIG_SND_MPU401 is not set

#
# PCI devices
#
CONFIG_SND_AC97_CODEC=3Dy
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_YMFPCI is not set
# CONFIG_SND_ALS4000 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
CONFIG_SND_INTEL8X0=3Dy
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_HDA_INTEL is not set

#
# USB devices
#
# CONFIG_SND_USB_AUDIO is not set
# CONFIG_SND_USB_USX2Y is not set

#
# Open Sound System
#
# CONFIG_SOUND_PRIME is not set

#
# USB support
#
CONFIG_USB_ARCH_HAS_HCD=3Dy
CONFIG_USB_ARCH_HAS_OHCI=3Dy
CONFIG_USB=3Dy
# CONFIG_USB_DEBUG is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEVICEFS=3Dy
# CONFIG_USB_BANDWIDTH is not set
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_SUSPEND is not set
# CONFIG_USB_OTG is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_EHCI_HCD=3Dy
# CONFIG_USB_EHCI_SPLIT_ISO is not set
# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_OHCI_HCD is not set
CONFIG_USB_UHCI_HCD=3Dy
# CONFIG_USB_SL811_HCD is not set

#
# USB Device Class drivers
#
# CONFIG_USB_AUDIO is not set

#
# USB Bluetooth TTY can only be used with disabled Bluetooth subsystem
#
# CONFIG_USB_MIDI is not set
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set

#
# NOTE: USB_STORAGE enables SCSI, and 'SCSI disk support' may also be
needed; see USB_STORAGE Help for more information
#
CONFIG_USB_STORAGE=3Dy
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_DPCM is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set

#
# USB Input Devices
#
CONFIG_USB_HID=3Dy
CONFIG_USB_HIDINPUT=3Dy
# CONFIG_HID_FF is not set
# CONFIG_USB_HIDDEV is not set
# CONFIG_USB_AIPTEK is not set
# CONFIG_USB_WACOM is not set
# CONFIG_USB_ACECAD is not set
# CONFIG_USB_KBTAB is not set
# CONFIG_USB_POWERMATE is not set
# CONFIG_USB_MTOUCH is not set
# CONFIG_USB_ITMTOUCH is not set
# CONFIG_USB_EGALAX is not set
# CONFIG_USB_XPAD is not set
# CONFIG_USB_ATI_REMOTE is not set
# CONFIG_USB_KEYSPAN_REMOTE is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set

#
# USB Multimedia devices
#
# CONFIG_USB_DABUSB is not set

#
# Video4Linux support is needed for USB Multimedia device support
#

#
# USB Network Adapters
#
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_ZD1201 is not set
# CONFIG_USB_MON is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set

#
# USB Serial Converter support
#
CONFIG_USB_SERIAL=3Dy
# CONFIG_USB_SERIAL_CONSOLE is not set
# CONFIG_USB_SERIAL_GENERIC is not set
# CONFIG_USB_SERIAL_AIRPRIME is not set
# CONFIG_USB_SERIAL_BELKIN is not set
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP2101 is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
CONFIG_USB_SERIAL_FTDI_SIO=3Dy
# CONFIG_USB_SERIAL_VISOR is not set
# CONFIG_USB_SERIAL_IPAQ is not set
# CONFIG_USB_SERIAL_IR is not set
# CONFIG_USB_SERIAL_EDGEPORT is not set
# CONFIG_USB_SERIAL_EDGEPORT_TI is not set
# CONFIG_USB_SERIAL_GARMIN is not set
# CONFIG_USB_SERIAL_IPW is not set
# CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
# CONFIG_USB_SERIAL_KEYSPAN is not set
# CONFIG_USB_SERIAL_KLSI is not set
# CONFIG_USB_SERIAL_KOBIL_SCT is not set
# CONFIG_USB_SERIAL_MCT_U232 is not set
# CONFIG_USB_SERIAL_PL2303 is not set
# CONFIG_USB_SERIAL_HP4X is not set
# CONFIG_USB_SERIAL_SAFE is not set
# CONFIG_USB_SERIAL_TI is not set
# CONFIG_USB_SERIAL_CYBERJACK is not set
# CONFIG_USB_SERIAL_XIRCOM is not set
# CONFIG_USB_SERIAL_OMNINET is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_AUERSWALD is not set
# CONFIG_USB_RIO500 is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_LED is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_PHIDGETKIT is not set
# CONFIG_USB_PHIDGETSERVO is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TEST is not set

#
# USB DSL modem support
#

#
# USB Gadget Support
#
# CONFIG_USB_GADGET is not set

#
# MMC/SD Card support
#
# CONFIG_MMC is not set

#
# InfiniBand support
#
# CONFIG_INFINIBAND is not set

#
# SN Devices
#

#
# File systems
#
CONFIG_EXT2_FS=3Dm
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT2_FS_XIP is not set
CONFIG_EXT3_FS=3Dm
CONFIG_EXT3_FS_XATTR=3Dy
# CONFIG_EXT3_FS_POSIX_ACL is not set
# CONFIG_EXT3_FS_SECURITY is not set
CONFIG_JBD=3Dm
# CONFIG_JBD_DEBUG is not set
CONFIG_FS_MBCACHE=3Dm
CONFIG_REISER4_FS=3Dy
# CONFIG_REISER4_DEBUG is not set
# CONFIG_REISERFS_FS is not set
# CONFIG_JFS_FS is not set
# CONFIG_FS_POSIX_ACL is not set

#
# XFS support
#
# CONFIG_XFS_FS is not set
# CONFIG_MINIX_FS is not set
# CONFIG_ROMFS_FS is not set
# CONFIG_INOTIFY is not set
# CONFIG_QUOTA is not set
CONFIG_DNOTIFY=3Dy
# CONFIG_AUTOFS_FS is not set
# CONFIG_AUTOFS4_FS is not set

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=3Dy
CONFIG_JOLIET=3Dy
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=3Dy
CONFIG_UDF_NLS=3Dy

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=3Dm
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=3Dm
CONFIG_FAT_DEFAULT_CODEPAGE=3D437
CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=3Dy
CONFIG_PROC_KCORE=3Dy
CONFIG_SYSFS=3Dy
# CONFIG_DEVPTS_FS_XATTR is not set
CONFIG_TMPFS=3Dy
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLBFS is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_RAMFS=3Dy

#
# Miscellaneous filesystems
#
# CONFIG_ADFS_FS is not set
# CONFIG_AFFS_FS is not set
# CONFIG_HFS_FS is not set
# CONFIG_HFSPLUS_FS is not set
# CONFIG_BEFS_FS is not set
# CONFIG_BFS_FS is not set
# CONFIG_EFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_VXFS_FS is not set
# CONFIG_HPFS_FS is not set
# CONFIG_QNX4FS_FS is not set
# CONFIG_SYSV_FS is not set
# CONFIG_UFS_FS is not set

#
# Network File Systems
#
CONFIG_NFS_FS=3Dm
# CONFIG_NFS_V3 is not set
CONFIG_NFS_V4=3Dy
# CONFIG_NFS_DIRECTIO is not set
CONFIG_NFSD=3Dm
# CONFIG_NFSD_V3 is not set
CONFIG_NFSD_TCP=3Dy
CONFIG_LOCKD=3Dm
CONFIG_EXPORTFS=3Dm
CONFIG_NFS_COMMON=3Dy
CONFIG_SUNRPC=3Dm
CONFIG_SUNRPC_GSS=3Dm
CONFIG_RPCSEC_GSS_KRB5=3Dm
# CONFIG_RPCSEC_GSS_SPKM3 is not set
CONFIG_SMB_FS=3Dm
# CONFIG_SMB_NLS_DEFAULT is not set
# CONFIG_CIFS is not set
# CONFIG_NCP_FS is not set
# CONFIG_CODA_FS is not set
# CONFIG_AFS_FS is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=3Dy

#
# Native Language Support
#
CONFIG_NLS=3Dy
CONFIG_NLS_DEFAULT=3D"utf8"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
# CONFIG_NLS_CODEPAGE_850 is not set
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
# CONFIG_NLS_ASCII is not set
# CONFIG_NLS_ISO8859_1 is not set
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
CONFIG_NLS_UTF8=3Dy

#
# Profiling support
#
# CONFIG_PROFILING is not set

#
# Kernel hacking
#
# CONFIG_PRINTK_TIME is not set
# CONFIG_DEBUG_KERNEL is not set
CONFIG_LOG_BUF_SHIFT=3D14
CONFIG_DEBUG_BUGVERBOSE=3Dy
CONFIG_EARLY_PRINTK=3Dy
CONFIG_X86_FIND_SMP_CONFIG=3Dy
CONFIG_X86_MPPARSE=3Dy

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY is not set

#
# Cryptographic options
#
CONFIG_CRYPTO=3Dy
# CONFIG_CRYPTO_HMAC is not set
# CONFIG_CRYPTO_NULL is not set
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=3Dy
# CONFIG_CRYPTO_SHA1 is not set
# CONFIG_CRYPTO_SHA256 is not set
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_WP512 is not set
# CONFIG_CRYPTO_TGR192 is not set
CONFIG_CRYPTO_DES=3Dy
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_TWOFISH is not set
# CONFIG_CRYPTO_SERPENT is not set
CONFIG_CRYPTO_AES_586=3Dy
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_ARC4 is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_CRC32C is not set
# CONFIG_CRYPTO_TEST is not set

#
# Hardware crypto devices
#
# CONFIG_CRYPTO_DEV_PADLOCK is not set

#
# Library routines
#
# CONFIG_CRC_CCITT is not set
CONFIG_CRC32=3Dy
# CONFIG_LIBCRC32C is not set
CONFIG_ZLIB_INFLATE=3Dy
CONFIG_ZLIB_DEFLATE=3Dy
CONFIG_GENERIC_HARDIRQS=3Dy
CONFIG_GENERIC_IRQ_PROBE=3Dy
CONFIG_X86_BIOS_REBOOT=3Dy
CONFIG_PC=3Dy
