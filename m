From: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re:
	metas	thread)
Date: Thu, 15 Apr 2004 01:39:58 +0200
Message-ID: <1081985995.6745.110.camel@arabia.home.lan>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com>
	 <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com>
	 <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com>
	 <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com>
	 <407C316B.80606@namesys.com> <407C35B0.3080109@pobox.com>
	 <200404132031.i3DKVqRg009355@turing-police.cc.vt.edu>
	 <1081909092.6753.64.camel@arabia.home.lan>  <407D5369.5090509@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407D5369.5090509@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

On Wed, 2004-04-14 at 17:06, John D. Heintz wrote:
> Enrique Perez-Terron wrote:
> > On Tue, 2004-04-13 at 22:31, Valdis.Kletnieks@vt.edu wrote:
> >>On Tue, 13 Apr 2004 13:47:12 CDT, "John D. Heintz" said:
> >>
> >>>foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions
> >>>
> >>>This assumes a mapping from "nsa" -> "nsa.gov/security/".
> > 
> > 
> > Implementing a mapping "nsa" -> "nsa.gov/security/" does not remove the
> > headache of what to do with a tarball containing a directory named
> > "nsa".
> 
> 
> A directory or file named "nsa" doesn't conflict with this scheme, look 
> more closely at the left hand side: foo/nsa:permissions

You are right, thank you.

> However, a tarball containing "secure-linux/nsa:src/*.c" would indeed 
> break my scheme. I'm suggesting this is an ignorably small likelyhood. 
> Others are free to disagree with this of course.

I agree.

Regards,
Enrique

