From: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Subject: Re: non volatile ram devices
Date: Sat, 07 Dec 2002 00:53:22 +0100
Message-ID: <m3smxapuvh.fsf@merlin.emma.line.org>
References: <200212042059.35300.russell@coker.com.au>
	<200212051000.32340.russell@coker.com.au>
	<1039094639.8199.119.camel@tiny>
	<200212061052.59139.russell@coker.com.au>
	<1039179813.7803.7.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12125-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1039179813.7803.7.camel@tiny> (Chris Mason's message of "06
 Dec 2002 08:03:33 -0500")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Chris Mason <mason@suse.com> writes:

> This does fsyncs on both the file and the directory in a simulated
> delivery.  It isn't a perfect benchmark, but it does hammer on fsyncs
> nicely.

No need to sync the directory in Postfix if the fsync() makes sure the
filename of a newly created file cannot be lost. I heard this was true
for ReiserFS v3.6 ;-)

-- 
Matthias Andree
