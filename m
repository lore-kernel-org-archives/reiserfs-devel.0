From: Oleg Drokin <green@namesys.com>
Subject: Re: Download recommendation
Date: Wed, 22 May 2002 17:59:25 +0400
Message-ID: <20020522175925.A24841@namesys.com>
References: <Pine.LNX.4.30.0205221446260.14729-100000@vortex.ukshells.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10398-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0205221446260.14729-100000@vortex.ukshells.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Emslie <rxe@ukshells.co.uk>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, May 22, 2002 at 02:52:32PM +0100, Richard Emslie wrote:

> I am about to run some benchmarks...
> I was wondering if
> 4. If you use RedHat Linux distribution version 7.x (or any other
> distribution that ships gcc 2.96), make sure you have your gcc upgraded to
> 2.96-85  (as in RedHat 7.2)

Should read 2.96-85 or later. (web site fixed) 

> is absolutely necessary?  I thought 2.96 subsequent RedHat7.0 was OK.

Yes, it is absolutely necessary.
RedHat 7.1 was shipped with known buggy compiler too.
I do not know how it affected reiserfs, but it miscompiled at least
symbios scsi controller driver. And you do not want to risk if your
code would be miscompiled or not, do you?

Bye,
    Oleg
