From: Oleg Drokin <green@namesys.com>
Subject: Re: file-nr, file-max, and ReiserFS
Date: Tue, 22 Oct 2002 10:33:49 +0400
Message-ID: <20021022103349.A1039@namesys.com>
References: <20021022044118.074F5ECC7@server2.fastmail.fm>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20021022044118.074F5ECC7@server2.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JP Howard <jh_lists@fastmail.fm>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Tue, Oct 22, 2002 at 04:41:17AM +0000, JP Howard wrote:

> The ReiserFS server (running Cyrus and Postfix) has been hitting our max
> FDs (/proc/sys/fs/file-max) a few times, which is set at 90,000. However,
> we have an Ext3 server with almost the same # of users and overall load,
> and it has only hit 20,000 open files (according to
> /proc/sys/fs/file-nr).

Filesystems itself does not consume file descriptors.

> Does ReiserFS use more file handles for some reason? Is there any

Not likely.

> downside to setting file-max to something really big to avoid running out
> of FDs? Do you think that this may actually indicate some problem with

More fds you use, more RAM they consume ;)

> our configuration, or this normal for ReiserFS?

There must be the difference between your ext3 based and reiserfs based systems
that will explain FD usage difference. Something in userspace most probably.

> Also, I checked with `lsof | wc -l` to see how many files it reported as
> open. On the ReiserFS server it only showed 45,000 files as open (when
> the system had actually used all 90,000 handles). On the Ext3 server is

If the system is really used all 90000  handles, you would not be able to look
at /proc/sys/fs/file-nr content, so perhaps the peak was over already at a time
you reviewed it?

> showed 30,000 files as open (when the system had actually only used
> 20,000 handles according to file-nr). I guess I'm wrong to be thinking
> that lsof and file-nr should show the same number of open files, but
> could someone explain why?

Well, file descriptors might be shared between processes/threads, but
lsof does not know about this

Bye,
    Oleg
