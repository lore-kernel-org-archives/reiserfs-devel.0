From: Mat <jackdachef@gmail.com>
Subject: Re: BUG: using =?utf-8?b?c21wX3Byb2Nlc3Nvcl9pZCgp?= in preemptible [00000000] code: khungtaskd/764, disk takes pretty long to commit files to disk
Date: Sat, 25 Apr 2009 20:59:48 +0000 (UTC)
Message-ID: <loom.20090425T205448-34@post.gmane.org>
References: <loom.20090425T203214-959@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Mat <jackdachef <at> gmail.com> writes:

>> 
> kernel is 2.6.30-rc2-zen0 (the additional features added on top 
> of Linus' tree
> can be seen at: http://git.zen-sources.org/?p=zen.git;a=shortlog)

the parts which are of importance for me are mostly coloured kernel-output,
reiser4-support, fbcondecor, compcache and eventually bfq and slqb for testing
purposes

there is an nvidia-driver loaded 185.18.04

here's another output of dmesg which should show the complete output since
I mounted the partition:

http://nopaste.info/11e8264d13.html


> 

Regards

Mat

