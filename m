From: Oleg Drokin <green@namesys.com>
Subject: Re: EVMS Reiser FSIM
Date: Fri, 31 May 2002 13:26:51 +0400
Message-ID: <20020531132651.A9201@namesys.com>
References: <OFDCF5C080.996B2948-ON85256BC9.005E8AA0@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OFDCF5C080.996B2948-ON85256BC9.005E8AA0@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, May 30, 2002 at 12:14:03PM -0500, Steve Pratt wrote:

> >Yes, I know this.
> >I just want to confirm that the only way to look at it right now is to get
> >latest CVS version out of their cvs repository.
> At the moment CVS is the only place this is available.  I wanted to give
> you guys a heads up that it was coming.  We should be doing a version 1.1
> package in the next couple of weeks and the ReiserFS FSIM will be included
> in that.

Ok, I had a look into the CVS and I have few comments.

First is that mkfs output might exceed 10k buffer you have assigned to it,
and if messages that mkfs print would exceed 10k+pipe buffer size,
then mkfs process would block and you'd never get it to return
(and I do not see you have any way to exit on timeout or send a signal
 to hung process on timeout).

Then I believe Hans asked you to display credits not only for reiserfsck, but
also for mkreiserfs. (and other reiserfs utilities if you run them).

Also just a note, you can return your own errors as negative exit codes
and pass utilities exit codes as it is.
So if the exit code of child process is bigger than 128, you can substract
this value from 255 and decide what error was caused that tool was not run.
Also you'd avoid a clash between EPERM vs FSCK_CORRECTED this way.

Ah, and please change recommended version of reiserfsprogs to 3.x.1b,
because 3.x.1a is not recommended in fact and have some known problems.

Thank you.

Bye,
    Oleg
