From: Chris Mason <mason@suse.com>
Subject: Re: 2.4.22-pre5+dl going into a loop while unlink()ing
Date: 14 Jul 2003 09:27:32 -0400
Message-ID: <1058189251.13318.162.camel@tiny.suse.com>
References: <20030714151230.7e79574f.petchema@concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030714151230.7e79574f.petchema@concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

On Mon, 2003-07-14 at 09:12, Pierre Etchemaite wrote:
> 	Hi,
> 
> I compiled a 2.4.22-pre5 kernel with current data-logging patch (for
> 2.4.22), all went right 'til I removed a second 600mb file from a partition.
> At that point, the kernel started writing to the disk at full speed (as
> reported by gkrellm), and the disk was no longer available for anything
> else.
> 
> I hit the red button, booted using a failsafe 2.4.20 kernel with no
> data-logging, and reiserfsck 3.6.8 from the recovery partition found
> nothing wrong.
> 
> Rebooted again with the new kernel, and the kernel got stuck again during
> unlink()s replay! I had to boot using 2.4.21 + dl, that could replay unlinks
> without chocking...
> 
> Sadly the dumpreiserfs from recovery partition was outdated and didn't even
> recognize the partition as being reiserfs-formated :(
> Hopefully the problem should not be too hard to reproduce (I wasn't even
> trying to trigger it !), tell me if you can't...

Hmmm, unlinking large files works for me here, what does reiserfsck have
to say about your disk?

If you could try to reproduce and get the output from sysrq-t a few
times during the hang, it would help.

-chris




