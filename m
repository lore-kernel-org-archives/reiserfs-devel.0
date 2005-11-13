From: michael chang <thenewme91@gmail.com>
Subject: Re: Versioning Plugin
Date: Sat, 12 Nov 2005 20:56:07 -0500
Message-ID: <b14e81f00511121756j1ef4ccbpa41e28ce2aed257d@mail.gmail.com>
References: <200511111359.39715.jgilmore@glycou.com>
	 <200511111656.04891.pvh@uvic.ca>
	 <1131804415.8550.14.camel@localhost.localdomain>
	 <437662CC.9010307@slaphack.com> <43767289.1000402@namesys.com>
	 <1131843477.21584.3.camel@localhost.localdomain>
	 <b14e81f00511121755r64647fcaj864d1a2b21d73804@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26894-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511121755r64647fcaj864d1a2b21d73804@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: Hans Reiser <reiser@namesys.com>, David Masover <ninja@slaphack.com>, Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com

On 11/12/05, michael chang <thenewme91@gmail.com> wrote:
> That way, if there is version X which is a file, and verison Y is just
> a line at the top, the compression eliminates the duplication, so
> instead of
>
> (old version + new version)
> ABCDEF + XABCDEF
>  on disk
> it becomes something like
> Y=3DABCDEF

correction:
> X + XY

should be
Y + XY [sorry for any confusion]

--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
