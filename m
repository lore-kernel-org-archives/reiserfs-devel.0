From: Jeff Davis <reiser-list@empires.org>
Subject: Re: reiser4 as module
Date: Wed, 21 Jul 2004 21:22:10 -0700
Message-ID: <1090470129.1676.56.camel@jeff>
References: <20040721231748.46066.qmail@web60310.mail.yahoo.com>
	 <1090461647.1676.16.camel@jeff>  <40FF397C.1000402@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FF397C.1000402@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


> I don't know how to get UML to work with reiser4, but I'm sure it can be
> done, as I've heard Namesys people say they use that to develop under.
> So there, yes, you'd have to reboot your UML kernel, but you could be
> doing other things while that happened -- and it wouldn't take long for
> it to reboot anyway.
> 

Thanks. I think I'll try UML, I've been meaning to try that for a while.

> Possible, and may have some other uses.  But why would anyone want to
> put config files in a database?  With reiser4's handling of small files
> and things like NFS, I can't find a single reason.  Also, if you're

My idea was more from concern about duplicating data. Let's say it's DNS
data that you already have in a SQL database, and you just want the
named.conf to reflect the data without using update scripts.

> going to start python, run a python script which accesses a database,
> take the results and send them to kernel space, then back to user space,
> you're talking about serious performance issues vs. just leaving the
> config files alone, as flat text.

Yeah, which sometimes matters, and sometimes doesn't (like when reading
a config file).

> cd /path/to
> mkfifo script.pipe
> while true; do
> 	./script.py > script.pipe;
> done

Wow. I feel dumb. That pretty much takes care of my problems right
there. Thanks for educating me.

Regards,
	Jeff




