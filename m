From: Oleg Drokin <green@namesys.com>
Subject: Re: FIFO files
Date: Wed, 18 Jun 2003 10:17:21 +0400
Message-ID: <20030618061721.GA15283@namesys.com>
References: <20030617162127.GA14124@chepelov.org> <3EEF40B3.6000300@gmx.net> <3EEF42B6.1000409@namesys.com> <3EEF4929.20503@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14595-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EEF4929.20503@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Hans Reiser <reiser@namesys.com>, Cyrille Chepelov <cyrille@chepelov.org>, reiserfs-list@namesys.com

Hello!

On Tue, Jun 17, 2003 at 07:00:25PM +0200, Carl-Daniel Hailfinger wrote:
> Yes, but if I understood Cyrille correctly, her/his(?) needs should be
> completely satisfied by sparse files.
> One process can append records at the end, and one other process can read
> records from the beginning of the file, marking the read data empty. The

Hm, I am sorry, but this part is unclear.
I do not remember any API to create holes in existing files in place of already
present data.

Bye,
    Oleg
