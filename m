From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Reiser4 hard locks. Volunteering for testing.
Date: Mon, 16 Aug 2004 01:37:31 +0300
Message-ID: <20040815223731.GV1284@nysv.org>
References: <411FDEA9.9020404@mapdesign.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <411FDEA9.9020404@mapdesign.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Thompson <vagabond@mapdesign.net>
Cc: reiserfs-list@namesys.com

On Sun, Aug 15, 2004 at 11:07:37PM +0100, Andrew Thompson wrote:
From what I've seen of it when its not locking up its extremely fast 
>and since you say Reiser4 needs more testers I'm volunteering. I'll run 
>any kernel you want, turn on any debugging options whatever if it will 
>help somebody track down the problem.

Welcome aboard! :)

DEBUG and DEBUG_MESSAGES are needed.
Frame pointers are often good too.

Wasn't there some case where printing was also needed?

Also any information on what the circumstances are when it breaks is
welcome.

PS.
I'm not with Namesys, but another guy who's testing ;)

-- 
mjt

