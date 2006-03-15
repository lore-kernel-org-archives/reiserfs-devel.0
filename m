From: Christian Trefzer <ctrefzer@gmx.de>
Subject: Re: kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29
Date: Wed, 15 Mar 2006 09:24:20 +0100
Message-ID: <20060315082419.GA13076@zeus.uziel.local>
References: <20060315075034.GC17577@zeus.uziel.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Return-path: <reiserfs-list-return-28264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060315075034.GC17577@zeus.uziel.local>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again,

small update and clarification: I wiped the laptop's volume on which the
problem occured, but my workstation's has _not yet_ been wiped. But:

kernel BUG at /usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail=
_conversion.c:29!
invalid opcode: 0000 [#1]
PREEMPT=20
Modules linked in: mga drm usb_storage libusual w83781d hwmon_vid hwmon i2c=
_isa snd_seq_midi snd_pcm_oss snd_mixer_oss snd_seq_oss snd_seq_midi_event =
snd_seq snd_cmipci snd_opl3_lib snd_hwdep snd_mpu401_uart ohci_hcd floppy s=
r_mod cdrom pata_via i2c_viapro aic7xxx scsi_transport_spi ehci_hcd uhci_hc=
d 3c59x mii snd_ens1370 gameport snd_rawmidi snd_seq_device snd_pcm snd_tim=
er snd_ak4531_codec snd soundcore snd_page_alloc via_agp agpgart usbcore xf=
s exportfs reiser4 ext2 loop lp parport_pc parport rtc psmouse reiserfs dm_=
mod raid5 raid1 xor md_mod pata_pdc2027x libata sd_mod scsi_mod unix
CPU:    0
EIP:    0060:[<f2daa02d>]    Not tainted VLI
EFLAGS: 00010282   (2.6.16-rc5 #10)=20
EIP is at get_exclusive_access+0x31/0x44 [reiser4]
eax: bdb66604   ebx: 00000000   ecx: d44cd294   edx: d09041e0
esi: 3d762000   edi: 00006c85   ebp: 00006c85   esp: c33c9f0c
ds: 007b   es: 007b   ss: 0068
Process soffice.bin (pid: 687, threadinfo=3Dc33c9000 task=3Dcfc0da90)
Stack: <0>f2da83da 00000000 e6578e8c d2f12ee8 00007000 b014c75f e6578e8c b1=
9e8900=20
       b0151cd1 d025fda8 d025fd9c 3d762000 c1465440 b7c775c0 bdb665c0 d44cd=
2ec=20
       d44cd294 00000000 00006c85 00000001 00000000 d44cd2a0 00000000 00006=
c85=20
Call Trace:
 [<f2da83da>] write_unix_file+0x1ba/0x60c [reiser4]
 [<f2da8220>] write_unix_file+0x0/0x60c [reiser4]
 [<b0101135>] syscall_call+0x7/0xb
Code: ff 21 e0 8b 00 8b 80 b0 04 00 00 8b 40 40 8b 50 08 85 d2 75 16 ba 01 =
00 ff ff 89 c8 0f c1 10 85 d2 75 12 c7 41 24 01 00 00 00 c3 <0f> 0b 1d 00 0=
4 8c dc f2 eb e0 51 e8 13 ac 35 bd 59 eb e5 55 89=20
 <6>lp0: ECP mode

This is what I got with the laptop's disk in a USB case and the home
volume from there mounted as /home. Processes stuck in D state were all
trying to write to /home. I have to mention that the volume on the
laptop disk which had problems before was _not_ home, so this is not a
repetition of something I've seen before. Basically, I have now reset my
sysctl values regarding the vm subsystem to the default values and will
try to reproduce.

Workstation has 1GB of RAM and is trying to build OOo2 from source at
the time, but writing the build tree to a totally different volume. The
build process also is not interrupted by this BUG.


Thanks,

Chris


--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iQIVAwUBRBfPM12m8MprmeOlAQL7SxAApXq9JxPt4S95eJovKa8PI8U6loXRN2nq
X61ltGJGtNSnQUC7VtqNDQgkYKrX6Y+xuszSjvhDin9gxZFuG6kOGftahBRN3fMF
DWKc8b9MeRAg/8Uhg1+U8N/vW0QmZTXsK3BIflz9XO05MU8seqG42trNHpnphuI+
HyF2mP7cGEYUavSikU5bo2U1qSokygJ5rE4+iVJzsF6BQIX8tdBZy8QlVk6FADrT
0dzhqIKoJ/pK3ZOdjpnB1uW5Ix1SpAoCavEndQhpcspIVyfI/N3mH9Hf29xETZA9
fbms80avrREoez9b/V+6VX9SxeKQxoPNAGbkveIZm0zhOEK3hBYHo+4rqS+C5rZt
HNTbA/kVfKioBRIiF2274q8MLXB3h68l2rIw5Ov8djGBFC2LhqM0COQY6SMqS1Qr
LE09KKzYTmmzI4MpZc4H1w/Yj1tneKVxEKJyB9ErCRePTHm+iczPuCFAOit1mRQ4
M9GLA1Ssqi9qMQkUvlGuVXLkfWExdhl3YbFHA3YwKNyG22kNtrpQwlxS0jL30awv
7cS6bQdmsIXyzv2vskA511/0dk1rIReeZf5JLxTHAkqGiPnHMzPpk0j/oM1Xtd6C
WluTl75tWewu/wcGEQKUji/462gbhLeG1MoJKdmAd6R/rP8pCBFWrF0853N9voZv
CO2x6E0OAiQ=
=BfCI
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--

