From: "Martin J. Bligh" <mbligh@aracnet.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:00:54 -0700
Message-ID: <57730000.1093554054@flay>
References: <Pine.LNX.4.44.0408261356330.27909-100000@chimarrao.boston.redhat.com><Pine.LNX.4.58.0408261101110.2304@ppc970.osdl.org> <45010000.1093553046@flay> <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20805-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408261348500.2304@ppc970.osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Rik van Riel <riel@redhat.com>, Diego Calleja <diegocg@teleline.es>, jamie@shareable.org, christophe@saout.de, vda@port.imtp.ilyichevsk.odessa.ua, christer@weinigel.se, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

> On Thu, 26 Aug 2004, Martin J. Bligh wrote:
>> 
>> What would "test -d" and "test -f" return on these magic beasties? I can't
>> think of any combinations that wouldn't confuse the crap out of userspace.
> 
> "It's a feature".
> 
> The S_ISDIR/S_ISREG tests show real information: it shows not only user
> intent ("you should consider this a file, even if it has attributes"), but
> also whether it is a directory or a container.
> 
> And there's a real technical difference there: the streams contained
> within a file are bound to that file. The files contained within a
> directory are _independent_ of that directory. Big difference. HUGE
> difference.
> 
> So it's not confusing. If it tests as a file, you think of it as a file.  
> It may have attributes aka named streams associated with it, and you may
> be able to open those attributes by treating the file as a directory, but
> that doesn't really change the fact that it's a file.
> 
> The _big_ difference is that when you can make the compound object _look_ 
> like a directory, that means that you can now manage the attributes with 
> standard tools. They are still attributes, though.

I think what you're saying is that they'd both return positive, right?

Unfortunately I think lots of code in userspace assumes files / directories
are mutually exclusive conditions, and acts accordingly ... eg:

if [ -f file ]
	do file stuff
else
	do directory stuff
fi.

Now I'm not saying they're not broken ... but seems like a dangerous thing 
to change in the midst of a stable kernel series.

M.

