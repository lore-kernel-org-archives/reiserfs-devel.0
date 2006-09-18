From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Files > 2GB and 3.6 version (after converting from 3.5)
Date: Mon, 18 Sep 2006 12:14:40 -0400
Message-ID: <450EC5F0.7030201@suse.com>
References: <1156.192.168.0.1.1158409502.squirrel@www.bluenet.waw.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29928-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1156.192.168.0.1.1158409502.squirrel@www.bluenet.waw.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: pjagoda@bluenet.waw.pl
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pawel Jagoda wrote:
> Hello.
> 
> I've backup my data - one file, which have 4060 MB. Unfortunetly I didn't
> point out that my destination file system is in old 3.5.x version. And of
> course I cannot read my data after 2GB (it says: Input/Output Error). I
> have converted my filesystem into 3.6.x, but still I'm not able to read
> this file. But if I create new file (for example: dd if=/dev/zero
> of=/mnt/hda3/some_file bs=1M count=3000), there is no problem to read it.
> Is it possible, to do something to restore my backup from this file? If
> yes, then how can I do it?

Unfortunately, if you've removed your backup of the original file, the
data is lost.

If you still have a copy of the original file, you can remove the copy
on the converted file system and replace it. The problem you're running
into is that converting a file system to v3.6 from v3.5 allows *new*
files to grow beyond the 2 GB limit, but not existing ones. The reason
for this is that converting the file system only indicates that it has
the ability to use files larger than that, but it doesn't update all the
existing files. If you create a new file, it uses the newer metadata
format that can describe much larger files.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFFDsXvLPWxlyuTD7IRAheZAJ9hIwFztEGNgAu12XWunj42e7SYGACglca3
HQI+nvkGehJxOe9asRZweGg=
=NUad
-----END PGP SIGNATURE-----
