From: Alexander Skwar <listen@alexander.skwar.name>
Subject: Re: 2.6.13 + reiser4 = scheduling while atomic
Date: Sun, 02 Oct 2005 21:30:40 +0200
Message-ID: <43403560.2060807@mid.email-server.info>
References: <623652d50510021049l66c481d4v@mail.gmail.com>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26376-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <623652d50510021049l66c481d4v@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: reiserfs-list@namesys.com

Chris Bainbridge schrieb:
> Hi,
> 
> Today I updated from vanilla 2.6.12.5 + reiser4 to vanilla 2.6.13 +
> reiser4-for-2.6.13-1.patch + spin_macros patch from this list.
> 
> I'm now seeing the following errors which I have not seen before.
> Kernel config follows error log.

Same here. I use 2.6.13-gentoo-r2 gentoo-sources-2.6.13-r2
with reiser4-for-2.6.13-1.patch + spin_macros. I get:

Oct  2 19:36:10 server scheduling while atomic: pdflush/0x00000001/15417
Oct  2 19:36:10 server [<c0293557>] schedule+0x567/0x630
Oct  2 19:36:10 server [<c023bd13>] __ide_do_rw_disk+0x353/0x480
Oct  2 19:36:10 server [<c0229fd6>] __cfq_dispatch_requests+0x76/0x230
Oct  2 19:36:10 server [<c0224244>] __generic_unplug_device+0x14/0x30
Oct  2 19:36:10 server [<c0224271>] generic_unplug_device+0x11/0x30
Oct  2 19:36:10 server [<e085a962>] dm_table_unplug_all+0x32/0x40 [dm_mod]
Oct  2 19:36:10 server [<c0293e7e>] io_schedule+0xe/0x20
Oct  2 19:36:10 server [<c0135029>] sync_page+0x39/0x50
Oct  2 19:36:10 server [<c0294052>] __wait_on_bit+0x42/0x70
Oct  2 19:36:10 server [<c0134ff0>] sync_page+0x0/0x50
Oct  2 19:36:10 server [<c01357bc>] wait_on_page_bit+0xac/0xc0
Oct  2 19:36:10 server [<c012b790>] wake_bit_function+0x0/0x60
Oct  2 19:36:10 server [<c012b790>] wake_bit_function+0x0/0x60
Oct  2 19:36:10 server [<e2b2e095>] jwait_io+0x45/0x60 [reiser4]
Oct  2 19:36:10 server [<e2b407cc>] update_journal_footer+0x7c/0xa0 [reiser4]
Oct  2 19:36:10 server [<e2b41624>] reiser4_write_logs+0x234/0x2e0 [reiser4]
Oct  2 19:36:10 server [<c0224271>] generic_unplug_device+0x11/0x30
Oct  2 19:36:10 server [<e2b39e71>] commit_current_atom+0x131/0x220 [reiser4]
Oct  2 19:36:10 server [<e2b3a8e9>] try_commit_txnh+0xe9/0x1c0 [reiser4]
Oct  2 19:36:10 server [<e2b3a9ef>] commit_txnh+0x2f/0xb0 [reiser4]
Oct  2 19:36:10 server [<e2b395e5>] txn_end+0x25/0x30 [reiser4]
Oct  2 19:36:10 server [<e2b395f8>] txn_restart+0x8/0x20 [reiser4]
Oct  2 19:36:10 server [<e2b3a612>] flush_some_atom+0x2f2/0x380 [reiser4]
Oct  2 19:36:10 server [<e2b4a9ac>] writeout+0x10c/0x1d0 [reiser4]
Oct  2 19:36:10 server [<e2b471b7>] reiser4_sync_inodes+0x57/0xc0 [reiser4]
Oct  2 19:36:10 server [<e2b47160>] reiser4_sync_inodes+0x0/0xc0 [reiser4]
Oct  2 19:36:10 server [<c0176a59>] sync_sb_inodes+0x19/0x20
Oct  2 19:36:10 server [<c0176b1c>] writeback_inodes+0xbc/0xf0
Oct  2 19:36:10 server [<c013b9c5>] background_writeout+0x85/0xc0
Oct  2 19:36:10 server [<c013c360>] __pdflush+0xc0/0x1e0
Oct  2 19:36:10 server [<c01145a0>] set_user_nice+0xb0/0xd0
Oct  2 19:36:10 server [<c013c480>] pdflush+0x0/0x20
Oct  2 19:36:10 server [<c013c49a>] pdflush+0x1a/0x20
Oct  2 19:36:10 server [<c013b940>] background_writeout+0x0/0xc0
Oct  2 19:36:10 server [<c013c480>] pdflush+0x0/0x20
Oct  2 19:36:10 server [<c012b245>] kthread+0x95/0xd0
Oct  2 19:36:10 server [<c012b1b0>] kthread+0x0/0xd0
Oct  2 19:36:10 server [<c0100efd>] kernel_thread_helper+0x5/0x18

Alexander Skwar
