From: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Subject: Feature request: online fsync disable
Date: Fri, 23 Aug 2002 13:29:13 +0200
Message-ID: <3D661C89.C8A805D7@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11308-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hello,

I have a server running which sometimes gets very busy. The
running application issues lots of fsync() calls. If it gets
very busy, it sometimes is not as fast as required. I
believe that most of the time is spent in processing fsync()
(commit journal, etc.). In such a situation, I'd like to
switch off all fsync()s and risk data loss instead of hours
of processing time, which in my case is more important.

Is implementing such a feature possible? It may be used as
follows:

mount /partition -o remount,disableFsync

and undone as follows:

mount /partition -o remount,enableFsync


Xu=E2n.


