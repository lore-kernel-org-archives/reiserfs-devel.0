From: James Morris <jmorris@namei.org>
Subject: Re: Reiserfs.c bug in 3.2-rc5
Date: Wed, 4 Jan 2012 12:02:36 +1100 (EST)
Message-ID: <alpine.LRH.2.00.1201041200450.18323@tundra.namei.org>
References: <43556.213.228.140.150.1323560920.squirrel@webmail.decimal.pt> <20111213180707.GI11747@quack.suse.cz> <!&!AAAAAAAAAAAYAAAAAAAAAKCACr8ZwetPrGXZsycJodKihAAAEAAAAGPJDX4w3wxIo8Onu2+q/xMBAAAAAA==@decimal.pt> <20120102115222.GA3626@quack.suse.cz>
 <20120103010826.GF3626@quack.suse.cz> <20120103123841.GA31457@quack.suse.cz> <1325604356.2095.23.camel@falcor> <CA+55aFzwq6XiAnX26uV+-mNsbGbnj0S=4nP5avPqKPw8OT+cmw@mail.gmail.com> <1325616312.2095.26.camel@falcor> <alpine.LRH.2.00.1201041046330.18098@tundra.namei.org>
 <CA+55aFxZ4_T8VRh6wAKC9-9PjsctrK1WnOmN-2EDNTeHA+OA4g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CA+55aFxZ4_T8VRh6wAKC9-9PjsctrK1WnOmN-2EDNTeHA+OA4g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, haiyangz@microsoft.com, hjanssen@microsoft.com, "Rafael J. Wysocki" <rjw@sisk.pl>, Jorge Bastos <mysql.jorge@decimal.pt>, Mark Fasheh <mfasheh@suse.com>, Joel Becker <jlbec@evilplan.org>

On Tue, 3 Jan 2012, Linus Torvalds wrote:

> Can everybody please test and double-check that what I applied was
> what everybody agrees is the RightThing(tm)? I really wanted to do 3.2
> today, but both of those commits are of the "please double-check"
> kind, so..

Boots up ok for me, although I'm not using reiserfs or ocfs2.  The patch 
looks correct.


Thanks.



- James
-- 
James Morris
<jmorris@namei.org>
