From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 11:00:22 -0500 EST
Message-ID: <1697679318-BeMail@cr593174-a>
References: <200212231421.52052.bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12222-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200212231421.52052.bofh@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote on Mon, 23 Dec 2002 14:21:52 +0100:
> Mail serving with Maildir storage.

Same sort of thing here.  Thousands of e-mail and news files in
a directory, so displaying them in a GUI directory display window
can be slow.  Particularly if it is also getting attributes to
display (from, to, subject, date, thread).  This is under BeOS/BFS
and can get a bit slow if the attributes end up in disk sectors
far away from the inode for the file (but speed is good when block
size (=3D=3D inode size) is boosted up enough so that the attributes
all fit in the inode).

So, directory reading speed plus attribute reading speed are
important to me.

- Alex


