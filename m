From: David Masover <ninja@slaphack.com>
Subject: Re: Fibration questions
Date: Fri, 23 Jul 2004 13:13:32 -0500
Message-ID: <4101554C.6060203@slaphack.com>
References: <40FE0B47.3010600@slaphack.com> <40FF3DAD.6020100@slaphack.com> <200407221410.25043.vitaly@namesys.com> <200407231159.23162.christian.mayrhuber@gmx.net> <20040723095950.GM4990@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19776-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040723095950.GM4990@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Markus T=F6rnqvist wrote:
| On Fri, Jul 23, 2004 at 11:59:23AM +0200, Christian Mayrhuber wrote:
|
|>It would be a good idea if the meta filesystem interface always auto
|>terminates strings (add + '\0') issued by echo. procfs does it that way.
|
|
| Or add a small parser that allows \n so that cat output would look
| better...

And remove \n from input so we could really just do "echo foo >
metas/bar" with no worries.

Amen, if it could be done for only access through the "open" system
call.  That is, if someone wants speed, they'll use sys_reiser4, and if
they use sys_reiser4, they want speed -- thus sys_reiser4 would not add
\0 or add/remove \n.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQQFVS3gHNmZLgCUhAQJ86g/6AsEwzPGRmBIfHCOW/SBS/iErwxhRHYmj
1SOwgUan+Aa/G7YVQZziI6/wS3hjcjW0lzelI8LAJM7fomWprwHKmFP7a7BngOEh
Phwmk0TGVvOiFZ3J34vfyBnYTeM15ttOfWDbJQI5x15K3nkPNgytgajIYKYtGkeL
eBuEo0YUoJ7IGyFnJScqnC7QsLgR/ak5F2oJrZCKRskycVN+ceXG9xdFX5K6U6TM
p8mfmRXGpKMtw9Ob1CQ+jjOQ98T2cFgGQ/00i3U2wfzrkFEcjOqZdNwIDbEKXHND
Fvxz1X//WPsaZkXOAO9TUneWkthVjcrDCJCJfSG5FxSeE04JscxOLyxZlyJqB2nG
YHIhQetrSI7hJqwT9eCWzO8ihpkmdqmfTHjEkmmpWbZ4L51e7uom9KQw0+SCCp0C
ag+zHE7W32ysULqKT+ozpi/P7FaEKq5kizZ/KYUkIYrco1IMrPV9ZCUxA0YDINy/
MBTfxNrMy+HoTHDsy4EFrX3Dldi/hm7dDoBcDrmssfDiWcfKuJad+Zg/edSyRRcb
NpjaaAiIX9LQP0JQsh/k4+zPSf5Gp+JU8T8IG8MxZQOTInvKAbXL7oqx2Zmieae7
bWscaJzC6HvLSUcBfHXJdM1+ELLrLoExlJFMMzqrdjTypxRHvkKM9qVm50JM6lfu
h2t8BlnnKtI=3D
=3DvUTa
-----END PGP SIGNATURE-----
