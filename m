From: Oleg Drokin <green@namesys.com>
Subject: Re: kernel go-slow
Date: Thu, 6 Feb 2003 19:48:03 +0300
Message-ID: <20030206194803.A2637@namesys.com>
References: <200302030027.40936.russell@coker.com.au> <20030206142649.A27228@t-raenon.nmd.msu.ru> <20030206193247.A29026@t-raenon.nmd.msu.ru> <200302061741.46153.russell@coker.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12664-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302061741.46153.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: flx@msu.ru, ReiserFS <reiserfs-list@namesys.com>

Hello!

On Thu, Feb 06, 2003 at 05:41:46PM +0100, Russell Coker wrote:

> > but there is possible situations that will not generate disk activity,
> > but may cause your system to "go-slow", if there you have some
> > unussual IO numbers while disk activity is moderate to low -
> > most likely same sweet pair.
> The problem is that sar etc product jumbled results.  Profiling the kernel may 
> help, but may also hide the error, and it's not something I can easily do.

Well, you can do it very easily.
reboot with "profile=2" kernel option.
when 100% sys cpu situation started - execute readprofile -r
when it is finished, execute readprofile -m /path/to/System.map >somefile
then sort somefile and you are done, you are now seeing where is most of the time
is spent.

> The servers are locked in a managed server room on the other side of the city 
> so seeing the blinken lights is not an option.

;)
<humour>webcam</humour>

> I've put the aa1 kernel on half the machines and now I'll wait to see what 
> happens.  If the aa1 machines don't have the problem but the others do then 
> I'll go all aa1.

Ah, if your problem was with highmem I/O not present, then that might actually help.

Bye,
    Oleg
