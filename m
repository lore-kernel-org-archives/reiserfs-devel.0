From: Philipp =?iso-8859-1?q?G=FChring?= <p.guehring@futureware.at>
Subject: Performance question
Date: Sun, 5 May 2002 16:20:13 +0200
Message-ID: <200205051420.g45EKKo02315@linux1.futureware.at>
Reply-To: p.guehring@futureware.at
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10245-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Let's say I have a directory with 100.000 files in it.
The filenames look like

name1_name2_name3_id

So I have

001_41052_50125_1
001_63216_1212_1
...


I have to create a search engine, that serves for example the 4th Block of =
10=20
files that match the query "001_*_1212_1". The how query would result to 10=
0=20
files, that are spread across the directory.

Now my question:

Is it faster with ReiserFS to do a bsd_glob("001_*_1212_1") first, which=20
should result to about 100 entries, and then take the entries 40 to 49 from=
=20
the resulting array?=20
(Is ReiserFS able to directly return 100 files out of 100000 with the=20
globbing function, or is it an iteration over all files in the directory?)

Or should I do 2 opendir-readdir loops, one to read over the first 39=20
results, that I do not need, and the second one to geht the results 40 to 4=
9?
The problem here is that I have to readdir about 50000 files (40000 to get =

through the unneeded results, and 10000 to get the 10 results i need)
But on the other hand, I do not have to remember 100 files, from which I on=
ly=20
need 10.

If ReiserFS has to iterate over 100000 files (the whole directory) to do a =

"001_*_1212_1" glob, because the binary tree only speeds up known files, bu=
t=20
not patterns, then opendir-readdir should be faster, I guess.

Another option would be to use subdirectories like
name1/name2/name3/id

So the glob would be "001/*/1212/1", which should be faster, anyway.
But on the other hand, I would have to do a lot more directory management, =

creating and deleting directories ...
And implementing an opendir-readdir search through "001/*/1212/1" will be=20
more work too.

Thanks for all feedback in advance and many greetings,
- --=20
~ Philipp G=FChring              p.guehring@futureware.at
~ http://www.livingxml.net/       ICQ UIN: 6588261
~ <xsl:value-of select=3D"file:/home/philipp/.sig"/>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE81T+elqQ+F+0wB3oRAhw/AKCRH5CbdIMt2+ITpDkNBwcPKYpPqQCgmC2e
RrYDyo/GgzqJvnn1jy1HjiY=3D
=3D/ABd
-----END PGP SIGNATURE-----
