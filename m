From: David Masover <ninja@slaphack.com>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Tue, 28 Jun 2005 14:24:45 -0500
Message-ID: <42C1A3FD.6020207@slaphack.com>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h> <42C16B43.7060706@namesys.com> <Pine.GSO.4.58.0506281133260.2602@sysss01h> <878y0updla.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <878y0updla.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hubert Chan wrote:
> On Tue, 28 Jun 2005 11:38:30 -0400 (EDT), Keven Murphy <murphyk@gdls.com> said:
> 
> 
>>Thank you for the reply.  Do you see any issues with using reiser3 or
>>reiser4 file system on a loop-back encrypted device?
> 
> 
> I'm using reiser4 on a loopback encrypted device without problems.
> (But then, I haven't had any hardware problems or powerlosses.)
> 
> 
>>Some of the docs I have found say to stick with ext2 for the
>>filesystem. I was thinking reiser still would be a better choice.
> 
> 
> From what I hear, you should avoid using journaled filesystems on a
> file-based loopback that is stored on a journaled filesystem.  I believe
> that the reason for that is that a file-based loopback that is stored on
> a journaled filesystem does not guarantee certain write ordering or that
> journaled filesystems depend on.
> 
> But using a journaled filesystem on a device-based loopback should be
> fine.

Isn't dm-crypt the new way of doing this?  Doesn't that actually prevent
you from using a file as the backend?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQsGj/HgHNmZLgCUhAQIQfQ//Wgvtu3G8sGFr7PMA4mWbZubEenh3nDln
VRHOjN7EhgmHdGNLTqeMDODP9aFquEbqEQEJd3HGnmghJGlxc9qwzPotRBWSezBe
8cSYO71mpjXZjFikCZ7Or0+3EKO9i1ULSM+fFikE/IFyNNi2mr0raLzcTXmGE+Q/
umTu9hm6Df/BH15w1hZLvmmCMbA8/HvTicK1A0EUwM0OR5vYFF9TxoeZ5H759lR/
/HKUTEFFq5UFgTzIZhnhGEwzPbSIkqwMF0AOzy3joHuxG+G/37EpNbrPJSOGi8HY
ej20UzMDDrHzmA3P0ZRvEoKLAB+4ABM5IFur7inzk8FPCP4ZOC4Mfyzd/VvG2F9G
Gao3F+ElFgMEFawFMJFdmgvU4vsgAdBygBC+XUfaDDEOOWdKomfGuIKQH8x0hCuE
eK7w6NBMGhj5hv/fk+7fjIi5uJxR8LCmMktJHykD/hcHek9o4ZPiyqGEHZqi3MDe
/QJUeU2dyJP5MHz5o54exuwOtMmawz4sYyQgxUvO65iln8VdewMZRK4uM1FOxASk
K0Tqrja0k4eqTbueFXEJ+c3dcjLSUMsu1QuEutLvbPQd+B8B8eFYao6/gr5NxIJ5
eK8tGxVmVCdmDBtmRuQascoudQDTCoy61xE3K/mJAYy/xuBIQ8cyrRxdac+mRD/Z
GxQDZ+nA/gI=
=QH/o
-----END PGP SIGNATURE-----
