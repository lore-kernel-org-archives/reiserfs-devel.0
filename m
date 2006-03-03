From: "Clemens Eisserer" <linuxhippy@gmail.com>
Subject: Re: [PATCH] reiserfs: reiserfs_file_write will lose error code when a 0-length write occurs w/ O_SYNC
Date: Fri, 3 Mar 2006 23:00:13 +0000
Message-ID: <194f62550603031500q7f9b9bd6u@mail.gmail.com>
References: <20060302210947.GA16696@locomotive.unixthugs.org>
	 <20060302153358.4cace15e.akpm@osdl.org> <44087D67.2000104@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28208-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44087D67.2000104@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> I suggest that they sit in -mm or an rc for ~2 weeks before they go in.
> If 2.6.16 is coming out before then, then let it ship without them.  All
> of these things are pretty obscure/rare, so not unsettling the code
> matters more than getting them in.

I know this sounds quite a bit stupid but does that mean Reiser4 will
be included into the mainline kernel? Would be great :-)

lg Clemens
