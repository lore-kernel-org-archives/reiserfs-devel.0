From: Oleg Drokin <green@namesys.com>
Subject: Re: Hangs and crashes, reiserfsck --rebuild-tree fails?
Date: Tue, 4 Mar 2003 17:40:15 +0300
Message-ID: <20030304174015.A8888@namesys.com>
References: <3E64B76A.6030109@acris.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13062-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E64B76A.6030109@acris.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julian Hall <jules@acris.co.uk>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Mar 04, 2003 at 02:25:46PM +0000, Julian Hall wrote:

> I seem to have some corruption on one of my file systems and don't seem 
> to be able to fix it.  The problem manifests itself by (apparently) 
> random crashes and hangs whenever the file system is mounted, usually 
> within 10-15 minutes of the last reboot.

Is it produsing any kernel messages, Can we get a sample please?

> I tried to fix the problem using reiserfsck, and it advised me that I 
> needed to use --rebuild-tree, so I ran that.  These are the messages 
> that were produced:
> Pass 2:
> 0%....20%....40%....60%....Not enough allocable blocks, checking 
> bitmap...there are 0 allocable blocks, btw
> out of disk space
> Aborted

Hm. Can you send us metadata snapshot for this FS?
just do debugreiserfs -p /dev/your_device | bzip2 -c >metadata.bz2
and then make this metadata.bz2 file available for download.
Thank you.

Bye,
    Oleg 
