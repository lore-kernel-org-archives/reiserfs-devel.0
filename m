From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: Reiserfs.c bug in 3.2-rc5
Date: Tue, 03 Jan 2012 13:45:11 -0500
Message-ID: <1325616312.2095.26.camel@falcor>
References: <43556.213.228.140.150.1323560920.squirrel@webmail.decimal.pt>
	 <20111213180707.GI11747@quack.suse.cz>
	 <!&!AAAAAAAAAAAYAAAAAAAAAKCACr8ZwetPrGXZsycJodKihAAAEAAAAGPJDX4w3wxIo8Onu2+q/xMBAAAAAA==@decimal.pt>
	 <20120102115222.GA3626@quack.suse.cz> <20120103010826.GF3626@quack.suse.cz>
	 <20120103123841.GA31457@quack.suse.cz> <1325604356.2095.23.camel@falcor>
	 <CA+55aFzwq6XiAnX26uV+-mNsbGbnj0S=4nP5avPqKPw8OT+cmw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFzwq6XiAnX26uV+-mNsbGbnj0S=4nP5avPqKPw8OT+cmw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, haiyangz@microsoft.com, hjanssen@microsoft.com, "Rafael J. Wysocki" <rjw@sisk.pl>, James Morris <jmorris@namei.org>, Jorge Bastos <mysql.jorge@decimal.pt>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>

On Tue, 2012-01-03 at 08:48 -0800, Linus Torvalds wrote:
> On Tue, Jan 3, 2012 at 7:25 AM, Mimi Zohar <zohar@linux.vnet.ibm.com> wrote:
> >
> > Commit fb88c2b changed the security_old_inode_init_security() return
> > code for S_PRIVATE inodes. As long as -EOPNOTSUPP is expected, probably
> > should revert that as well.
> >
> > (I'm cc'ing the ocfs2 maintainers.)
> 
> Jan, Joel? Can you confirm? I was planning on doing 3.2 today, but
> maybe I can't, or maybe we need to punt this to be a stable patch.
> 
> But maybe we can have quick testing and agreement? Does everybody
> agree on both Honza's patch *and* revert of fb88c2b? Does the
> EOPNOTSUPP return case match what we used to do?
> 
>                           Linus
> 

Just clarifying not all of commit fb88c2b, but only the
security_old_inode_init_security() hunk.

Mimi

