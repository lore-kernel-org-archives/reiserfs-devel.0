From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: file-nr, file-max, and ReiserFS
Date: Tue, 22 Oct 2002 10:10:47 UT
Message-ID: <20021022101047.2F232C680@server2.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11738-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Tue, 22 Oct 2002 10:33:49 +0400, "Oleg Drokin"
<green@namesys.com> said:
> > The ReiserFS server (running Cyrus and Postfix) has been hitting our
> > max FDs (/proc/sys/fs/file-max) a few times, which is set at 90,000.
> > However, we have an Ext3 server with almost the same # of users and
> > overall load, and it has only hit 20,000 open files (according to
> > /proc/sys/fs/file-nr).
>
> There must be the difference between your ext3 based and reiserfs based
> systems that will explain FD usage difference. Something in userspace
> most probably.
<...>

Sorry to waste your time--we've identified the problem and it wasn't
ReiserFS related. Turns out we introduced a bug into our LMTP proxy that
was only triggered by a rare event--it so happened this event was related
to an email sent to this particular server. 

<...>
> > showed 30,000 files as open (when the system had actually only used
> > 20,000 handles according to file-nr). I guess I'm wrong to be
> > thinking that lsof and file-nr should show the same number of open
> > files, but could someone explain why?
>
> Well, file descriptors might be shared between processes/threads, but
> lsof does not know about this
>
Me being dumb again... Well, kinda... turns out that the docs for file-nr
in the Linux source tree are wrong. For the record, the correct
information is here:  http://www.cs.tau.ac.il/~didi/file-nr.html

When interpreted correctly, the counts are pretty close.
