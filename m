From: "Matthias Urlichs" <smurf@noris.de>
Subject: Document fsck's undo-file option ?
Date: Mon, 16 Sep 2002 05:18:28 +0200
Message-ID: <20020916051828.A10175@noris.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

the undocumented option for reiserfsck to save a file from which to undo
whatever it is reiserfsck did to a file system would have helped me
tremendously, had I known about it. (I had a restored raid-5 where one
disk simply had misplaced data -- I na=EFvely assumed that "dd conv=3Dnoerr=
or"
actually works...  :-( )

Thus I wonder what the rationale is to leave that option undocumented..?

--=20
Matthias Urlichs     |     noris network AG     |     http://smurf.noris.de/
