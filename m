From: Oleg Drokin <green@namesys.com>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 13:05:04 +0400
Message-ID: <20020407130504.A13396@namesys.com>
References: <20020407021043.A10976@namesys.com> <Pine.LNX.4.44.0204071200240.1561-100000@idi.vamo.orbitel.bg>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204071200240.1561-100000@idi.vamo.orbitel.bg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 07, 2002 at 12:01:13PM +0300, Ivan Ivanov wrote:
> > > Reiserfs is very sensitive to disk damage. Several bad blocks on disk can
> > > make the entire file system unusable and all data to be lost:
> > > 'reiserfsck --fix-fixable' tells that I must use --rebuild-tree but it
> > > doesn't help.
> > Have you tried latest reiserfsprogs?
> > We are interested in such damaged filesystems, that cannot be repaired with
> > latest reiserfsprogs.
> I am using reiserfsprogs-3.x.1b

Ok, and reiserfsck - failed to repair the FS? Did it segfaulted or did
it just finished the work, but FS was still damaged, or something else?

Thank you.

Bye,
    Oleg
