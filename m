From: David Masover <ninja@slaphack.com>
Subject: Re: "Metas"
Date: Sun, 25 Apr 2004 00:05:48 -0500
Message-ID: <408B472C.5090000@slaphack.com>
References: <408045B8.7000102@mrs.umn.edu> <20040418033328.24278.qmail@web25006.mail.ukl.yahoo.com> <c5t3lg$g9g$1@satsuki.furryterror.org> <40869EAD.9020806@namesys.com> <4086ABE8.4090806@mrs.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18197-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4086ABE8.4090806@mrs.umn.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Grant Miner <mine0057@mrs.umn.edu>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

| But...what about the UNIX security issues where files that aren't
| executable can't have their "metas" accessed?  I suppose that will
| require extensive VFS changes and coordination with Al Viro?

I had an idea I was all ready to send in again, but it doesn't quite
work.  The idea was to make execute mean "execute", and have no meaning
for directories.  Rather, directories are either "readable" or "not
readable".

Another idea which seems to work much better is to merely have two modes
for each file -- one for the file-as-a-file and one for the
file-as-a-directory.  This could allow for files in which the file can
be read, but none of its children can.  By default, foo/ has the same
permissions as foo, but foo/ is guarenteed to have an execute bit when
foo is first created.  The problem is making this efficient -- for
almost all files, this would never be changed, but for some files, it
would, which suggests something like inheritance -- if a certain
property of a file does not exist, it is inherited from the parent, and
/ would have sane properties.

I like both ideas, because I think the execute bit on directories is
useless for everything except reiser4, but then I thought:  maybe foo is
a hash of foo/password, but foo/password is read/write, not just write,
so with reiser4, it makes sense to be able to read() but not readdir()
or chdir(), even if it still doesn't make sense to be able to
read/readdir but not chdir.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQItHK3gHNmZLgCUhAQIuPBAAne/dW0NJZsrz5O2nEUnswdka1tLGmtKq
j3u5qOu3mBJditsrUDBCzlA2OKEbn+lEjZAPzOxE/K3Ov/AiQuvV0VJdjscLoRhE
nBBqVXHbrf0xK0TIKm/J8IFY94ki/FkJ2Qnb7OnGfyldbTDhl9myl/E7jgPDjgNG
R1dkF3hfT8phDHwBEdPPAvU5f9stR8mRsk39DoIH6rwHdN3F35Nb15H6pzdWgd0C
uAsqwRqiX1TmGsbg6buTmXl3gfgf1fKEFpTZu6gE7CTrebtidc6S1vtIF2hQEdog
6JIHF40bI51cGV79ob0yebXfD3gxBeXKYUE97CCptQbHxJBsCkNrG1G9OHd6AINl
HifQnQg5bH/VieyygoANwZVyxWbpGsk/6t5Toz7mLB2eUZJgRe8uNvJhkWjg/SKI
NsMwGbKeXNNUkE3X8yJfhdeG2tKY1N95E4u8aE3EIwNYbqSiwhWqMzwVjCPE3Ueu
i6ZGVO7/Kmc+iPbFEKGmwGrbxEany7edAv33QoZfATMoGRTE5uBHsUkCWWl466B9
vCUMXR5UaL9DK8FANw7czZbcDwIqEw8S/IFeCOYEq1naQl7XsvBrunu0tC+9RKvs
XnMqxmDbroIizpA7lsEyeXZXO/Hg3H3vZCudqfbJbQajeT9P/1qvvJvA4VcNxFsP
sq1bYtpHJFE=
=Kmts
-----END PGP SIGNATURE-----
