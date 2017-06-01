From: Ivan Shapovalov <intelfx@intelfx.name>
Subject: Re: reiser4: BUG during a backup (sequentially reading the whole
 fs) on 4.9
Date: Thu, 01 Jun 2017 20:46:15 +0300
Message-ID: <1496339175.12062.1.camel@intelfx.name>
References: <1488211296.5395.2.camel@intelfx.name>
         <f7c80f08-6e89-226b-7914-54d2385aa834@gmail.com>
         <1488212421.5395.3.camel@intelfx.name>
         <4a88640c-8d98-1cc0-5713-3abd76abf208@gmail.com>
         <1496328566.8314.2.camel@intelfx.name>
         <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com>
Reply-To: intelfx@intelfx.name
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-igwIegLDa+uHATT/VdVO"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intelfx.name; s=google;
        h=message-id:subject:from:reply-to:to:date:in-reply-to:references
         :mime-version;
        bh=aWpZp5+zYeTXvMgPiEtSgdvcsKXa3thHjZISHNb9WB4=;
        b=gcDm2THKOfq4X4ezDfotzJdSwzDyF2XgcGvvuIDDbHmULsyg3eTrKc44SCFo/p2xD4
         3Gg4o9YKKoPAD2cOOf8J7wWUx5cA3UfiIWewLNmzOfmcRIglZh5vRc5rXYwFQFzm0ukX
         xPywawUbcX6UAWTmSId+KbH1E9rreaoeVQpPw=
In-Reply-To: <290631df-dc46-e8ef-041f-c353b7eecf88@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Edward Shishkin <edward.shishkin@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>


--=-igwIegLDa+uHATT/VdVO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it is reproducible each time when I backup to an empty repo
without checkpoints (so that borg has to fully read all files). The
filesystem is consistent by fsck.

--=20
Ivan Shapovalov / intelfx /

On 2017-06-01 at 19:43 +0200, Edward Shishkin wrote:
> So, fsck reports no problems?
> How frequently does it happen? On every attempt to backup?
>=20
> On 06/01/2017 04:49 PM, Ivan Shapovalov wrote:
> > Hello,
> >=20
> > I'm sorry for the long delay -- was too busy with the university
> > and
> > other things... So, yes, this still happens on 4.11 with latest git
> > master (+ trivial porting), which contains this commit.
> >=20
> > The oops:
> >=20
> > Jun 01 17:39:15 intelfx-laptop kernel: BUG: unable to handle kernel
> > NULL pointer dereference at 0000000000000010
> > Jun 01 17:39:15 intelfx-laptop kernel: IP: internal_at+0x1/0x30
> > [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel: PGD 1337cb067
> > Jun 01 17:39:16 intelfx-laptop kernel: PUD 104b06067
> > Jun 01 17:39:16 intelfx-laptop kernel: PMD 0
> > Jun 01 17:39:16 intelfx-laptop kernel:
> > Jun 01 17:39:16 intelfx-laptop kernel: Oops: 0000 [#1] PREEMPT SMP
> > Jun 01 17:39:16 intelfx-laptop kernel: Modules linked in: bnep
> > nls_iso8859_1 nls_cp437 vfat fat ext4 jbd2 mbcache acpi_call(O)
> > fuse ctr ccm uas btusb btintel bluetooth crc16 uvcvideo
> > videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videob
> > Jun 01 17:39:16 intelfx-laptop kernel:  tpm_tis_core tpm evdev
> > tcp_yeah tcp_vegas sch_fq_codel vboxnetflt(O) vboxnetadp(O)
> > vboxpci(O) vboxdrv(O) usbserial usbip_host usbip_core sg efivarfs
> > ip_tables x_tables ipv6 autofs4 reiser4 sd_mod hid
> > Jun 01 17:39:16 intelfx-laptop kernel: CPU: 0 PID: 6560 Comm: borg
> > Tainted: G           O    4.11.0-pf4-intelfx-00156-g49494524ad71-
> > dirty #1
> > Jun 01 17:39:16 intelfx-laptop kernel: Hardware name: LENOVO
> > 20BEA008RT/20BEA008RT, BIOS GMET75WW (2.23 ) 03/16/2016
> > Jun 01 17:39:16 intelfx-laptop kernel: task: ffff890e891f5400
> > task.stack: ffff9cc04c744000
> > Jun 01 17:39:16 intelfx-laptop kernel: RIP:
> > 0010:internal_at+0x1/0x30 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel: RSP: 0018:ffff9cc04c747978
> > EFLAGS: 00010246
> > Jun 01 17:39:16 intelfx-laptop kernel: RAX: 00000000000003a8 RBX:
> > ffff9cc04c7479d0 RCX: ffffffffc06ea980
> > Jun 01 17:39:16 intelfx-laptop kernel: RDX: ffff8910adafe3c0 RSI:
> > ffff9cc04c7479d0 RDI: 0000000000000000
> > Jun 01 17:39:16 intelfx-laptop kernel: RBP: ffff8910adafe3c0 R08:
> > 0000000000010000 R09: 0000000000000000
> > Jun 01 17:39:16 intelfx-laptop kernel: R10: ffffffffc06c6080 R11:
> > 0000000000000020 R12: ffff9cc04c747b10
> > Jun 01 17:39:16 intelfx-laptop kernel: R13: 0000000000000001 R14:
> > ffff9cc04c7479d0 R15: 0000000000000000
> > Jun 01 17:39:16 intelfx-laptop kernel: FS:  00007faba5bbe4c0(0000)
> > GS:ffff8910be200000(0000) knlGS:0000000000000000
> > Jun 01 17:39:16 intelfx-laptop kernel: CS:  0010 DS: 0000 ES: 0000
> > CR0: 0000000080050033
> > Jun 01 17:39:16 intelfx-laptop kernel: CR2: 0000000000000010 CR3:
> > 00000001dd136000 CR4: 00000000001406f0
> > Jun 01 17:39:16 intelfx-laptop kernel: Call Trace:
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > has_pointer_to_internal+0x9/0x20 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > find_disk_cluster+0x185/0x390 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > key_by_inode_cryptcompress+0x70/0x70 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > do_readpage_ctail+0x25d/0x4e0 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > ctail_readpages_filler+0x196/0x260 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > read_cache_pages+0xb7/0x190
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > do_readpage_ctail+0x4e0/0x4e0 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > readpages_ctail+0x13f/0x330 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > readpages_cryptcompress+0x34/0x60 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > __do_page_cache_readahead+0x1de/0x2c0
> > Jun 01 17:39:16 intelfx-laptop kernel:  ? dput.part.6+0x2c/0x240
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > ondemand_readahead+0x11b/0x2d0
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > ondemand_readahead+0x11b/0x2d0
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > pagecache_get_page+0x2b/0x290
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > generic_file_read_iter+0x5bb/0x820
> > Jun 01 17:39:16 intelfx-laptop kernel:  ? __vfs_getxattr+0x25/0x70
> > Jun 01 17:39:16 intelfx-laptop kernel:  ? new_sync_read+0xd2/0x120
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > read_cryptcompress+0x5c/0xa0 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > reiser4_read_dispatch+0x54/0x130 [reiser4]
> > Jun 01 17:39:16 intelfx-laptop kernel:  ? vfs_read+0x85/0x150
> > Jun 01 17:39:16 intelfx-laptop kernel:  ? SyS_read+0x4d/0xc0
> > Jun 01 17:39:16 intelfx-laptop kernel:  ? SyS_ioctl+0x36/0x70
> > Jun 01 17:39:16 intelfx-laptop kernel:  ?
> > entry_SYSCALL_64_fastpath+0x13/0x94
> > Jun 01 17:39:16 intelfx-laptop kernel: Code: 68 53 5b 6e c0 bb fb
> > ff ff ff e8 ed be a4 eb 48 83 c4 18 eb 9e 0f 1f 44 00 00 41 b8 01
> > 00 00 00 31 c9 48 89 f2 e9 d0 eb fc ff 53 <83> 7f 10 ff 48 89 fb 74
> > 09 48 89 df 5b e9 2d 7d 00 00 e8 08 7d
> > Jun 01 17:39:16 intelfx-laptop kernel: RIP: internal_at+0x1/0x30
> > [reiser4] RSP: ffff9cc04c747978
> > Jun 01 17:39:16 intelfx-laptop kernel: CR2: 0000000000000010
> > Jun 01 17:39:16 intelfx-laptop kernel: ---[ end trace
> > 552a3368efb88951 ]---
> >=20
> > Not quite sure where to look for the problem... If you are too busy
> > right now, then I'd appreciate at least some pointers.
> >=20
> > --
> > Ivan Shapovalov / intelfx /
> >=20
> > On 2017-02-27 at 17:30 +0100, Edward Shishkin wrote:
> > > Please, check your partition with fsck (repair if damaged).
> > > Then build the kernel with the following patch applied:
> > > 9eca07b7b992724446d5e7327c86bb0bf1f20a41
> > > Let me know, if the oops appears again.
> > >=20
> > > Thanks,
> > > Edward.
>=20
>=20
--=-igwIegLDa+uHATT/VdVO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE5N8nvImcx2nJlFGce94XyOTjDp0FAlkwUucACgkQe94XyOTj
Dp12fg//c5Tg6reWC9GeFv+OjSpu4jHYbU7z109wPV2SCD8TqHhUFLqVzh+e860R
Omb0QUkC4JAqADJ1RnaAa/5s00YTx4ys24FEKxShrJZMO3oOa8Omddk37JBiwEme
5ZI0VIt731FNB5K6XVGc0tE0xSALdq8ROI7emXrcYfjCZL0BN6q8F+AuBUL7tim2
pm8ZMHwLOevJcSq5AvgIwGwK4lG4CZ4+pi2e4YQyNCGvOjTEHIC/cIoKeeNY+tve
sMjruaNMg/ZD81p++f27wRbkOfPOWtX/lJuKI0n77Uy2xJw0kk52N5SHXKV/g3zk
0JMGWLxekTom0v8Tu6WeUz07V7j4k4siQxY/oJ0leZsG+lbWpncfLRXkLdbPE8I7
6pXoAFEOPO75e8rwlaEMHjqgrOFOs6Lfgy7/aJmNeb61CiCCt+ljNh/ZvXyBVRYu
W5iDAw13JBYJBAqcUjTIZyecA+fjhk/zP1vhBInim6vvrkQOWoulDpAhaogSj0UD
HgA2xEiIwLtA2yGkibO/8iu/JmaKAuC67Za1DycATcpbgkuo3V//wvsXfb9lbe5D
fopifVQpFOvIg1h1D5kBSzEphACYYI7r0Luz3m74oeXFsiu6jnCdloAXX+vyrecE
5TzCB45BnsPi2rkscH9AIHMmZFXJKeYjeTGYng9zfz8PCItO7Wc=
=2pT6
-----END PGP SIGNATURE-----

--=-igwIegLDa+uHATT/VdVO--

