From: Hubert Chan <hubert@uhoreg.ca>
Subject: another semantic storage system (in userspace)
Date: Wed, 12 Jul 2006 17:44:05 -0400
Message-ID: <87veq233dm.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28980-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I thought this may be interesting to the people on the list.

I was pointed to the GLScube project (http://www.glscube.org/), which
tries to implement semantic storage in usesrpace.  GLScube (GLS^3)
stands for GNU/Linux Semantic Storage System.  It provides a C++ API for
programmers to use, and also exports a virtual filesystem (glscubefs)
using FUSE, so that legacy applications can take advantage of its
functionality.  It performs incremental indexing (I assume using
either inotify or dnotify).

It is licensed under the GPL and can be downloaded from their website.
Unfortunately, the 0.1 tarball that I downloaded doesn't seem to include
Makefiles, so I'm not sure how to build it.

They also have video demos available on the site.

I think that what makes this more interesting to ReiserFS people,
compared to, say, Beagle, is the glscubefs, which allows legacy
applications to take advantage of GLScube functionality.  Although we'll
have to see how much functionality is actually exposed through glscubefs
(i.e. can we do everything from the commandline?).

-- 
Hubert Chan - email & Jabber: hubert@uhoreg.ca - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA   (Key available at wwwkeys.pgp.net)
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA

