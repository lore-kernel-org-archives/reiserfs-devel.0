From: Oleg Drokin <green@namesys.com>
Subject: Re: write barrier patches for 2.4.21
Date: Wed, 27 Aug 2003 10:41:03 +0400
Message-ID: <20030827064103.GA29131@namesys.com>
References: <20030825170849.GA14811@mfa.kfki.hu> <20030826214624.GA410@zero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15454-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030826214624.GA410@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Vier <tmv@comcast.net>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hello!

On Tue, Aug 26, 2003 at 05:46:24PM -0400, Tom Vier wrote:

> anyone working on scsi wb's? there was a long thread on l-k about wb's, but
> i wasn't aware what came of it.

There was a discussion about that on Kernel Summit 2003 and general opinion was that SCSI
does not need the WB stuff at all as it does the correct thing anyway.
But since the the barrier flags are visible in io requests, actual device drivers
are free to do something when met with barrier requests or to ignore it.
The only concern is probably raid cards that show bunch of IDE drives as a SCSI device.

Bye,
    Oleg
