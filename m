From: Oleg Drokin <green@namesys.com>
Subject: Re: journal-712; buffer write failed
Date: Wed, 31 Jul 2002 19:35:14 +0400
Message-ID: <20020731193514.A13764@namesys.com>
References: <200207311338.57312.malcolm.agnew@t-online.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11106-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200207311338.57312.malcolm.agnew@t-online.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Malcolm Agnew <malcolm.agnew@t-online.de>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jul 31, 2002 at 01:38:57PM +0200, Malcolm Agnew wrote:

> file as it grows), I get the report :
> 	"journal-712; buffer write failed"
> But not every time I run the program (circa 1 in 3). i.e. 5 crashes this
> morning.

Looks like I/O error to me still.
Can you attach serial console to that box and see what other error messages from
kernel are, if any?
Or just convert reiserfs_panic to reiserfs_warning so that you can
see other error messages.

Bye,
    Oleg
