From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 12:01:13 +0300 (EEST)
Message-ID: <Pine.LNX.4.44.0204071200240.1561-100000@idi.vamo.orbitel.bg>
References: <20020407021043.A10976@namesys.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020407021043.A10976@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com



On Sun, 7 Apr 2002, Oleg Drokin wrote:

> Hello!
>
> On Sat, Apr 06, 2002 at 10:36:32AM +0300, Ivan Ivanov wrote:
>
> > Reiserfs is very sensitive to disk damage. Several bad blocks on disk can
> > make the entire file system unusable and all data to be lost:
> > 'reiserfsck --fix-fixable' tells that I must use --rebuild-tree but it
> > doesn't help.
> Have you tried latest reiserfsprogs?
> We are interested in such damaged filesystems, that cannot be repaired with
> latest reiserfsprogs.
>
> Bye,
>     Oleg
>

I am using reiserfsprogs-3.x.1b

----
Ivan


