From: Chris Mason <mason@suse.com>
Subject: Re: Reiser3.6 open file troubles on AMD64 + 2.6.0-test ??
Date: Mon, 01 Dec 2003 08:43:53 -0500
Message-ID: <1070286233.12807.17.camel@tiny.suse.com>
References: <20031128220751.GF1799@hvs.envisage.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031128220751.GF1799@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hendrik Visage <hvisage@envisage.co.za>
Cc: reiserfs-list@namesys.com

On Fri, 2003-11-28 at 17:07, Hendrik Visage wrote:
> Hi there, 
> 
>  I've heard a couple of reports of reiserfs trouble on 
> AMD64 (2.6.0-test10 or later) when the kernel panics/crashes,
> where by all open libraries (files?) are then lost.
> 
>  Any confirmation on this bug? If so, are there plans at present
> to fix it or are you waiting for a official support request } payment?

reiserfs gets used heavily on amd64, I haven't had any problems so far. 
But, I'm running test9 right now, so I'll give the latest and greatest a
try.

-chris


