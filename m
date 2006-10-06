From: David Masover <ninja@slaphack.com>
Subject: Reiser4 crash (?)
Date: Fri, 06 Oct 2006 02:32:32 -0500
Message-ID: <45260690.1030904@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
 protocol="application/pgp-signature";
 boundary="------------enigCE08F8A76C5DB6E146B5063B"
Return-path: <reiserfs-list-return-30011-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------enigCE08F8A76C5DB6E146B5063B
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Finally set up network logging:  kernel -> syslog-ng -> TCP (crossover)
-> syslog-ng (other box) -> log file.  This time, I actually caught
something from the crash.  It may be hardware-related, but I thought I'd
report it here this time because the crash was definitely in Reiser4
code.  This may or may not be relevant:

Oct  6 02:15:27 elite irq event 217: bogus return value 8027d751
Oct  6 02:15:27 elite
Oct  6 02:15:27 elite Call Trace: <IRQ>
<ffffffff8028f765>{__report_bad_irq+53}
Oct  6 02:15:27 elite <ffffffff8028f812>{note_interrupt+82}
<ffffffff8028f1e9>{_
_do_IRQ+169}
Oct  6 02:15:27 elite <ffffffff802611e2>{do_IRQ+66}
<ffffffff8025f290>{default_i
dle+0}
Oct  6 02:15:27 elite <ffffffff802582ac>{ret_from_intr+0} <EOI>
<ffffffff8025a76
f>{thread_return+0}
Oct  6 02:15:27 elite <ffffffff8025f2ba>{default_idle+42}
<ffffffff8024592d>{cpu
_idle+61}
Oct  6 02:15:27 elite <ffffffff8048384f>{start_kernel+495}
<ffffffff80483255>{_s
inittext+597}
Oct  6 02:15:27 elite handlers:
Oct  6 02:15:27 elite [<ffffffff8033cea0>] (usb_hcd_irq+0x0/0x60)
Oct  6 02:15:27 elite [<ffffffff880b55a0>] (nv_nic_irq+0x0/0x180
[forcedeth])

This message repeated a couple of times beforehand.  The only log
entries between that and the crash are my ntpd, apparently trying to set
the clock, apparently not bothering to actually do it:

Oct  6 02:16:03 elite ntpd[4996]: adjusting local clock by -2012.380177s
Oct  6 02:19:55 elite ntpd[4996]: adjusting local clock by -2012.350292s
Oct  6 02:20:25 elite ntpd[4996]: adjusting local clock by -2012.088300s
Oct  6 02:24:42 elite ntpd[4996]: adjusting local clock by -2011.895028s
Oct  6 02:27:58 elite ntpd[4996]: adjusting local clock by -2011.637006s
Oct  6 02:32:12 elite ntpd[4996]: adjusting local clock by -2011.575243s
Oct  6 02:33:15 elite ntpd[4996]: adjusting local clock by -2011.448711s
Oct  6 02:35:23 elite ntpd[4996]: adjusting local clock by -2011.293673s

I can't believe my clock is skewed that badly, especially when I
manually restart it, I get log entries like this:

Oct  5 04:05:50 grunt ntpd[6601]: adjusting local clock by -0.146991s

I believe this is the crash, though:

Oct  6 02:38:36 elite Unable to handle kernel NULL pointer dereference
at 000000
0000000038 RIP:
Oct  6 02:38:36 elite
<ffffffff880808e7>{:reiser4:search_one_bitmap_forward+135}
Oct  6 02:38:36 elite PGD 7552e067 PUD 7de47067 PMD 0
Oct  6 02:38:36 elite Oops: 0000 [1]
Oct  6 02:38:36 elite CPU 0
Oct  6 02:38:36 elite Modules linked in: xt_tcpudp xt_state ip_conntrack
iptable
_filter ip_tables nfnetlink_queue nfnetlink xt_NFQUEUE x_tables nfs nfsd
exportf
s lockd sunrpc snd_seq_midi snd_emu10k1_synth snd_emux_synth
snd_seq_virmidi snd
_seq_midi_emul snd_pcm_oss snd_mixer_oss snd_seq_dummy snd_seq_oss
snd_seq_midi_
event snd_seq snd_emu10k1 snd_rawmidi snd_ac97_codec snd_ac97_bus
snd_pcm snd_se
q_device snd_timer snd_page_alloc snd_util_mem snd_hwdep snd soundcore
nvidia af
_packet usb_storage joydev ide_cd cdrom amd74xx ide_core sk98lin
forcedeth unix
reiser4 dm_mod sd_mod sata_nv libata scsi_mod
Oct  6 02:38:36 elite Pid: 428, comm: ktxnmgrd:dm-4:r Tainted: P
2.6.17.13
#2
Oct  6 02:38:36 elite RIP: 0010:[<ffffffff880808e7>]
<ffffffff880808e7>{:reiser4
:search_one_bitmap_forward+135}
Oct  6 02:38:36 elite RSP: 0018:ffff81007f1f5888  EFLAGS: 00010246
Oct  6 02:38:36 elite RAX: 0000000000000000 RBX: 0000000000000001 RCX:
ffff81007
f1f591c
Oct  6 02:38:36 elite RDX: ffffc2000004d660 RSI: ffff810001d8fc10 RDI:
ffff81000
1d8fc10
Oct  6 02:38:36 elite RBP: ffff81007f1f591c R08: ffff81007f1f5778 R09:
000000000
0000000
Oct  6 02:38:36 elite R10: 0000000000000010 R11: ffff81007f1f57d8 R12:
000000000
0000001
Oct  6 02:38:36 elite R13: 0000000000007fe0 R14: 0000000000007fe0 R15:
ffff81007
f1f5970
Oct  6 02:38:36 elite FS:  00002af33ea0f1b0(0000)
GS:ffffffff8047a000(0000) knlG
S:0000000000000000
Oct  6 02:38:36 elite CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
Oct  6 02:38:36 elite CR2: 0000000000000038 CR3: 000000007d4f1000 CR4:
000000000
00006e0
Oct  6 02:38:36 elite Process ktxnmgrd:dm-4:r (pid: 428, threadinfo
ffff81007f1f
4000, task ffff81007e64a200)
Oct  6 02:38:36 elite Stack: 0000000000008000 0000000100000001
ffff81007f1f591c
ffffc2000004d660
Oct  6 02:38:36 elite ffff81003df44004 000000007f1f5ae8 0000002000000020
ffff810
07f1f5968
Oct  6 02:38:36 elite ffff81007f1f591c 0000000000000001
Oct  6 02:38:36 elite Call Trace:
<ffffffff88080b11>{:reiser4:bitmap_alloc_forwa
rd+145}
Oct  6 02:38:36 elite <ffffffff88080d2f>{:reiser4:alloc_blocks_bitmap+447=
}
Oct  6 02:38:36 elite <ffffffff88060e53>{:reiser4:plugin_by_unsafe_id+35}=

Oct  6 02:38:36 elite <ffffffff8807f6a1>{:reiser4:item_length_by_coord+17=
}
Oct  6 02:38:36 elite <ffffffff8804fa65>{:reiser4:reiser4_alloc_blocks+16=
5}
Oct  6 02:38:36 elite <ffffffff88053db9>{:reiser4:allocate_znode_update+2=
65}
Oct  6 02:38:36 elite
<ffffffff8807f9d1>{:reiser4:item_body_by_coord_hard+17}
Oct  6 02:38:36 elite <ffffffff880776ef>{:reiser4:internal_at+15}
<ffffffff88077
709>{:reiser4:pointer_at+9}
Oct  6 02:38:36 elite <ffffffff88077749>{:reiser4:down_link_internal+9}
<fffffff
f8804c115>{:reiser4:check_tree_pointer+117}
Oct  6 02:38:36 elite <ffffffff8805404e>{:reiser4:allocate_znode+334}
<ffffffff8
8054157>{:reiser4:lock_parent_and_allocate_znode+167}
Oct  6 02:38:36 elite
<ffffffff88054554>{:reiser4:handle_pos_on_formatted+468}
Oct  6 02:38:36 elite <ffffffff880518d9>{:reiser4:jnode_make_wander+9}
<ffffffff
880545f9>{:reiser4:handle_pos_on_leaf+9}
Oct  6 02:38:36 elite <ffffffff880553fd>{:reiser4:flush_current_atom+1981=
}
Oct  6 02:38:36 elite <ffffffff8805133d>{:reiser4:txn_end+525}
<ffffffff88051639
>{:reiser4:txn_restart+9}
Oct  6 02:38:36 elite <ffffffff8805187c>{:reiser4:commit_some_atoms+140}
<ffffff
ff8805a2bd>{:reiser4:ktxnmgrd+349}
Oct  6 02:38:36 elite <ffffffff8805a160>{:reiser4:ktxnmgrd+0}
<ffffffff80230c2b>
{kthread+219}
Oct  6 02:38:36 elite <ffffffff802587ee>{child_rip+8}
<ffffffff88021210>{:libata
:ata_exec_command+0}
Oct  6 02:38:36 elite <ffffffff80285e10>{keventd_create_kthread+0}
<ffffffff8023
0b50>{kthread+0}
Oct  6 02:38:36 elite <ffffffff802587e6>{child_rip+0}
Oct  6 02:38:36 elite
Oct  6 02:38:36 elite Code: 48 8b 50 38 8b 01 48 8b 4c 24 18 44 8b 41 28
44 39 c
0 76 2e
Oct  6 02:38:36 elite RIP
<ffffffff880808e7>{:reiser4:search_one_bitmap_forward+
135} RSP <ffff81007f1f5888>
Oct  6 02:38:36 elite CR2: 0000000000000038


At this point, the filesystem was basically dead.  I could basically get
things to work, so long as they were still cached.  Any attempt to write
data would hang, and I don't believe I could read anything, either, but
I didn't try.  Without being able to sync, I had to hard-boot it.

Things seem to be working alright, but this does happen to my desktop
occasionally.  I can't reproduce it reliably.  I used to be able to
reliably reproduce a hard lockup -- no ssh, no keyboard, no mouse -- by
simply playing certain games for a few hours, but that seems to have
been fixed with a recently updated nVidia driver.

There is a nearly identical box, acting as a server, running Reiser4,
which simply never has problems.  Currently has an uptime of 25 days,
last rebooted for a kernel update.  They are still different enough that
it could be a hardware problem, or some system outside Reiser4 -- the
desktop has Reiser4 compiled as a module, and uses it on a device-mapper
RAID root.


--------------enigCE08F8A76C5DB6E146B5063B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iQIVAwUBRSYGkHgHNmZLgCUhAQPOFQ/7BPFis6LOekMQNZy6RNwzgwLLkssTXbd3
TJ8ZIP/ObFKq/5oOKcCGcVS2qHJrdrIGjD39vqDtTQqwJTB2U8pnZ2XA7466VnpP
UGcIApzH+HX44iL5hzjwB6jkhzBrKS5TUt7CsNgE+X11YP12sgK6sdWk5IzeZMR9
SnVX/UPp8OYcWzBQ0igmBo9Y4AhsimI2p8YzZRWdOAqKx5vTphv1VUljv/yA3IEc
8oVxdKcPe15xWQF8uZdxhX8hEo+T7OhF5IU3V8mQhwK7gW5+QtUQorIjbzN0pF69
ghnzvjg2gN1xRH9zaEVBISj5PfDJTge3nSC4nhxvowIM8phd2kZOV6xON4VrFqZh
LfW2gCJaPEHYnBze+vYzPzWOKFIi+rgEDF+s4/32kjwvaXz8+zs5imIywHZf108q
tuhzDSlqiIa47Jaf2R7US/JmaajJHp6PwdB86gKUFISkJC19+hFizlyxoeAm8i0A
LozeuiLdy63plugTkuUszaoyf3yEUeCkuX+Kj1EOYo+XKvm/XLMQu4slqpQPsW2Z
NpvL8hzQ80XYqTkJBt+9/OPjJ+fVy06UWowC/MjJVW+LenFcfu6VJhdOZI9yLd9i
VE9a0316WAzqqDgn8vv1YqhIuRvrI43+4xhPd5CQ5xa1oQZTAvChMofTHH267tMq
GPYMiINYk7w=
=khyE
-----END PGP SIGNATURE-----

--------------enigCE08F8A76C5DB6E146B5063B--
