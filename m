From: Oleg Drokin <green@namesys.com>
Subject: Re: Procedure to recover a bad superblock
Date: Tue, 19 Aug 2003 09:41:34 +0400
Message-ID: <20030819054134.GH10536@namesys.com>
References: <1061131936.3001.8.camel@headoffice.hazelden.ca> <20030818061941.GC16183@namesys.com> <1061207028.3736.17.camel@headoffice.hazelden.ca> <20030818133329.GD10536@namesys.com> <1061216567.3562.50.camel@headoffice.hazelden.ca>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15373-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1061216567.3562.50.camel@headoffice.hazelden.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "John P. New" <jnew@hazelden.ca>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Mon, Aug 18, 2003 at 10:22:47AM -0400, John P. New wrote:

[...]

> Set flags in SB:
> Is this ok ? (y/n)[n]: y
> The fs may still be unconsistent. Run reiserfsck --check.
> And then I ran reiserfsck --check --logfile /root/rfscheck.log /dev/md1
> and got (edited):

[...]
 
> Bad root block 0. (--rebuild-tree did not complete)
> Aborted (core dumped)

> Now what? Is it time for a --rebuild-tree, or are we past that because
> of the 'Bad root block 0. (--rebuild-tree did not complete)' error?

Well, since your superblock was completely destroyed, we no longer know where rootblock is.
So you need to run reiserfsck --rebuild-tree now

Bye,
    Oleg
