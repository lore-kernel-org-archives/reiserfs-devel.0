From: Oleg Drokin <green@namesys.com>
Subject: Re: other OS
Date: Tue, 3 Dec 2002 19:15:36 +0300
Message-ID: <20021203191536.A14650@namesys.com>
References: <3DEBB725.4070907@charter.net> <001501c29a82$0126a110$0101a8c0@bummer>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12090-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <001501c29a82$0126a110$0101a8c0@bummer>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: darren <teodarren@myrealbox.com>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Dec 03, 2002 at 12:11:06PM +0800, darren wrote:

> Was just wondering about the possibilities of using reiserfs on my
> Solaris 6 machine.
> Any chance of that?

If you can convice SUN to pay for the porting of reiserfs to SUN
then it is possible.
Alternativey you can follow htp://namesys.com/support.html instructions.

> I am having problems with FS performance (large number, 20K of small
> files in folder with constant writes and deletes) on the Sun Machine and
> was thinking if this can help me.

Linux is able to run on SUN boxes too, and reiserfs is available for
Linux on any supported hardware if it is littleendian or bigendian.

> The only way I know is to use a Linux machine running reiser and NFS it
> over. But performance will surely be degraded this way....any other
> suggestions?

Switch the OS, switch the OS and the hardware or pay for the porting.
(This is assuming that you did all the necessary tuning of your solaris box
already).

Bye,
    Oleg
