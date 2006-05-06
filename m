From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: Reiser4 2.6.16.2 / 2.6.17-rc3-mm1 WARNING: out of memory?
Date: Sat, 06 May 2006 11:51:07 +0200
Message-ID: <445C718B.1010808@free.fr>
References: <BAY23-F207CBCCD39A97DB66CAE06A7AA0@phx.gbl> <2c259a8f0605060242l62207c1dif918a380482e5441@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigB691590049CE0C7DC6A71970"
Return-path: <reiserfs-list-return-28577-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2c259a8f0605060242l62207c1dif918a380482e5441@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Yien Zheng <esprout@gmail.com>
Cc: reiserfs-list@namesys.com, Joseph Landers <josephlanders@hotmail.com>

--------------enigB691590049CE0C7DC6A71970
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le 06.05.2006 11:42, Yien Zheng a =E9crit :
> I am getting a similar error with gentoo's 2.6.17-rc3-mm1 kernel.  I
> had to go back to 2.6.17-rc1-mm2 to get reiser4 to work again.
> 2.6.17-rc2-mm1 had the same issue.
>=20
> I looked into it, and it appears there were no reiser4 patches between
> 2.6.17-rc1.mm2 through 2.6.17-rc3-mm1, so if that's really the case,
> some other patches must have affected reiser4 inadvertantly.
>=20
> On 5/6/06, Joseph Landers <josephlanders@hotmail.com> wrote:
>> Hi there,
>>
>> I have tried to compile the 2.6.17-rc3-mm1 patchset with kernel
>> 2.6.16.14 by
>> patching in the order specified in patch-series and adding the missing=

>> writeback 1of2 patch that was missing from the ftp. It compiles and I =
can
>> mount the partition but I get this error if I boot from the partition
>>
>> [4294689.998000] kernel BUG at fs/inode.c:253!
>> [4294689.998000] invalid opcode: 0000 [#1]
>> [4294689.998000] Modules linked in: cpufreq_stats 8139cp 8139too
>> snd_atiixp_modem snd_atiixp snd_ac97_codec snd_ac97_bus psmouse
>> [4294689.998000] CPU:    0
>> [4294689.998000] EIP:    0060:[<c0182df0>]    Tainted: GF     VLI
>> [4294689.998000] EFLAGS: 00010202   (2.6.16.14 #1)
>> [4294689.998000] EIP is at clear_inode+0x20/0xd0
>> [4294689.998000] eax: 00000001   ebx: e56b90ec   ecx: 00000000   edx:
>> e56b90ec
>> [4294689.998000] esi: e64fc5c0   edi: e6ad96e4   ebp: e56b90ec   esp:
>> e6091f08
>> [4294689.998000] ds: 007b   es: 007b   ss: 0068
>> [4294689.998000] Process Xorg (pid: 1151, threadinfo=3De6090000
>> task=3De635ea70)
>> [4294689.998000] Stack: <0>e56b90ec e56b90ec e64fc5c0 c01ebbab e56b90e=
c
>> 00000003 e56b92ec c01818d6
>> [4294689.998000]        e6ad96e4 00000200 00000000 00000000 c01ebb30
>> e56b90ec c018333b e56b90ec
>> [4294689.998000]        c0182691 e56b9110 00000000 e61a0000 c0179cdc
>> e56b90ec e6ad96e4 e6ad9380
>> [4294689.998000] Call Trace:
>> [4294689.998000]  [<c01ebbab>] reiser4_delete_inode+0x7b/0xf0
>> [4294689.998000]  [<c01818d6>] d_delete+0x86/0xa0
>> [4294689.998000]  [<c01ebb30>] reiser4_delete_inode+0x0/0xf0
>> [4294689.998000]  [<c018333b>] generic_delete_inode+0x5b/0xd0
>> [4294689.998000]  [<c0182691>] iput+0x41/0x80
>> [4294689.998000]  [<c0179cdc>] do_unlinkat+0x10c/0x140
>> [4294689.998000]  [<c0102e3f>] sysenter_past_esp+0x54/0x75
[snip]

I guess we were hit by the same bug. You should try to apply=20
reiser4-radix-tree-direct-data-fix.patch:=20
http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D114689474814596 .
~~
laurent



--------------enigB691590049CE0C7DC6A71970
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEXHGTUqUFrirTu6IRAseyAKCht0obJQE8Nso18dmxPbdrADrm6ACeLtIA
nH+SK5T3/YvASq+FhUxPV8g=
=21i5
-----END PGP SIGNATURE-----

--------------enigB691590049CE0C7DC6A71970--
