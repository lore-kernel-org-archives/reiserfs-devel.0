From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 02 Sep 2004 10:50:53 +0100
Message-ID: <1094118649.4847.30.camel@localhost.localdomain>
References: <20040829191044.GA10090@thundrix.ch>
	 <3247172997-BeMail@cr593174-a> <20040831081528.GA14371@thundrix.ch>
	 <20040901201608.GD31934@mail.shareable.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21271-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040901201608.GD31934@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jamie Lokier <jamie@shareable.org>
Cc: Tonnerre <tonnerre@thundrix.ch>, "Alexander G. M. Smith" <agmsmith@rogers.com>, spam@tnonline.net, akpm@osdl.org, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, flx@namesys.com, reiserfs-list@namesys.com, vonbrand@inf.utfsm.cl

On Mer, 2004-09-01 at 21:16, Jamie Lokier wrote:
> (For example, if I edit an HTML file which is encoded in iso-8859-1,
> change it to utf-8 and indicate that in a META element, and save it
> under the same name, the full content-type should change from
> "text/html; charset=iso-8859-1" to "text/html; charset=utf-8".)
> 
> I don't see how you can do that without kernel support.
> 
> Don't say dnotify or inotify, because neither would work.

inotify done right is useful here as well as in a lot of other desktop
cases where dnotify doesn't really scale. Its enough to let me

	- Find the new file
	- Virus scan it
	- Classify its possible type heirarchies
	- Index it

Alan

