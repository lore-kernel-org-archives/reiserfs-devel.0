From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: reiser4 ; regressions in 2.6.14-rc1-mm1
Date: Tue, 20 Sep 2005 21:32:20 +0200
Message-ID: <op.sxe1v6fud4os1z@localhost>
References: <dgpm57$i5s$1@sea.gmane.org> <433062AE.1010405@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26152-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <433062AE.1010405@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Tue, 20 Sep 2005 21:27:42 +0200, David Masover <ninja@slaphack.com> na=
pisa=B3:

> Laurent Riffard wrote:
>
>> A) Suspend-to-disk does not work because the process "[ent:hda8]" can't =
be stopped.
>
> Strange, this used to work.  Haven't had occasion to try it again
> lately, though.
>
>> B) Can't mount a loop file on reiser4 :
>
> I do this all the time, though not on the mm kernel.  ext3 loop file on
> a reiser4 disk, reiser4 loop file on a reiser4 disk.  Haven't tried
> reiser4 loop file on an ext3 fs.
>
> Can anyone else confirm this?
>

ent:hda5 started to use 100% of cpu time on my system making it pretty usus=
able (under 2.6.14-rc1-mm1), reiser4 from 2.6.13-mm1 and 2.6.13-mm3 gave me=
 kernel bugs on dcache. I went back to 2.6.12 + patch from namesys ftp (rei=
ser4-for-2.6.12-3.patch.gz).
