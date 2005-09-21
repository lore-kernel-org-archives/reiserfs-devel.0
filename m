From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Iron files
Date: Tue, 20 Sep 2005 21:16:02 -0400
Message-ID: <e692861c0509201816ff88eaa@mail.gmail.com>
Reply-To: gmaxwell@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26185-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs List <reiserfs-list@namesys.com>

So the post about file system failure modes made me think of something
interesting...

We'd discussed in the past that it would be interesting to store
cryptographic hashes of files as metadata for facilitating
applications which require hashes as well as data integrity.  Of
course, the challenge is making it perform well.. tree hashes make it
possible but still messy.

Another though on the subject, when we're using the compression plugin
it's quite likely that many blocks will be shrunk quite a bit on
write. We could at that time add a strong checksum (or cryptographic
hash)...  It could just be stored as though it were part of the
compressed data, the cost partly saved by the gains of compression.=20
It would probably be useful to include the file identity and position
offset into the hash for each sub part of the file, so that if an
upper level data structure were corrupted in the FS that you'd never
end up with a part of another file silently sitting in the middle of
another file.

This would enable a policy where files could never be silently
corrupted.  Protection could be controlled on a file by file basis
just like compression and optionally operate in mode where check data
is only written but not tested (no substantial performance loss on
read, but a risk of returning corrupted data to the application).

Just another thought for the never ending list...
