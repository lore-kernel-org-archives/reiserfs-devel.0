From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 14:21:10 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0204071407220.25447-100000@dns.vamo.orbitel.bg>
References: <20020407141149.A13669@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020407141149.A13669@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com



On Sun, 7 Apr 2002, Oleg Drokin wrote:

> Hello!
>
> On Sun, Apr 07, 2002 at 12:17:36PM +0300, Ivan Ivanov wrote:
> > > Ok, and reiserfsck - failed to repair the FS? Did it segfaulted or did
> > > it just finished the work, but FS was still damaged, or something else?
> > It finished work ok, but the filesystem is damaged.
>
> How can you tell?
> Did sybsequent run of reiserfsck --check finds any errors or did kernel
> prints error messages, or any other criteria?
>
> Thank you.
>
> Bye,
>     Oleg
>
>

So,  reiserfsck --check tels that I must run  reiserfsck --rebuild-tree.
I am running  reiserfsck --rebuild-tree two times and it tels everything
is OK.  reiserfsck --check tels OK too. But mount tels that directory not
found. What directory !! may be /. mount -t reiserfs tels the same.

I am trying to reproduce this again but I can't, I filled with "0" random
parts of the file and may be I can't hit the right blocks now.
When ReIsEr2 is zeroed reiserfsck --rebuild-sb and then reiserfsck
--rebuild-tree work fine - everything is recovered.

kernel is 2.4.18 with reiserfs quota patches.
reiserfsprogs 3.x.1b

-----
Regards
Ivan



