From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas	thread)
Date: Wed, 14 Apr 2004 10:06:17 -0500
Message-ID: <407D5369.5090509@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com>	 <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com>	 <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com>	 <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com>	 <407C316B.80606@namesys.com> <407C35B0.3080109@pobox.com>	 <200404132031.i3DKVqRg009355@turing-police.cc.vt.edu> <1081909092.6753.64.camel@arabia.home.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17937-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081909092.6753.64.camel@arabia.home.lan>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Enrique Perez-Terron <enrique.perez-terron@norway.online.no>
Cc: reiserfs-list@namesys.com

Enrique,

Enrique Perez-Terron wrote:
> On Tue, 2004-04-13 at 22:31, Valdis.Kletnieks@vt.edu wrote:
> 
>>On Tue, 13 Apr 2004 13:47:12 CDT, "John D. Heintz" said:
>>
>>>foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions
>>>
>>>This assumes a mapping from "nsa" -> "nsa.gov/security/".
> 
> 
> Implementing a mapping "nsa" -> "nsa.gov/security/" does not remove the
> headache of what to do with a tarball containing a directory named
> "nsa".


A directory or file named "nsa" doesn't conflict with this scheme, look 
more closely at the left hand side: foo/nsa:permissions

foo/nsa/permissions wouldn't receive the same treatment and would 
instead just be a regular file or directory lookup.

Two conditions are necessary to trigger the syntactic manipulation I'm 
suggesting:
1) a ':' must be present in the name being resolved (i.e. nsa:permissions)
2) The prefix before the ':' must be in the mappings (i.e. nsa)

Only if both of those are present does anything special happen.

A tarball containing "secure-linux/nsa/src/*.c" wouldn't break anything, 
and is so likely that no suggestion should risk breaking this case.

However, a tarball containing "secure-linux/nsa:src/*.c" would indeed 
break my scheme. I'm suggesting this is an ignorably small likelyhood. 
Others are free to disagree with this of course.

John Heintz

