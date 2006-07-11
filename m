From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: any way to disable fsync?
Date: Tue, 11 Jul 2006 23:03:12 +0200
Message-ID: <op.tcjl3meld4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28951-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hi

I got problem with apps that are calling fsync, it makes my hard drive =20
flush like mad and it slows down things quite a lot.
Example:
I'm using amarok and amrok uses sqlite for storing data, sqlite calls =20
fsync after every write so on song change amarok writes to sqlite some =20
statistic data about what I listen and sqllite calls fsync, now I got =20
amarok trying to load next song and sqlite fsyncing and the problem is =20
that fsyncing under reiser4 is expensive, it takes a lot of time even if =20
I'm only running amarok and nothing else ( I got 4200RPM drive in my =20
notebook so it;s not a speed daemon).  I patched sqlite in amarok to fake  =

all fsync and it fixed it but there are other apps that try to secure my =20
data by syncing (I'm now running azareus and only fsyncs called every =20
minute can explain writing to disk at full speed almost non stop while I'm =
=20
downloading only 64KB/s ).
So my question is: is there any way to disable fsync for reiser4? (beside  =

patching it to fake fsync instead of doing them).
Thanks for great fs.

=A3ukasz Mierzwa
