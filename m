From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: Catastrophe with mailboxes on ReiserFS
Date: Thu, 10 Oct 2002 12:58:23 +0100
Message-ID: <5.1.1.6.2.20021010125534.01dd2cc8@pop.tvnet.hu>
References: <20021009121811.A22948@namesys.com>
 <20021009094215.B11954@namesys.com>
 <Pine.LNX.4.44.0210091041350.880-100000@fii.fi.tartu.ee>
 <20021009121811.A22948@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <m3u1jvw6ra.fsf@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

What are those write barrier patches? and where can I find them? I was also 
hurted by several 'cross linked' files, described in here. is there a way 
to deactivate write caching for just one filesystem?
regards, greg

ps: please somebody let me know where I can find documentation about those 
chris mason patches, or at least what is dara=ordered or data=journal 
options. everybody talks about it, nobody explains. or did I miss something?

>I'd like to see these patches merged. I hurt myself several times with
>reiserfs, when the computer locked up during heavy file system activity,
>with NUL blocks in files, files mixed up and the like. I've never seen
>this on any data=ordered or data=journal file system, regardless of ext3
>or reiserfs.
>
>Of course, write caches must be turned of or write barrier patches be
>applied to be safe in case of a power blackout.
>
>--
>Matthias Andree


