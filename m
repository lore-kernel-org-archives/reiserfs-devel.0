From: Mike Fedyk <mfedyk@matchmail.com>
Subject: Re: dbench regression in 2.6
Date: Wed, 3 Sep 2003 12:43:49 -0700
Message-ID: <20030903194349.GD16361@matchmail.com>
References: <3F5636F5.4060000@austin.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15534-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F5636F5.4060000@austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Pratt <slpratt@austin.ibm.com>
Cc: reiserfs-list@namesys.com

On Wed, Sep 03, 2003 at 01:46:13PM -0500, Steven Pratt wrote:
> Is anyone looing into the dbench multitheaded regression in 2.6 that I 
> reported here a couple of weeks ago?  I don't see any change in the 
> latest trees.
> 
> http://ausgsa.ibm.com/projects/l/ltcperformance/2003benchmarks/regression/results/history-graphs/dbench.reiser.throughput.plot.16.png
> 

If it's only in dbench, it may not be a problem per say.  Dbench does best
when there is less fairness.

Check the latest posts of contest.  There are about 7 improvements with
about 3 regressions.  Dbench regression by itself doesn't really mean a bad
thing happened.
