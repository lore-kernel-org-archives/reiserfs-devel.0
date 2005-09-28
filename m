From: Hans Reiser <reiser@namesys.com>
Subject: Re: Full of surprises - A reiser4 story from userland
Date: Wed, 28 Sep 2005 11:07:57 -0700
Message-ID: <433ADBFD.7070804@namesys.com>
References: <1127914812.12894.96.camel@laptop>	 <200509281825.49873.vitaly@namesys.com> <5d8b7b905092807514da5958e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5d8b7b905092807514da5958e@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Islam Amer <pharon@gmail.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com, Fionn Behrens <fionn@spamfilter.de>

I apologize that the latest reiser4 with the cleanups requested by
Hellwig is more than a bit of a turkey (due to bugs in our cleanups). 
We just now sent some patches which will improve things, but I don't yet
have confidence in the code, and will not until we go for two weeks with
no reports of problems.  It may also be that the new to -mm write
throttling patch is causing us problems, we are still investigating.

Hans
