From: Chris Mason <mason@suse.com>
Subject: Re: 3.6.25 - Journal replayed back to 3 weeks ago
Date: Thu, 15 Jan 2004 12:56:08 -0500
Message-ID: <1074189367.29546.40.camel@tiny.suse.com>
References: <1073933244.2405.44.camel@neilvaiogt.superbase.co.uk>
	 <1073934293.32706.861.camel@tiny.suse.com>
	 <1074144196.2397.38.camel@neilvaiogt.superbase.co.uk>
	 <1074178426.29550.19.camel@tiny.suse.com>
	 <1074184418.2397.84.camel@neilvaiogt.superbase.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16527-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1074184418.2397.84.camel@neilvaiogt.superbase.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Neil Robinson <neilr@superbase.co.uk>
Cc: reiserfs-list@namesys.com

On Thu, 2004-01-15 at 11:33, Neil Robinson wrote:

> > Ok, please tell me more about the vmware setup.  Is are the vmware
> > drives configured to do copy on write?
> 
> According to the documentation, changes made to the virtual drives are
> committed to the physical drive immediately. Here is the salient info
> from the dmesg:

vmware has a mode where the changes are written to a log file instead of
to the main file.  The client doesn't see things are split between two
files, since vmware exports them as a single device.  This allows you to
do fancy things like roll back changes, or share a base file between two
hosts and have changes to into private files.

It's possible that you're in this mode and somehow lost a log file.

Are the virtual drives being exported to linux real block devices in
windows, or are the files on some windows filesystem?

-chris


