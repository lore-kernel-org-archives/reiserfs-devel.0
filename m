From: Chris Mason <mason@suse.com>
Subject: Re: 3.6.25 - Journal replayed back to 3 weeks ago
Date: Thu, 15 Jan 2004 14:35:02 -0500
Message-ID: <1074195302.29549.57.camel@tiny.suse.com>
References: <1073933244.2405.44.camel@neilvaiogt.superbase.co.uk>
	 <1073934293.32706.861.camel@tiny.suse.com>
	 <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
	 <1074178426.29550.19.camel@tiny.suse.com>
	 <1074184418.2397.84.camel@neilvaiogt.superbase.co.uk>
	 <1074189367.29546.40.camel@tiny.suse.com>
	 <1074194392.5141.99.camel@neilvaiogt.superbase.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16532-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074194392.5141.99.camel@neilvaiogt.superbase.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Neil Robinson <neilr@superbase.co.uk>
Cc: reiserfs-list@namesys.com

On Thu, 2004-01-15 at 14:19, Neil Robinson wrote:

> Uh oh, I think I now know what happened. Ouch. I was not clear what the
> REDO files were for, since I seemed to have lots of them taking up a
> considerable amount of drive space. I deleted them (probably taking all
> of my changes with them). On the whole, I am quite relieved. Although I
> did it to myself (this is my first experience using vmware), I realize
> now what happened and it won't happen again. Even more important, it
> seems my problems have nothing to do with the Reiser File System which
> is also a relief. I wish to apologize to you and everyone on the list
> for taking up your time with soething that, as it turns out, has nothing
> really to do with you.
> 
> Thanks for all of your help.

Good news, I wasn't looking forward to hunting that as an FS bug ;-) 
Thanks for the details.

-chris


