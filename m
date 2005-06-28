From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: reiser4 plugins
Date: Mon, 27 Jun 2005 21:10:44 -0400
Message-ID: <e692861c050627181060527e21@mail.gmail.com>
References: <42BB7B32.4010100@slaphack.com>
	 <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl>
	 <20050627092138.GD11013@nysv.org> <20050627124255.GB6280@thunk.org>
	 <42C0578F.7030608@namesys.com> <42C05F16.5000804@xfs.org>
	 <20050627202841.GA27805@thunk.org> <42C06873.7020102@xfs.org>
	 <42C0868E.4080003@punnoor.de> <42C09C91.6000901@namesys.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24733-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42C09C91.6000901@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

On 6/27/05, Hans Reiser <reiser@namesys.com> wrote:
> >. But nevertheless it didn't survive, as like V3, with time V4 became
> >slower and slower. In this case no year was needed, but just one month o=
r
> >alike. So end of test...but in fact I'll give V4 another go in the near =
future.
> Interesting that it got slower with time.  It sounds like our online
> repacker is much needed.  It will be a priority for after the kernel merg=
e.

Whered it go, I recall it being activated with:
echo 1 >/sys/fs/reiser4/*/repacker/start
