From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 for windows
Date: Mon, 17 Jan 2005 23:08:52 -0600
Message-ID: <41EC99E4.2050708@slaphack.com>
References: <20041204211059.41930.qmail@web50908.mail.yahoo.com> <41B287C6.2060902@namesys.com> <41B29491.20405@slaphack.com> <41E9D3DF.1060508@namesys.com> <41EA04B7.3050606@slaphack.com> <41EBEBF1.1050408@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23162-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41EBEBF1.1050408@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Job Bob <yzhang2004@yahoo.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Hans Reiser wrote:
| David Masover wrote:
|
|> Hans Reiser wrote:
|> [...]
|> |
|> |>
|> |> To start with, ntfs read access is still case insensitive, last I
|> |> checked.  How deep does that go?
|> |
|> |
|> | In reiser4, it is just a directory plugin.
|>
|> Nono -- how do you give Windows, which is case insensitive, access to a
|> case-sensitive filesystem?  For instance, how do you get a Windows-based
|> backup program to back up a reiser4 partition from a Linux installation,
|> if it has filenames that are identical except for case?
|
|
| This problem is insoluble.  Either make reiser4 case insensitive and use
| it that way or educate the windows programs or live with bugs.  I see no
| alternative.  Do you?

Mangling.  Or case-sensitivity (forget who said that NTFS has that).  Or
force case-insensitive FSes only.  I think all three would work in
different situations, and I don't think it would be too difficult to add
all three.

Just for clarification -- mangling is how VFAT is backwards-compatible
with DOS, for example.  myreallylongfile.doc becomes MYREAL~1.DOC when
viewed from DOS, so that while VFAT should really be read with Windows
95 or better (Linux), it can still be accessed in Dos.

This loses information (if a DOS program backs up and restores
MYREAL~1.DOC, you lose the long (myreallylongfile.doc) name.)  But
sometimes there's no alternative, and if you mangle it (instead of just
chopping off the end of the filename) you avoid collisions -- that is,
if you have:

myreallylongfile.doc
myreallife.doc

then they become

MYREAL~1.DOC
MYREAL~2.DOC



Only question is, where to set which of these to choose (mangle or case
sensitivity)?  Maybe it could be per-directory, most likely per-mount.
But I have no idea how Windows passes mount options ... I don't think it
has any mount options at all.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQeyZ5HgHNmZLgCUhAQINmA//WF2s/dtUlBiIf/VHpcN4qUJeTJOitqfC
pu6hD9wx8LF/EEfSyY5oSE8XBZaEUshJML8aG8XaOQGL+zLNhUR6oBjesq0wTXq6
8zxGOsH2NcCZNkT/AlO1vaBEBdXDiNGFfIRYx7yC1AIjZ+xkIlkK80PL7sXZBx22
ShLgG6fyKB0bqxygHTNVhL9luml+OrhvwOcOQ7E8+EJ1UE1C1KPcdJz2UiCB7eNd
9lX1NPD+C2BHq6QAg4JBoNr+M3QdIjI6HOhFDgvNbn+fp7dTOGEpsJ8+tlKJCtui
n1yyC+94TZyx/2X4k4d0I+9rPfVOjUeZidEoGQCKEmIZ5BEUs8p/1DHQxRXJPXU6
hSJeTdkLkLSoUysM4+ATBSbGcL8pK9oNRmzTUgyLC26AwdBL1lMH98IZgwB7HFoG
nFWwWoxMxSheT5terZfDIoP8Ey0DefTPw13FWfP3Kjxunk72QJgjEBaY/NRPM0PQ
MJoOn2hCCi4pCZ6cWec3RScF83EhD2J4oyj/BE+6+dCOlfMevY29xVr9BaIXZyYQ
xARt3LfM6G/hTLhivDigefkboY9cOMuTi33R1cDpwwBlHGN+ZlzE948swn2tFW/Q
/oyNtr6isHN4uU3b3Sg2qVeLUSTOG9chYSCed8wOio/ttuyzekrG6u0vWoSGz1Ms
9Zq8uDXIrkw=
=uirN
-----END PGP SIGNATURE-----
