From: Oleg Drokin <green@namesys.com>
Subject: Re: bug report
Date: Tue, 29 Apr 2003 12:45:47 +0400
Message-ID: <20030429084547.GM1231@namesys.com>
References: <Pine.LNX.4.53.0304281636140.366@max15g> <20030429054902.GA16939@namesys.com> <Pine.LNX.4.53.0304290436500.138@max15g>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13896-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0304290436500.138@max15g>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robs@op.net
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Apr 29, 2003 at 04:41:32AM -0400, robs@op.net wrote:

> Update:  I have it working.  I had to make a new separate journal device,
> happened to use /dev/hdb3, then had to run:
> reiserfstune --make-journal-standard -j /dev/hdb3 /dev/hdb1
> etc.  Had to do it several times.  Tried it with "--no-journal-available"
> but it would tell me I had a "separated journal device".  (or something like

Hm, this is strange that it did not worked, because it was supposed to.
Time to verify this stuff again, I guess.
Thanks for bringing this to our attention.

Bye,
    Oleg
