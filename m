From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Feature request: online fsync disable
Date: Fri, 23 Aug 2002 15:52:38 +0400
Message-ID: <15718.8710.244926.960377@laputa.namesys.com>
References: <3D661C89.C8A805D7@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11309-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D661C89.C8A805D7@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Xuan Baldauf <xuan--reiserfs@baldauf.org>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Xuan Baldauf writes:
 > Hello,
 >=20
 > I have a server running which sometimes gets very busy. The
 > running application issues lots of fsync() calls. If it gets
 > very busy, it sometimes is not as fast as required. I
 > believe that most of the time is spent in processing fsync()
 > (commit journal, etc.). In such a situation, I'd like to
 > switch off all fsync()s and risk data loss instead of hours
 > of processing time, which in my case is more important.
 >=20
 > Is implementing such a feature possible? It may be used as
 > follows:
 >=20
 > mount /partition -o remount,disableFsync
 >=20
 > and undone as follows:
 >=20
 > mount /partition -o remount,enableFsync
 >=20

I don't know your particulars, but one way to do such thing is to write
small shared library implementing no-op fsync() function and to use
LD_PRELOAD.

 >=20
 > Xu=E2n.
 >=20

Nikita.

 >=20
