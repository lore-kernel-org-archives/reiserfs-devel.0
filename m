From: Neil Robinson <neilr@superbase.co.uk>
Subject: Re: 3.6.25 - Journal replayed back to 3 weeks ago
Date: Thu, 15 Jan 2004 19:19:52 +0000
Message-ID: <1074194392.5141.99.camel@neilvaiogt.superbase.co.uk>
References: <1073933244.2405.44.camel@neilvaiogt.superbase.co.uk>
	 <1073934293.32706.861.camel@tiny.suse.com>
	 <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
	 <1074178426.29550.19.camel@tiny.suse.com>
	 <1074184418.2397.84.camel@neilvaiogt.superbase.co.uk>
	 <1074189367.29546.40.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16531-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074189367.29546.40.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

On Thu, 2004-01-15 at 17:56, Chris Mason wrote:
> On Thu, 2004-01-15 at 11:33, Neil Robinson wrote:
> 
> > > Ok, please tell me more about the vmware setup.  Is are the vmware
> > > drives configured to do copy on write?
> > 
> > According to the documentation, changes made to the virtual drives are
> > committed to the physical drive immediately. Here is the salient info
> > from the dmesg:
> 
> vmware has a mode where the changes are written to a log file instead of
> to the main file.  The client doesn't see things are split between two
> files, since vmware exports them as a single device.  This allows you to
> do fancy things like roll back changes, or share a base file between two
> hosts and have changes to into private files.
> 
> It's possible that you're in this mode and somehow lost a log file.
> 
> Are the virtual drives being exported to linux real block devices in
> windows, or are the files on some windows filesystem?

Uh oh, I think I now know what happened. Ouch. I was not clear what the
REDO files were for, since I seemed to have lots of them taking up a
considerable amount of drive space. I deleted them (probably taking all
of my changes with them). On the whole, I am quite relieved. Although I
did it to myself (this is my first experience using vmware), I realize
now what happened and it won't happen again. Even more important, it
seems my problems have nothing to do with the Reiser File System which
is also a relief. I wish to apologize to you and everyone on the list
for taking up your time with soething that, as it turns out, has nothing
really to do with you.

Thanks for all of your help.

Ciao, Neil

