From: John Richard Moser <nigelenki@comcast.net>
Subject: Re: Interesting deletion idea
Date: Fri, 08 Oct 2004 19:52:14 -0400
Message-ID: <4167282E.9030901@comcast.net>
References: <41662BC7.80309@comcast.net> <200410082214.i98MEbfT003666@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22034-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200410082214.i98MEbfT003666@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1



Valdis.Kletnieks@vt.edu wrote:
| On Fri, 08 Oct 2004 01:55:19 EDT, John Richard Moser said:
|

[...]

Eh.  The gutman algorithm is kind of a toy, but *shrug*

I thought the DOD algorithm was 7 pass?

|
|>Buffering multiple overwrites of the same area and applying them in a
|>sane and orderly manner may allow you to catch rapid, repeted overwrites
|>of disk areas and wait until several have gone by before actually
|>applying them.  This would allow you to avoid some of the overhead of
|>attempting to destroy overwritten data.
|
|
| Actually, that's the *last* think you want to do - you really need to send
| 3 overwrites down the pipe to the disk *and make sure you have a write
barrier
| between them*.  The *last* think you want is to send 3 writes to the disk,
| and have the disk's write cache bugger^Wbuffer "optimize" it so only the
| last written block actually goes to disk....

no, no, I mean like this:

a = open("/some/file.txt");
seek(a, 0, 0);
fputc(a,'N');
seek(a, 0, 0);
fputc(a, 'D');
seek(a,0,0);
fputc(a, 'X');
....

If some program overwrites a part of a file a bunch of times, you don't
want:


seek(a, 0, 0);
overwrite_40_times();
fputc(a,'N');
seek(a, 0, 0);
overwrite_40_times();
fputc(a, 'D');
seek(a,0,0);
overwrite_40_times();
fputc(a, 'X');
......


but you will probably want

seek(a, 0, 0);
fputc(a,'N');
seek(a, 0, 0);
fputc(a, 'D');
seek(a,0,0);
overwrite_40_times();
fputc(a, 'X');
......
overwrite_40_times();
fputc(a, 'P');
fclose(a);

If this is going on rapidly, there's no point in trying to completely
destroy the disk for *every* logical operation; but buffering the
operations and then only doing the most recent one, and destroying the
area before that one exactly, would be OK.  The idea is that rapid
overwrites from userspace get collapsed into a single overwrite; and
then the kernel overwrites a bunch of times before flushing that data to
disk to securely erase it.

- --
All content of all messages exchanged herein are left in the
Public Domain, unless otherwise explicitly stated.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBZygthDd4aOud5P8RAlUCAJ4uj2PX0skLF73334oBsUUAP9rhbgCdFVDS
ptcwcABzE5+cs75HrJYpy9M=
=xhA7
-----END PGP SIGNATURE-----
