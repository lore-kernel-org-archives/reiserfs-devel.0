From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Can we have announcements on reiserfs-progs' progress?
Date: Wed, 28 Aug 2002 16:58:25 +0400
Message-ID: <200208281658.25707.vitaly@namesys.com>
References: <3D6C3FCA.5000908@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D6C3FCA.5000908@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

On Wednesday 28 August 2002 07:13, Manuel Krause wrote:
> Hi all!
>
> Thank you all for making me able to complain again. :-)) Sorry...
>
> I found a new pre-release of the reiserfs-progs on the namesys server.
>
> Can we have announcements on the list even about those prerelease facts
> and a summarized Changelog with it?

Actually I intended to put it on our internal ftp server for testing, but 
put it mistakenly to public ftp instead - that is why tehre was no annoncement. 
As no problem was found so far, I have put it to pre folder and yes, we can 
annonce

> The actual Changelog diff seems to be quite important:
> "2002-15-11
>    * reiserfsck
> 	Correction of nlinks on fix-fixable was disabled, because
> 	fix-fixable zeroes nlinks on the first pass and wants to
> 	increment them on semantic pass. But semantic pass is skipped
> 	if there are fatal corruptions.
> 2002-08-11
>    * reiserfsck
> 	exit codes were fixed"

And another one small bug in fsck was fixed.
Many warning/error messages were changed to more user friendly form.

> And avoid "2002-15-11" in the packages' Changelog _before_ this date has
> gone - That may confuse my mind completely before having my coffee in
> the morning  ;-))

;) ok it is fixed.

Ok, there is a new 3.6.4-pre1 version in the pub/reiserfsprogs/pre folder. 

-- 

Thanks,
Vitaly Fertman
