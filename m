From: Oleg Drokin <green@namesys.com>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 13:02:02 +0400
Message-ID: <20030331130202.I25533@namesys.com>
References: <20030331124109.G25533@namesys.com> <Pine.GSO.4.21.0303311044560.4102-100000@pille>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13466-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.21.0303311044560.4102-100000@pille>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Soeren Sonnenburg <sonne@first.gmd.de>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 10:48:51AM +0200, Soeren Sonnenburg wrote:
> > > /dev/md0 but that one just segfaults (unfortunately I have gcc on that
> > > machine as /usr /var are on the stripeset :-( ).
> > Is it just segfaults without any messages?
> right. it says no standard journal somewhen before crashing but thats
> it...

Can you quote the exact message?

> > What reiserfsprogs version do you use?
> reiserfsprogs-3.6.5-pre2

And can you try reiserfsprogs-3.6.5? hmm, your gcc is not accessible. I can supply you
with the binary.

You can supply -l /path/somefile to reiserfsck and it will put its log to
/path/somefile instead of stdout. Also if you then capture 
stderr with mouse (cut'n'paste) or by using script(1), or in some other way,
and then in case of crash you will supply us with those stdout/stderr outputs
(and core file, if you'd run our binary)

Bye,
    Oleg
