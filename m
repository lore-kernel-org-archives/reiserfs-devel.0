From: Oleg Drokin <green@namesys.com>
Subject: Re: bad_stat_data: block 1557090, [921 189485 0x0 SD (0)], SD has bad nlink number
Date: Tue, 6 Aug 2002 18:51:14 +0400
Message-ID: <20020806185114.A17719@namesys.com>
References: <20020804092716.GA17343@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20020804092716.GA17343@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Sadlowski <sadlowsk@mathematik.Uni-Bielefeld.DE>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Aug 04, 2002 at 11:27:16AM +0200, Bernhard Sadlowski wrote:

> I see errors which won't be corrected with "--fix-fixable", although
> reiserfsck says they will. Are they serious? Bug in reiserfsck?

The prediction of something that might be fixed with --fix-fixable is somewhat
optimistic and not always comes true.

> Checking S+tree../  1 (of   3)/ 12 (of 166)/ 18 (of  92)bad_stat_data:
> block 1557090, [921 189485 0x0 SD (0)], SD has bad nlink number
> /  3 (of   3)/ 67 (of 100)/  9 (of 170)bad_stat_data: block 1582967,
> [198978 198986 0x0 SD (0)], directory SD has bad nlink number

these 2 corruptions are very minor. These are just files that were deleted, but
some of their info left on disk, so nothing really serious.

Actually --fix-fixable output looks bogus, we'll look into it deeper,
thank you for the report.

Bye,
    Oleg
