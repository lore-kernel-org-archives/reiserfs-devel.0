From: michael chang <thenewme91@gmail.com>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 21:53:32 -0500
Message-ID: <b14e81f00511121853q344119b4r56bd78a22de0f08a@mail.gmail.com>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
	 <1131804415.8550.14.camel@localhost.localdomain>
	 <437662CC.9010307@slaphack.com> <43767289.1000402@namesys.com>
	 <1131843477.21584.3.camel@localhost.localdomain>
	 <b14e81f00511121755r64647fcaj864d1a2b21d73804@mail.gmail.com>
	 <4376A4A0.5010309@namesys.com>
	 <1131849177.21584.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1131849177.21584.36.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

What about a per-file/directory/volume settable minimum interval [at
all three levels] at which files can be set as a new "version"?  So
let's say I want only a new version every 8 hours, I go and set that
somewhere and there will only be a new version if the file has been
changed in the last 8 hours... or if it has been 8 hours since the
last change, or something of the sort.

[That said, in that circumstance, if less than that, should we just
leave the last one we put in, or replace it with this one?]


On 11/12/05, Ming Zhang <mingz@ele.uri.edu> wrote:
> :P yes, cat will modify the last access time as well. but is that really
> worthy a version? maybe so, since the version storage overhead is not
> big anyway.
>
>
>
>
> On Sat, 2005-11-12 at 18:27 -0800, Hans Reiser wrote:
> > maybe cat not touch.....
>
>


--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
