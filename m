From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: COW files
Date: Sat, 29 Oct 2005 04:01:43 -0400
Message-ID: <e692861c0510290101u55e5a3a5t898ad72768f8bd1a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Any thought to making a file plugin that creates copy on write files?
The operation would be something like a hardlink which is invisible to
the user and broken as soon as either file is modified.

Files could be COWed by a flag on the cp command (or really, perhaps
that should be the default behavior) or with a utility (perhaps run as
a periodic script to locate duplicates and COW them. This would
greatly speed up the process of copying files.

The behavior on break could be to duplicate the whole cowed file on
the first right, or allow a COWed file to have alternate choices for
blocks. Files would remain cowed until decowed, which would likely be
bad for performance (due to fragmentation of alternate versions
causing gaps in sequential scans), so the repacker could be taught to
decow files that have too many alternate blocks.
