From: Oleg Drokin <green@namesys.com>
Subject: Re: crash after kernel: clm-6004: convert tail failed inode ... error -28
Date: Fri, 21 Jun 2002 19:59:06 +0400
Message-ID: <20020621195906.A1333@namesys.com>
References: <200206211552.g5LFqqc07539@klee.cb.uni-bonn.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200206211552.g5LFqqc07539@klee.cb.uni-bonn.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Harald van Pee <pee@iskp.uni-bonn.de>
Cc: reiserfs-list@namesys.com

Hello!

On Fri, Jun 21, 2002 at 05:52:52PM +0200, Harald van Pee wrote:
> capacity availible on this disk. But my jobs don't stop writing and so I got 
> a lot of clm-6004: convert tail failed messages, 
> until the kernel the kernel stops working. The last 6 entries in 
> /var/log/messages 
> Is this a known problem and does a patch exists?

Sounds like failed iput journal deadlock.
Chris Mason have a fix as part of the quota patches.
He also might have a separate fix for that.

Bye,
    Oleg
