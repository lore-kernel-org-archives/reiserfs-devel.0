From: Oleg Drokin <green@namesys.com>
Subject: Re: oops reiser4, 2.5.60
Date: Sat, 15 Feb 2003 13:46:08 +0300
Message-ID: <20030215134608.A2478@namesys.com>
References: <15947.44879.855354.614016@laputa.namesys.com> <20030213203235.E17656@humilis> <20030214095359.D10351@namesys.com> <20030214221653.H26095@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030214221653.H26095@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Hello!

On Fri, Feb 14, 2003 at 10:16:53PM +0100, Ookhoi wrote:

Well, that look like our profiling code does not work nice :)
I will highlight the option you need to left enabled.
Other reiser4 debugging stuff is not needed.

> CONFIG_REISER4_FS=y
> CONFIG_REISER4_CHECK=y
> CONFIG_REISER4_DEBUG=y
> CONFIG_REISER4_DEBUG_MODIFY=y
> CONFIG_REISER4_DEBUG_MEMCPY=y
> CONFIG_REISER4_DEBUG_NODE=y
> CONFIG_REISER4_ZERO_NEW_NODE=y
> CONFIG_REISER4_TRACE=y
> CONFIG_REISER4_DEBUG_OUTPUT=y

Also please disable "preemptive kernel", we do not test in this mode
yet.

Thank you.

Bye,
    Oleg
