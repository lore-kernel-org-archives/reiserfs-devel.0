From: "David Dabbs" <david@dabbs.net>
Subject: Re: reiser4 oops on unmount
Date: Wed, 25 Aug 2004 02:12:03 -0000
Message-ID: <20040825021203.E7B0C15E5C@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

>Chris Masin wrote:
>
>Hello everyone,
>
>I was testing reiser4 in the suse kernel and hit an oops during
>unmount.  This could be a problem with my local merge, but I wanted to
>send here in case it is obvious.
>
>The workload was create a few files and dirs, delete them, create 1
>million files in a single dir, sync, unmount.
>
>

Chris I also experienced issues during umounts while running Namesys' mongo benchmarking utility under SuSE 9.1. That was around the 2.6.7-mm1/2 timeframe. Haven't rerun the benchmarks since. Will rerun it when I get back home. Were you running a SuSE-internal config or on a config I can attempt to reproduce?


David

