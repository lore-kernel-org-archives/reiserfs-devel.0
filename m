From: Oleg Drokin <green@namesys.com>
Subject: Re: is there a tool to perform flushes?
Date: Thu, 1 Aug 2002 15:24:21 +0400
Message-ID: <20020801152421.A11517@namesys.com>
References: <NGBBKLIHILPCBBMPNKADOEJICAAA.ich@floriangeiges.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11108-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <NGBBKLIHILPCBBMPNKADOEJICAAA.ich@floriangeiges.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Geiges <ich@floriangeiges.de>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Aug 01, 2002 at 01:17:24PM +0200, Florian Geiges wrote:

> is there a tool for to flush everything?

sync(8), you mean?

>  we use suse 7.3 here and sometimes it crashes while shutting down
>  the system. now, every log entry, which could provide us more
> detailled
>  information on that problem is lost, so i think flushing everything
>  all 2 hours would help. thats why i am asking.

If the kernel is crashing, you'd better get yourself serial (null modem)
cable and direct kernel to print its messages to serial port so you
can capture these on the other end of a wire.

Bye, 
    Oleg
