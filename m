From: "daniel.poelzleithner" <poelzi@poelzi.org>
Subject: Re: Comments about indexing and query solving in user land
Date: Tue, 07 Sep 2004 22:09:25 +0200
Message-ID: <413E1575.4000704@poelzi.org>
References: <-3757055227027460326@unknownmsgid> <2f4958ff040906055172c36214@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-21585-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2f4958ff040906055172c36214@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: =?UTF-8?B?R3J6ZWdvcnogSmHFm2tpZXdpY3o=?= <gryzman@gmail.com>
Cc: Faraz S <farazs@calsoftinc.com>, ReiserFS List <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Grzegorz Ja=C5=9Bkiewicz wrote:

|>        In our project http://sourceforge.net/projects/linuxsfs-tm/ we
did the
|>attribute indexing and query parsing in the user-space and we had hooks
|>in the VFS which communicated with the user-space deamons. As far as
|>directory listing is concerned we had a in kernel-recordset cache
|>(hashed on the query). The listing were pretty efficient.
|>
|>        But the real problem occured when a large number of files were
copied
|>in the onto our file system. All the files now need to be indexed in the
|>user space , leading to mode switch. That was pathetically slooow. The
|>entire 2.4 sources were copied in 5-6 hours. I think this problem could
|>be solved by batching requests the user space deamon.  Then u have all
|>the problems on missing out on indexing on a large set of files.
|
| I think that should give you pretty much explanation why whole VFS
| layer and filesystems are in kernel not in user space. That's where
| such sort of thing belongs to. I have no doubts.

I think such operations should be a background task. When a new file is
created, the file should be added to a index queue and the file
operation should return. These queue list will be processed by an
background daemon.
Only when meta data are accessed which is unindexed the file will be
removed from the queue and proccessed instandly, so the system call can
return.
I think such a technique would reduce the speed impact indexing brings.

regards
~ Daniel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBPhV1y/mkIQp7AD0RAqonAJ9ww2VAPKnX7u9q1euyKZbYBK9zGQCg2fI9
mC6bQ5IiRuafCrX+O3I7oJw=3D
=3DQ8mj
-----END PGP SIGNATURE-----
