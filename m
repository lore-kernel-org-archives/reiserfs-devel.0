From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 12:00:14 +0400
Message-ID: <20030331120014.C25533@namesys.com>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13457-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331074957.GD22731@cherenkov.orbis-terrarum.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Mar 30, 2003 at 11:49:57PM -0800, Robin H. Johnson wrote:
> > Can you please make a metadata dump for us?
> > "debugreiserfs -p /dev/hdb1 | bzip2 -9c >metadata.bz2" and make this file
> > available for us to download.
> Stderr output of debugreiserfs here:
> http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.run

"bread: Cannot read the block (18)."
Well, now this is something.
Do you have I/O errors messages in kernel logs, or do you know another reason for
it to fail reading 18th block?
Perhaps try to run "badblocks -b 4096" to find out if there are more blocks
that cannot be read?

> > Thank you.
> No, most definitely thank you. Now I have more ammunition against my boss
> as to why Open Source is better. You guys really rock. I'd never get a
> response from any other vendor this quickly (even though we pay some of
> them a fair sum).

We accept money too ;)

> A question for you, so I can support things. Is there a list somewhere
> of features requested, and how much you money you want to be paid to add
> them in? Especially the smaller features (hint hint).

Well, there is http://namesys.com/support.html , as of features, usually
we expect customers to come up with features they need. If you lack something
in reiserfs and you are willing to pay, we can implement it.
If you are happy with the current features-set, why to pay for features that
would be never used?

Bye,
    Oleg
