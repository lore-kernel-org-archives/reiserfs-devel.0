From: Pierre Abbat <phma@webjockey.net>
Subject: Re: Proposal for keying encrypted filesystem
Date: Thu, 3 Apr 2003 18:22:11 -0500
Message-ID: <200304031822.12677.phma@webjockey.net>
References: <200303282026.23543.phma@webjockey.net> <3E89B908.1070106@namesys.com> <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13563-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

On Thursday 03 April 2003 11:14, Valdis.Kletnieks@vt.edu wrote:
> A better bet would be to use the LSM security framework to create a module
> that carries the tokens around for the process - this could even allow you
> to do things like add a new key token to a process group leader and have
> it propagate to already-running children (which is a phenomenally useful
> thing to do that you can't do with an environment variable).  So for
> instance, you could add a new key to your X login process, and all the
> myriad subshells would get it - and thus any processes THEY launch) without
> the need to log out from X and log back in again...

What's LSM? This sounds like it can do what I want with rsync. Is it possible 
to add a new key token to init and have it propagate to all processes?

phma
-- 
.i toljundi do .ibabo mi'afra tu'a do
.ibabo damba do .ibabo do jinga
.icu'u la ma'atman.
