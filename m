From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Can we have announcements on reiserfs-progs' progress?
Date: Wed, 28 Aug 2002 05:13:14 +0200
Message-ID: <3D6C3FCA.5000908@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11331-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list <reiserfs-list@namesys.com>

Hi all!

Thank you all for making me able to complain again. :-)) Sorry...

I found a new pre-release of the reiserfs-progs on the namesys server.

Can we have announcements on the list even about those prerelease facts 
and a summarized Changelog with it?

The actual Changelog diff seems to be quite important:
"2002-15-11
   * reiserfsck
	Correction of nlinks on fix-fixable was disabled, because
	fix-fixable zeroes nlinks on the first pass and wants to
	increment them on semantic pass. But semantic pass is skipped
	if there are fatal corruptions.
2002-08-11
   * reiserfsck
	exit codes were fixed"

And avoid "2002-15-11" in the packages' Changelog _before_ this date has 
gone - That may confuse my mind completely before having my coffee in 
the morning  ;-))


Best wishes and thanks to you,

Manuel

