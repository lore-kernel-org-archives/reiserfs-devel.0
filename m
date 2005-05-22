From: Martin Piayda <martin.piayda@udo.edu>
Subject: Re: Reiser4 O_DIRECT
Date: Sun, 22 May 2005 19:38:41 +0200
Message-ID: <1116783521.22446.9.camel@zion>
References: <1116525192.29446.5.camel@zion>
	 <1116578526.3532.463.camel@tribesman.namesys.com>
	 <1695540869.20050521234900@wp.pl> <42903838.4070500@namesys.com>
	 <20050522171207.GB11013@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050522171207.GB11013@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus TXrnqvist <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

On So, 2005-05-22 at 20:12 +0300, Markus TXrnqvist wrote:
> On Sun, May 22, 2005 at 12:43:52AM -0700, Hans Reiser wrote:
> >What Vladimir failed to say was that it is our recent changes to
> >accomodate the kernel maintainers that are unstable, we had previously
> >reached the point where none of our internal tests could make it crash. 
> >I hope that he did not put these unstable changes on our website for
> >users to see them without special notes....

Aha? This implies to me there are code-chunks which cause these unstable
scenarios, but should not be included in the patches that are available
to the public. I've never had any crashes although my R4 partition is
heavily used for reading/writing small files.
What is the matter of including O_DIRECT in the stable branch of R4
then? Or how do these recent changes affect the R4 patches, that are
merged into the latest mm-sources (akpm)?

