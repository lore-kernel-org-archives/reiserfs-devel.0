From: Chris Mason <mason@suse.com>
Subject: Re: Horrible ftruncate performance
Date: 22 Jul 2003 12:50:50 -0400
Message-ID: <1058892649.5042.29.camel@tiny.suse.com>
References: <Pine.LNX.4.30.0307151407100.6563-100000@divine.city.tvnet.hu>
	 <200307151848.59027.Dieter.Nuetzel@hamburg.de>
	 <20030715170540.GA1213@namesys.com>  <3F1D69AC.5040302@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14989-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1D69AC.5040302@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Dieter N?tzel <Dieter.Nuetzel@hamburg.de>, Szakacsits Szabolcs <szaka@sienet.hu>, Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>, reiserfs-list@namesys.com

On Tue, 2003-07-22 at 12:43, Hans Reiser wrote:
> The answer to the below is to use reiser4.  It uses extents, and two 64 
> bit numbers are all that is needed to store the hole.  V4 will be ready 
> for testing in a few days, and will ship for real users at the end of 
> summer we hope.
> 
> Fixing V3 is  the wrong answer: this is one of its design flaws.

It's important to remember that releasing v4 doesn't automatically
convert all existing v3 users to it.  This is the kind of thing we
should try to fix without making major design changes to v3.  It's at
least worth talking about, "use v4" can't always be the answer.

-chris


