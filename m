From: Oleg Drokin <green@namesys.com>
Subject: Re: 32bit UID/GID's Quota in 2.4!
Date: Fri, 11 Jul 2003 09:39:10 +0400
Message-ID: <20030711053910.GA12924@namesys.com>
References: <200307102119.11860.christian.mayrhuber@gmx.net> <20030711000807.58fa86a7.philippe.gramoulle@mmania.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14873-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030711000807.58fa86a7.philippe.gramoulle@mmania.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philippe Gramoull? <philippe.gramoulle@mmania.com>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Fri, Jul 11, 2003 at 12:08:07AM +0200, Philippe Gramoull? wrote:

> I haven't had time to look how "new" this quota code is and if it differs
> from what is actually available through external patches though.

I see that the Config.in stuff is a bit different. Also comment says it is 2.5 backport,
not quotav2 for 2.4 patches that were floating around.
I plan to look at it closer soon and port reiserfs quota to new interface if necessary.

> Christian Mayrhuber <christian.mayrhuber@gmx.net> wrote:
>   | Finally this should mean there is a possibility to get reiserfs data logging + quota into the 2.4 kernel, doesn't it?

Well, only if won't be counted as a new feature ;) (so I guess we need to mark it as a "bugfix")

Bye,
    Oleg
