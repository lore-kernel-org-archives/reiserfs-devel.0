From: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Subject: Re: [PATCH CFT] tons of logging patches
Date: Tue, 04 Jun 2002 02:45:18 +0200
Message-ID: <3CFC0D9E.60000@mb.tu-ilmenau.de>
References: <1023076301.22608.1778.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10493-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hi!

On 06/03/2002 05:51 AM, Chris Mason wrote:
> Hello everyone,
> 
> ftp.suse.com/pub/people/mason/data-logging
> 
> has beta code that gives you the following:
> 
> external logging devices
> data logging mount option (makes fsync and O_SYNC faster)
> ordered data mount option (no more garbage in your files after a crash)

Just a short dumb question inbetween: Is it allowed (...wished and 
healthy?!) to use both options together? Should look like "mount -o 
data=journal,data=ordered ...", yes? (mount-options referring to your 
latest ftp...README)

> 
> optimizations to keep kupdate from triggering commits every 5 seconds
> optimizations for tiny transactions to reduce CPU usage and IO.
> optimizations for better locking and fewer calls to wakeup()
> 
[...]

Thank you,

Manuel

