From: Oleg Drokin <green@namesys.com>
Subject: Re: Procedure to recover a bad superblock
Date: Mon, 18 Aug 2003 17:33:29 +0400
Message-ID: <20030818133329.GD10536@namesys.com>
References: <1061131936.3001.8.camel@headoffice.hazelden.ca> <20030818061941.GC16183@namesys.com> <1061207028.3736.17.camel@headoffice.hazelden.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15361-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1061207028.3736.17.camel@headoffice.hazelden.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John P. New" <jnew@hazelden.ca>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Aug 18, 2003 at 07:43:48AM -0400, John P. New wrote:

> As for what ide devices I have below the softraid, I'm not sure what you
> mean. I have a CD/RW on hda and a Colorado Travan tape drive on hdb, and

I mean on what devices do you build your softraid.

> I ran reiserfsck --rebuild-sb /dev/md1, and it asked me what block size
> to use. I looked at /var/log/messages, and the first boot after the
> power outage log reads:

blocksize is always 4k

> In other words, different block sizes. for the same device. Should I be
> concerned, and what value should I use for reiserfsck?

Sure.
Always givre 4k for now.

Bye,
    Oleg
