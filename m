From: Juergen Starek <quiterigorouslyfilteredusenetaccount@gmx.de>
Subject: ReiserFS slow, need help diagnosing
Date: Mon, 05 Jun 2006 15:11:29 +0200
Message-ID: <e61aht$7kf$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28727-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello everyone,

I hope this is the right mailing list for my question, if not, please
redirect me.

I have noticed that if I put my ~ on a ReiserFS partition, Pan (GNOME's
newsreader) starts very slowly, taking about 75 seconds. If I move the
same article cache onto an ext3 partition, Pan starts in less than 10
seconds. This confuses me, as I've read a lot of benchmarks and comments
on the net which indicate that ReiserFS is faster than ext3 when handling
lots of small files.

Pan's article cache consists of lots of small files (approx. 70 MB, each
file has only a few kilobytes) and, on my system, it should not be
fragmented too much because I copied the files from an external source
onto the empty volume.

Asking this question on the German Linux newsgroup
de.comp.os.unix.linux.misc[1] didn't lead to any hints about diagnosing
this behaviour. Any ideas?=20

Many thanks in advance

  J=FCrgen

[1]
http://groups.google.de/group/de.comp.os.unix.linux.misc/browse_thread/thre=
ad/d60014be503abebd/

