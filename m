From: Oleg Drokin <green@namesys.com>
Subject: Re: vpf-10680 corruptions
Date: Sat, 21 Jun 2003 14:41:47 +0400
Message-ID: <20030621104147.GA11301@namesys.com>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com> <3EF0A8E8.2000209@g-house.de> <20030619054535.GA23852@namesys.com> <3EF20728.2080905@g-house.de> <3EF2F315.2080306@g-house.de> <20030620122946.GA24875@namesys.com> <3EF316C7.7010209@g-house.de> <3EF38E0C.3020705@g-house.de> <3EF4357D.9060601@g-house.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EF4357D.9060601@g-house.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Kujau <evil@g-house.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Jun 21, 2003 at 12:37:49PM +0200, Christian Kujau wrote:

> >i'll restest with the "newest reiserfsprogs" from namesys, since i have 
> >3.6.6. here (from debian testing)
> no change with reiserfsprogs-3.6.8.
> but: on ia32 the problem does not occur. i have an AMD 900 here, 2.5.72, 
> reiserfsprogs 3.6.6 (also debian/testing) and there are no corruptions 
> at all with reiserfs. i guess i'll resend this to lk-ml or so.
> sorry for wasting time after it turned out to be probably an arch 
> problem....

Actually it may be not.
There alpha have different page size and that might lead to some unexpected
problems in reiserfs (but it should not).
I want to test that myself, but unfortunatelly it turned out that our
alpha have old suse 6.3 install that is uncapable of building 2.5 kernel.
I guess I wil ltry to cross-compile something.
I just want to judge for myself whenever it is reiserfs problem or not.
Thank you for all of the feedback and tests.

Bye,
    Oleg
