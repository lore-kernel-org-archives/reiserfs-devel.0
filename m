From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 12:05:24 +0400
Message-ID: <200308121205.24434.vitaly@namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com> <1060673517.21149.7.camel@haron.namesys.com> <20030812080212.GA23206@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030812080212.GA23206@chepelov.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Cyrille Chepelov <cyrille@chepelov.org>, Yury Umanets <umka@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

> Another little glitch is that the configure.in explicitly checks for 0.4.8
> while the provided libaal is 0.4.9. No biggie, just requires modifying the
> configure.in and re-running autoconf (you might want to add a check against
> that condition in your pre-upload QA scripts).

yes, thanks, I have found and fixed it already.
Vitaly Fertman
