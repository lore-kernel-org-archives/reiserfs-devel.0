From: Joe Perches <joe@perches.com>
Subject: Re: [RFC 1/1] fs/reiserfs/journal.c: Remove obsolete  __GFP_NOFAIL
Date: Sat, 22 Mar 2014 11:56:35 -0700
Message-ID: <1395514595.3667.10.camel@joe-AO722>
References: <20140321171830.ef47fdea1a3a2f2921c8fe86@skynet.be>
	 <20140321130055.c0ea32946f3543cd7f6bedd6@linux-foundation.org>
	 <20140322170322.GA23583@thunk.org>
	 <20140322101512.eaeb542b.akpm@linux-foundation.org>
	 <20140322172606.GB23583@thunk.org> <20140322173207.GC23583@thunk.org>
	 <20140322105524.7baec73a.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20140322105524.7baec73a.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tytso@mit.edu, Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, David Rientjes <rientjes@google.com>

On Sat, 2014-03-22 at 10:55 -0700, Andrew Morton wrote:
> On Sat, 22 Mar 2014 13:32:07 -0400 tytso@mit.edu wrote:
> 
> > On Sat, Mar 22, 2014 at 01:26:06PM -0400, tytso@MIT.EDU wrote:
> > > > Well.  Converting an existing retry-for-ever caller to GFP_NOFAIL is
> > > > good.  Adding new retry-for-ever code is not good.
> > 
> > Oh, and BTW --- now that checkpatch.pl now flags an warning whenever
> > GFP_NOFAIL is used
> 
> I don't know what the basis for this NOFAIL-is-going-away theory could
> have been.  What's the point in taking a centrally implemented piece of
> logic and splattering its implementation out to tens of different
> callsites?
[]
> diff -puN scripts/checkpatch.pl~scripts-checkpatchpl-__gfp_nofail-isnt-going-away scripts/checkpatch.pl
[]
> @@ -4240,12 +4240,6 @@ sub process {
>  			     "$1 uses number as first arg, sizeof is generally wrong\n" . $herecurr);
>  		}
>  
> -# check for GFP_NOWAIT use
> -		if ($line =~ /\b__GFP_NOFAIL\b/) {
> -			WARN("__GFP_NOFAIL",
> -			     "Use of __GFP_NOFAIL is deprecated, no new users should be added\n" . $herecurr);
> -		}

How about just changing this message to something like:

			WARN("__GFP_NOFAIL",
			     "Use of __GFP_NOFAIL may cause the OOM handler to kill a random process\n" . $herecurr);

