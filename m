From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 15:33:35 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0204071530480.26261-100000@dns.vamo.orbitel.bg>
References: <20020407161151.A14163@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020407161151.A14163@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com



On Sun, 7 Apr 2002, Oleg Drokin wrote:

> Hello!
>
> On Sun, Apr 07, 2002 at 02:21:10PM +0300, Ivan Ivanov wrote:
>
> > So,  reiserfsck --check tels that I must run  reiserfsck --rebuild-tree.
> > I am running  reiserfsck --rebuild-tree two times and it tels everything
> > is OK.  reiserfsck --check tels OK too. But mount tels that directory not
> > found. What directory !! may be /. mount -t reiserfs tels the same.
>
> Hm. Have you saved a file from that particular experiment?
> Anything was left in logs?
>
> Bye,
>     Oleg
>
>

Sorry, I formated the same file ext3 for comparison - it was stupid.
Nothig unusual in logs:

Apr  6 09:31:22 idi kernel: VFS: Can't find ext3 filesystem on dev
loop(7,0).
Apr  6 09:31:22 idi kernel: VFS: Can't find ext3 filesystem on dev
loop(7,0).
Apr  6 09:31:22 idi kernel: reiserfs: checking transaction log (device
07:00) ...
Apr  6 09:31:22 idi kernel: Using r5 hash to sort names
Apr  6 09:31:22 idi kernel: ReiserFS version 3.6.25
Apr  6 09:33:57 idi kernel: VFS: Can't find ext3 filesystem on dev
loop(7,0).
Apr  6 09:33:57 idi kernel: VFS: Can't find ext3 filesystem on dev
loop(7,0).
Apr  6 09:33:57 idi kernel: reiserfs: checking transaction log (device
07:00) ...
Apr  6 09:33:57 idi kernel: Using r5 hash to sort names
Apr  6 09:33:57 idi kernel: ReiserFS version 3.6.25

------
Ivan



