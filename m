From: "Steve Pratt" <slpratt@us.ibm.com>
Subject: Re: EVMS Reiser FSIM
Date: Fri, 31 May 2002 12:03:18 -0500
Message-ID: <OFAADA662B.00161B0E-ON85256BCA.005CD105@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com


Oleg Drokin wrote:

>On Thu, May 30, 2002 at 12:14:03PM -0500, Steve Pratt wrote:

>Ok, I had a look into the CVS and I have few comments.

>First is that mkfs output might exceed 10k buffer you have assigned to it,
>and if messages that mkfs print would exceed 10k+pipe buffer size,
>then mkfs process would block and you'd never get it to return

Actually, I wasn't doing any read until after the completion of mkfs, so
all it had to do is exceed the pipe buffer.  Good catch.

>(and I do not see you have any way to exit on timeout or send a signal
>to hung process on timeout).

Correct, I have no way to calculate a timeout.  This would be true even if
we move to library calls.  I just have to hope reiserfs utilities never
hang. :-)

>Then I believe Hans asked you to display credits not only for reiserfsck,
but
>also for mkreiserfs. (and other reiserfs utilities if you run them).

Yes.  I'll look at adding something, but I don't want another pop-up on
mkfs. We have had some complaints about too many as it is. I'll see if I
can add something to the options panel.  Is there some specific information
you want displayed besides the version?

>Also just a note, you can return your own errors as negative exit codes
>and pass utilities exit codes as it is.
>So if the exit code of child process is bigger than 128, you can substract
>this value from 255 and decide what error was caused that tool was not
run.
>Also you'd avoid a clash between EPERM vs FSCK_CORRECTED this way.

Will look into this.

>Ah, and please change recommended version of reiserfsprogs to 3.x.1b,
>because 3.x.1a is not recommended in fact and have some known problems.

Done.

Thanks, Steve


