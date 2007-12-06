From: Nathan Caldwell <saintdev@gmail.com>
Subject: Re: Fwd: bug report: reiser4 + kde4
Date: Thu, 6 Dec 2007 04:59:32 +0000 (UTC)
Message-ID: <loom.20071206T043654-993@post.gmane.org>
References: <20071122101615.178410@gmx.net>  <a08621850711220425r8467edfj588677fb5c91579f@mail.gmail.com> <a08621850711220507t770795edvfcd31a02f638bcdc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org


Dushan Tcholich <dusanc <at> gmail.com> writes:
>=20
> ---------- Forwarded message ----------
> From: Dushan Tcholich <dusanc <at> gmail.com>
> Date: Nov 22, 2007 1:25 PM
> Subject: Re: bug report: reiser4 + kde4
> To: Sven M=C3=BCller <musv <at> gmx.de>
>=20
> As I read reiser4.patch you used was from kamikaze sources,
> Am  correct?
>=20
> On Nov 22, 2007 11:16 AM, "Sven M=C3=BCller" <musv <at> gmx.de> wrote=
:
> > Hi,
> >
> > according to my post in http://forums.gentoo.org/viewtopic-t-614771=
=2Ehtml I
> > was told to file that bug
> > report to you.
> >
> > Scenario:
> > I tried to install KDE4-svn on a PentiumIII notebook. The root part=
ition on
> > that notebook runs on a reiser4 partition. The partition was create=
d without
> > any additional options (no compress or encryption). After starting =
KDE4 I
> > get that kernel oops.
> >

Hi, I'm hitting this bug (or possibly a related one) as well. I _was_ u=
sing the
patch listed above. I also tried with the just released official patch =
for
2.6.23 (the second one with NFS fixup). And have a slightly different c=
allstack,
so I'm not 100% sure if it's the same bug or not. But the steps to repr=
oduce are
the same, install kde4 (either the RC, or directly from SVN), and attem=
pt to
start it.

(sorry about any weird wrapping, gmane won't let me post lines >80 char=
acters)


agpgart: Found an AGP 2.0 compliant device at 0000:00:00.0.
agpgart: Putting AGP V2 device at 0000:00:00.0 into 4x mode
agpgart: Putting AGP V2 device at 0000:01:00.0 into 4x mode
eth0: no IPv6 routers present
BUG: unable to handle kernel paging request at virtual address 0031ff5c
printing eip: c01c1810 *pde =3D 00000000=20
Oops: 0000 [#1]=20
Modules linked in: snd_pcm_oss snd_mixer_oss snd_seq_dummy snd_seq_oss
snd_seq_midi_event snd_seq snd_seq_device nvidia(P) snd_intel8x0 snd_ac=
97_codec
ipw2100 ac97_bus snd_pcm intel_agp snd_timer snd snd_page_alloc

Pid: 3311, comm: kded4 Tainted: P        (2.6.24-rc3-zen3 #5)
EIP: 0060:[<c01c1810>] EFLAGS: 00010296 CPU: 0
EIP is at reiser4_write_extent+0x16/0x4b3
EAX: 0031ff50 EBX: f5c04054 ECX: 00000000 EDX: 00000000
ESI: f5c04000 EDI: 00000000 EBP: f5c0409c ESP: f631fd88
 DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 0068
Process kded4 (pid: 3311, ti=3Df631e000 task=3Df7c44a60 task.ti=3Df631e=
000)
Stack: 00000000 00000175 00000000 00000000 0031ff50 f631fe30 00000000 0=
dc31314=20
       00000000 2d69636f 006b6465 00dc3132 00000000 00000174 00000000 0=
dc31314=20
       00000000 2d69636f 006b6465 00dc3132 00000000 00000000 00000000 0=
dc31314=20
Call Trace:
 [<c01adfb3>] setattr_unix_file+0x182/0x393
 [<c016023e>] nameidata_to_filp+0x24/0x33
 [<c0172928>] mntput_no_expire+0x13/0x57
 [<c0171a84>] notify_change+0x140/0x268
 [<c025967f>] copy_to_user+0x25/0x3a
 [<c0162220>] sys_llseek+0x65/0x87
 [<c01609c4>] do_truncate+0x5e/0x75
 [<c01697e2>] do_path_lookup+0x175/0x1ca
 [<c0160cbf>] do_sys_truncate+0x15f/0x17a
 [<c03d723a>] mutex_lock+0xb/0x24
 [<c0161fec>] generic_file_llseek+0x0/0x89
 [<c025967f>] copy_to_user+0x25/0x3a
 [<c0162220>] sys_llseek+0x65/0x87
 [<c0103c02>] sysenter_past_esp+0x5f/0x85
 [<c03d0000>] ieee80211_wx_get_scan+0x499/0x90a
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Code: e8 fa 57 fd ff 83 fb 01 0f 45 f3 83 ec 80 89 f0 5b 5e 5f 5d c3 55=
 57 56 53
81 ec bc 00 00 00 89 4c 24 08 89 54 24 0c 89 44 24 10 <8b> 40 0c 8b 40 =
08 89 44
24 20 e8 63 41 fe ff 89 c7 e8 c6 2d fd=20
EIP: [<c01c1810>] reiser4_write_extent+0x16/0x4b3 SS:ESP 0068:f631fd88
reiser4[kded4(3311)]: release_unix_file
 (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
WARNING: out of memory?
reiser4[kded4(3311)]: release_unix_file
 (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
WARNING: out of memory?
reiser4[kded4(3311)]: release_unix_file
 (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
WARNING: out of memory?
reiser4[kded4(3311)]: release_unix_file
 (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
WARNING: out of memory?
reiser4[kded4(3311)]: release_unix_file
 (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
WARNING: out of memory?
reiser4[kded4(3311)]: release_unix_file
 (fs/reiser4/plugin/file/file.c:2409)[vs-44]:
WARNING: out of memory?


-Nathan Caldwell

-
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
