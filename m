From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: using of XATTRs instead of pseudo files for accessing
Date: Wed, 7 Apr 2004 10:55:24 +0300
Message-ID: <20040407075524.GY5229@nysv.org>
References: <1081253603.4977.77.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1081253603.4977.77.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Chris Mason wrote:

>But, there are existing apps using the xattrs, it makes sense to get
>them for a relatively small programming effort in reiser4 instead of
>having to modify each one and get patches up stream.

As Alex Zarochentsev pointed out, he just wanted to present an alternative
in xattrs and that someone would implement them if they were considered
good.

Hans Reiser (a bit rudely, if you don't mind me saying, but I'll
say it anyway) shot this down.

I haven't had time to investigate this matter, but is it possible to
map the Reiser4 API onto the xattrs API? I may be way out of my league
here, but isn't the Reiser4 API mostly a better ("better") xattrs
implementation?

A transparent layer in between would probably please most parties,
and if Namesys isn't interested, someone else would do it, no?

Reiser4, as superb as it is, is pretty borderline to some standards.
I think it paramount to acknowledge this and minimize upstream patches.

Upstream patches may piss off a lot of people, especially in cases
where they have written something minor for themselves and compensating
for this is more work than what seems ok.

IMO, Reiser4 should be able to work just as any other fs in those cases
when it's needed, without having to worry about the sexy details
which people will use in other cases.

-- 
mjt

