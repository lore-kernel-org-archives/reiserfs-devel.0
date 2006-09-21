From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: reiser4 resize
Date: Thu, 21 Sep 2006 09:52:13 +0200
Message-ID: <op.tf7xhbxbd4os1z@localhost>
References: <eeng4b$i68$1@sea.gmane.org> <200609191723.01936.vs@namesys.com> <45102ED6.6080209@slaphack.com> <b5d90b2a0609200039g70c40f5bvb374b5f15b42988d@mail.gmail.com> <op.tf52pansd4os1z@localhost> <b5d90b2a0609200200s5838456bm618093395356390a@mail.gmail.com> <45123F81.4040909@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29955-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45123F81.4040909@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Thu, 21 Sep 2006 09:30:09 +0200, David Masover <ninja@slaphack.com> =20
napisa=B3:

> On 9/20/06, =A3ukasz Mierzwa <prymitive@pcserwis.net> wrote:
>  It's been proven that flushes are doing much more job then they should.
> Not so long ago someone send a trace of block device io accesess during
> reiser4 work and someone anylized it and said that some files or parts of
> file where written over and over 200 times or so.
>  Wow.  I should go back and read that -- I assume this is being worked =20
> on?

Well it was not a file but a block, but the effect is the same.

http://marc.theaimsgroup.com/?l=3Dreiserfs&m=3D115488109712570&w=3D2
