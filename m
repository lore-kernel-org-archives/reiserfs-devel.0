From: evilninja <evilninja@gmx.net>
Subject: Re: EACCESS vs ENOENT for nonexistent files-within-files
Date: Wed, 15 Sep 2004 12:55:33 +0200
Message-ID: <41481FA5.2000504@gmx.net>
References: <20040913140637.GB29591@redhat.com>	<20040913161326.GB2252@backtop.namesys.com>	<20040913185255.GA1920@redhat.com> <16709.63624.953839.299199@thebsh.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21752-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16709.63624.953839.299199@thebsh.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Nikita Danilov wrote:
>
> If newfile.txt has no +x bit set, then justification is obvious: UNIX
> requires +x bit for lookup, and EACCES is returned when trying to lookup
> anything in a directory (or, in this case, a regular file) without +x
> bit:
>
> $ mkdir zzz
> $ chmod a-x zzz
> $ cat zzz/.htaccess
> cat: zzz/.htaccess: Permission denied
>
> This is how things worked for almost 30 years.
>
> If you observe EACCES on the file with +x bit---this is unknown bug and
> test-case is most welcome.

at least on ext3 and nfs3 i have this:

evil@prinz:/tmp$ touch file.txt
evil@prinz:/tmp$ cat file.txt/.htaccess
cat: file.txt/.htaccess: Not a directory
evil@prinz:/tmp$ chmod +x file.txt
evil@prinz:/tmp$ cat file.txt/.htaccess
cat: file.txt/.htaccess: Not a directory

...which sounds *a bit* more reasonable than "permission denied", but
   "cat: file.txt/: Not a directory"
or
   "cat: file.txt/.htaccess: No such file or directory"

would make even more sense IMHO.

Christian.
- --
BOFH excuse #290:

The CPU has shifted, and become decentralized.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBSB+lC/PVm5+NVoYRAvslAJwLMd7VJlOOIJhkZmYMetspLeWYzQCgsUli
SFgoAG3eMrHn1URscHeoGZM=
=yFbW
-----END PGP SIGNATURE-----
