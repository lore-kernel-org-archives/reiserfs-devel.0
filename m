From: Anders Widman <andewid@tnonline.net>
Subject: Re: What Filesystem?
Date: Wed, 29 Jan 2003 16:32:43 +0100
Message-ID: <128182957062.20030129163243@tnonline.net>
References: <3E38378A.8030406@jtmstudio.fsbusiness.co.uk>
 <20030129152815.GB28632@willow.seitz.com>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030129152815.GB28632@willow.seitz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> On Wed, Jan 29, 2003 at 03:20:26PM -0500, James Thompson wrote:
>> I am a visual artist and musician.

> Check out the document at
> http://myweb.cableone.net/eviltwin69/ALSA_JACK_ARDOUR.html.  There a
> section that benchmarks various filesystems for their latency.  The
> short story is that Reiserfs wins handily over Ext2, Ext3, and FAT32
> (duh!  why would someone test that...).

Simply  because FAT filesystem is very simple and has little overhead.
If  dealing  with  little  amount  of files and folders then it can be
rather quick, especially if you need CPU resources to other things.

>   Unfortunately, there's no
> comparison between Reiser/JFS/XFS.  I think that would be more of a fair
> match.

> Anyhow though, for general low-latency multimedia work, ReiserFS looks
> like it's a good choice.

