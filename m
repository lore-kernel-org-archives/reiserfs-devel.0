From: Oleg Drokin <green@namesys.com>
Subject: Re: EVMS Reiser FSIM
Date: Fri, 31 May 2002 21:28:17 +0400
Message-ID: <20020531212817.A3867@namesys.com>
References: <OFAADA662B.00161B0E-ON85256BCA.005CD105@pok.ibm.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10472-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <OFAADA662B.00161B0E-ON85256BCA.005CD105@pok.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Pratt <slpratt@us.ibm.com>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, May 31, 2002 at 12:03:18PM -0500, Steve Pratt wrote:

> >(and I do not see you have any way to exit on timeout or send a signal
> >to hung process on timeout).
> Correct, I have no way to calculate a timeout.  This would be true even if
> we move to library calls.  I just have to hope reiserfs utilities never
> hang. :-)

Timeouts are easy. you might even use alarm()+catch SIGALARM.

> >Then I believe Hans asked you to display credits not only for reiserfsck,
> but
> >also for mkreiserfs. (and other reiserfs utilities if you run them).
> Yes.  I'll look at adding something, but I don't want another pop-up on
> mkfs. We have had some complaints about too many as it is. I'll see if I
> can add something to the options panel.  Is there some specific information
> you want displayed besides the version?

I believe Hans want Credits to be displayed.
You can discuss with him whenever he'll be satisfied by some other means

Bye,
    Oleg
