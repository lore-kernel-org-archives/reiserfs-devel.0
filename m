From: Oleg Drokin <green@namesys.com>
Subject: Re: Reiserfs versions
Date: Tue, 19 Nov 2002 10:51:23 +0300
Message-ID: <20021119105123.A3473@namesys.com>
References: <3DD97831.4030607@panix.com> <20021119093526.A32026@namesys.com> <3DD9EC4B.70907@panix.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3DD9EC4B.70907@panix.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kenny gorman <kgorman@panix.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Nov 18, 2002 at 11:46:19PM -0800, kenny gorman wrote:

> I poked around suse's site, and found the 'certified kernel' with:
> 2.4.16-64gb smp

This one is ok.

> reiserfs-3.x.0k_pre10-8

This one is not.

> See any reason why this combination is not a good idea?

reiserfs-3.x.0k_pre10 sounds like something very old.

> How do the version numbers work? I am confused about the 3.x notation 
> and the 3.6 notation you used below...I upgraded my reiserfsprogs to 
> 3.6.4 just in case, but the filesystem rpm is still 3.x.0k_pre10-8 right?

The 3.x notation is the obsoletted one which was supposed to mean 3.5 and 3.6,
recently we changed that confusing scheme to just 3.6.


You can get reiserfsprogs 3.6.4 from our ftp site, build build rpm from it,
and then replace your reiserfs package with fersly built one,
so that your RPM database is in consistent state with what you actually have.

Or may be SuSE people have newer reiserfsprogs already in updates.

Bye,
    Oleg
