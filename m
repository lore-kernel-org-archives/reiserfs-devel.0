From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: more follow up Re: kernel messages. Re: reiser4 firefox hangs
 due to fsync, sysrq-t dump
Date: Mon, 07 Jan 2008 01:09:54 +0300
Message-ID: <478151B2.3080502@gmail.com>
References: <14514445.post@talk.nabble.com> <14533387.post@talk.nabble.com> <5c7c368b0712291235m546eca35ne25548edffcdbf42@mail.gmail.com> <14546580.post@talk.nabble.com> <14547147.post@talk.nabble.com> <14567477.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14567477.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: butdiene <butdiene@yahoo.com>
Cc: reiserfs-devel@vger.kernel.org

butdiene wrote:

>Hi Edward,
>
>more kernel messages (both before and after disabling reiser4-debug option),
>including those reported before,
>  
>

Hello.

Many thanks!
I don't see any leak in those messages. However, such big atoms
(atom_max_size=0x2f20c =~ 0.75G) is not that we really want
to have in your system ;)
Would you please repeat it with atom_max_size=0x200 (pass to the
bootloader  "rootflags=tmgr.atom_max_size=512") plus let's take a look
at vmstat statistics (type `vmstat 2 > vmstat_output` at the beginning of
every session).
So for every session attach the following info:
. cat /proc/mounts output
. kernel messages
. vmstat_output

Thanks,
Edward.
