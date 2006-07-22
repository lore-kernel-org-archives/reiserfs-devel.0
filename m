From: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Subject: Re: future r4 maintenance question
Date: Sat, 22 Jul 2006 22:04:39 +0200
Message-ID: <16810401141.20060722220439@wp.pl>
References: <1992401892.20060722173244@wp.pl> <1153594386.6659.172.camel@ipso.snappymail.ca>
Reply-To: =?windows-1250?Q?Maciej_So=B3tysiak?= <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1153594386.6659.172.camel@ipso.snappymail.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Mike,

Saturday, July 22, 2006, 8:53:06 PM, you wrote:
> I don't understand the concerns here? Kernel v2.4 is essentially in
> "bug-fix only" mode right now, yet I don't see many people complaining
> that the kernel developers have abandoned it. I personally think its
> crazy to expect major features be back ported to old versions. 

> For as long as I've been alive programmers have released a major version
> of their software, and only maintained it with minor version bug fixes
> while they work on the next major version to introduce features to it.

> Hans himself has pretty much followed that same path with ReiserFS V3,
> and now V4. There just happened to be a several year gap in between.
Well, that's completely clear. However, reiserfs has had a different situation:
during the bugfix mode, important functionality was beeing added to other
filesystems: extended attribute support, data=ordered, data=journaled.
Reiserfs v3 had noone but Chris Mason (outside of namesys) to do it.

The issue is that reiser4 users should never again feel abandoned like they
did with reiserfs v3. Well, actually a lot of people did not feel it or they
hadn't known about the state of things. Note that back then reiser4 was
basically vapourware if I may say so.

Concluding, I am not here to point anything bad, I am looking adoption-stoppers
for reiser4.

BTW, have Mark Shuttleworth and Hans had a talk about support/sponsorship/ubuntu
endorsement/anything? (i know it may be absolutely private stuff, sorry for asking
if this is the case)

-- 
Best regards,
Maciej


