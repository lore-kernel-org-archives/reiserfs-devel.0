From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Wed, 5 Jun 2002 12:43:32 +0400
Message-ID: <20020605124332.A17867@namesys.com>
References: <1023076301.22608.1778.camel@tiny> <3CFC1CB5.8040102@mb.tu-ilmenau.de> <1023159462.31682.54.camel@tiny> <3CFC3F0B.6060707@mb.tu-ilmenau.de> <1023197656.31475.101.camel@tiny> <3CFD2F32.7070701@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10513-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3CFD2F32.7070701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 05, 2002 at 01:20:50AM +0400, Hans Reiser wrote:
> >BTW, for general usage, the most important speedup in these patches is
> >the commit_super patch.  The namesys guys already have that in the queue
> >of stuff to send for 2.4.20-pre.
> You will see substantial performance increases in 2.4.20
> Oleg is doing a complete rewrite of our write function, and is seeing 
> large file performance increases of 25%.

Note that I see only 25+% performance increase CPU-wise. Since the task
is io-bound real time does not change much (unless one runs tests
on the ramdisk or similar (by speed) kind of storage).

Bye,
    Oleg
